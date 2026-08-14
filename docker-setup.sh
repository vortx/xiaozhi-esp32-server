#!/bin/bash
# =============================================================================
# Скрипт установки / обновления сервера Xiaozhi ESP32
# Все файлы создаются в подпапке xiaozhi-server текущего каталога
# (не используется /opt)
#
# Автор оригинала: @VanillaNahida (Bilibili)
# Перевод и адаптация: по запросу
# =============================================================================

# -----------------------------------------------------------------------------
# 0. Определяем корневую папку установки (в текущем каталоге)
# -----------------------------------------------------------------------------
SCRIPT_DIR="$(pwd)"
INSTALL_DIR="${SCRIPT_DIR}/xiaozhi-server"   # всё будет здесь
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1   # переходим в неё для удобства

# -----------------------------------------------------------------------------
# 1. Обработка прерываний (Ctrl+C и Esc)
# -----------------------------------------------------------------------------
handle_interrupt() {
    echo ""
    echo "Установка прервана пользователем (Ctrl+C или Esc)"
    echo "Для переустановки запустите скрипт снова"
    exit 1
}
trap handle_interrupt SIGINT

old_stty_settings=$(stty -g)
stty -icanon -echo min 1 time 0
(
    while true; do
        read -r key
        if [[ $key == $'\e' ]]; then
            kill -SIGINT $$
            break
        fi
    done
) &
trap 'stty "$old_stty_settings"' EXIT

# -----------------------------------------------------------------------------
# 2. Вывод баннера
# -----------------------------------------------------------------------------
echo -e "\e[1;32m"
cat << "EOF"
Автор скрипта: @VORTX
                                                                                                                                                                                                                             
EOF
echo -e "\e[0m"
echo -e "\e[1;36m   Скрипт полной установки сервера Xiaozhi  Ver 0.2  (обновление от 20.08.2025) \e[0m\n"
echo -e "Все файлы будут созданы в папке: \e[1;33m$INSTALL_DIR\e[0m\n"
sleep 1

# -----------------------------------------------------------------------------
# 3. Проверка и установка whiptail
# -----------------------------------------------------------------------------
check_whiptail() {
    if ! command -v whiptail &> /dev/null; then
        echo "Устанавливаем whiptail..."
        apt update
        apt install -y whiptail
    fi
}
check_whiptail

# -----------------------------------------------------------------------------
# 4. Запрос подтверждения установки
# -----------------------------------------------------------------------------
whiptail --title "Подтверждение установки" --yesno "Будет установлен сервер Xiaozhi в папку:\n$INSTALL_DIR\n\nПродолжить?" \
    --yes-button "Продолжить" --no-button "Выйти" 12 60
case $? in
    0) ;;
    1) exit 1 ;;
esac

# -----------------------------------------------------------------------------
# 5. Проверка прав root
# -----------------------------------------------------------------------------
if [ $EUID -ne 0 ]; then
    whiptail --title "Ошибка прав" --msgbox "Запустите скрипт с правами root" 10 50
    exit 1
fi

# -----------------------------------------------------------------------------
# 6. Проверка дистрибутива (только Debian/Ubuntu)
# -----------------------------------------------------------------------------
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" != "debian" ] && [ "$ID" != "ubuntu" ]; then
        whiptail --title "Ошибка системы" --msgbox "Скрипт поддерживает только Debian/Ubuntu" 10 60
        exit 1
    fi
else
    whiptail --title "Ошибка системы" --msgbox "Не удаётся определить версию системы." 10 60
    exit 1
fi

# -----------------------------------------------------------------------------
# 7. Функция загрузки файлов
# -----------------------------------------------------------------------------
check_and_download() {
    local filepath="$1"
    local url="$2"
    if [ ! -f "$filepath" ]; then
        if ! curl -fL --progress-bar "$url" -o "$filepath"; then
            whiptail --title "Ошибка" --msgbox "Ошибка загрузки файла ${filepath}" 10 50
            exit 1
        fi
    else
        echo "Файл ${filepath} уже существует, пропускаем загрузку"
    fi
}

# -----------------------------------------------------------------------------
# 8. Проверка, установлен ли сервер в текущей папке
# -----------------------------------------------------------------------------
check_installed() {
    # Проверяем наличие каталога INSTALL_DIR и его непустоту
    if [ -d "$INSTALL_DIR" ] && [ "$(ls -A "$INSTALL_DIR" 2>/dev/null)" ]; then
        DIR_CHECK=1
    else
        DIR_CHECK=0
    fi
    # Проверяем существование контейнера (имя фиксированное)
    if docker inspect xiaozhi-esp32-server > /dev/null 2>&1; then
        CONTAINER_CHECK=1
    else
        CONTAINER_CHECK=0
    fi
    if [ $DIR_CHECK -eq 1 ] && [ $CONTAINER_CHECK -eq 1 ]; then
        return 0   # установлено
    else
        return 1   # не установлено
    fi
}

# -----------------------------------------------------------------------------
# 9. Блок обновления (если установка найдена)
# -----------------------------------------------------------------------------
if check_installed; then
    if whiptail --title "Обнаружена установка" --yesno "Обнаружен установленный сервер в папке:\n$INSTALL_DIR\n\nВыполнить обновление?" 12 60; then
        echo "Начинаем обновление..."

        # Остановка контейнеров
        docker compose -f "$INSTALL_DIR/docker-compose_all.yml" down

        # Удаление старых контейнеров
        containers=(
            "xiaozhi-esp32-server"
            "xiaozhi-esp32-server-web"
            "xiaozhi-esp32-server-db"
            "xiaozhi-esp32-server-redis"
        )
        for container in "${containers[@]}"; do
            if docker ps -a --format '{{.Names}}' | grep -q "^${container}$"; then
                docker stop "$container" >/dev/null 2>&1 && \
                docker rm "$container" >/dev/null 2>&1 && \
                echo "Контейнер удалён: $container"
            else
                echo "Контейнер не существует: $container"
            fi
        done

        # Удаление старых образов
        images=(
            "ghcr.nju.edu.cn/xinnan-tech/xiaozhi-esp32-server:server_latest"
            "ghcr.nju.edu.cn/xinnan-tech/xiaozhi-esp32-server:web_latest"
        )
        for image in "${images[@]}"; do
            if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^${image}$"; then
                docker rmi "$image" >/dev/null 2>&1 && \
                echo "Образ удалён: $image"
            else
                echo "Образ не существует: $image"
            fi
        done

        # Резервное копирование конфига
        mkdir -p "$INSTALL_DIR/backup"
        if [ -f "$INSTALL_DIR/data/.config.yaml" ]; then
            cp "$INSTALL_DIR/data/.config.yaml" "$INSTALL_DIR/backup/.config.yaml"
            echo "Резервная копия конфига создана: $INSTALL_DIR/backup/.config.yaml"
        fi

        # Скачивание свежих файлов
        check_and_download "$INSTALL_DIR/docker-compose_all.yml" \
            "https://ghfast.top/https://raw.githubusercontent.com/xinnan-tech/xiaozhi-esp32-server/refs/heads/main/main/xiaozhi-server/docker-compose_all.yml"
        check_and_download "$INSTALL_DIR/data/.config.yaml" \
            "https://ghfast.top/https://raw.githubusercontent.com/xinnan-tech/xiaozhi-esp32-server/refs/heads/main/main/xiaozhi-server/config_from_api.yaml"

        # Запуск обновлённой версии
        echo "Запускаем обновлённый сервис..."
        cd "$INSTALL_DIR" && docker compose up -d
        UPGRADE_COMPLETED=1
    else
        whiptail --title "Пропуск обновления" --msgbox "Обновление отменено. Будет использована текущая версия." 10 50
    fi
fi

# -----------------------------------------------------------------------------
# 10. Установка curl, если отсутствует
# -----------------------------------------------------------------------------
if ! command -v curl &> /dev/null; then
    echo "------------------------------------------------------------"
    echo "curl не найден, устанавливаем..."
    apt update
    apt install -y curl
else
    echo "------------------------------------------------------------"
    echo "curl уже установлен"
fi

# -----------------------------------------------------------------------------
# 11. Установка Docker, если отсутствует
# -----------------------------------------------------------------------------
if ! command -v docker &> /dev/null; then
    echo "------------------------------------------------------------"
    echo "Docker не найден, устанавливаем..."

    DISTRO=$(lsb_release -cs)
    MIRROR_URL="https://mirrors.aliyun.com/docker-ce/linux/ubuntu"
    GPG_URL="https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg"

    apt update
    apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg

    mkdir -p /etc/apt/keyrings
    curl -fsSL "$GPG_URL" | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] $MIRROR_URL $DISTRO stable" \
        > /etc/apt/sources.list.d/docker.list

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8 2>/dev/null || true

    apt update
    apt install -y docker-ce docker-ce-cli containerd.io

    systemctl start docker
    systemctl enable docker

    if docker --version; then
        echo "------------------------------------------------------------"
        echo "Установка Docker завершена!"
    else
        whiptail --title "Ошибка" --msgbox "Ошибка установки Docker" 10 50
        exit 1
    fi
else
    echo "Docker уже установлен"
fi

# -----------------------------------------------------------------------------
# 12. Выбор зеркала Docker
# -----------------------------------------------------------------------------
MIRROR_OPTIONS=(
    "1" "轩辕镜像 (рекомендуется)"
    "2" "Зеркало Tencent Cloud"
    "3" "Зеркало USTC"
    "4" "Зеркало NetEase 163"
    "5" "Зеркало Huawei Cloud"
    "6" "Зеркало Aliyun"
    "7" "Пользовательское зеркало"
    "8" "Пропустить настройку"
)

MIRROR_CHOICE=$(whiptail --title "Выберите зеркало Docker" --menu "Выберите зеркало для Docker-образов" 20 60 10 \
    "${MIRROR_OPTIONS[@]}" 3>&1 1>&2 2>&3) || {
    echo "Выбор отменён, выход"
    exit 1
}

case $MIRROR_CHOICE in
    1) MIRROR_URL="https://docker.xuanyuan.me" ;;
    2) MIRROR_URL="https://mirror.ccs.tencentyun.com" ;;
    3) MIRROR_URL="https://docker.mirrors.ustc.edu.cn" ;;
    4) MIRROR_URL="https://hub-mirror.c.163.com" ;;
    5) MIRROR_URL="https://05f073ad3c0010ea0f4bc00b7105ec20.mirror.swr.myhuaweicloud.com" ;;
    6) MIRROR_URL="https://registry.aliyuncs.com" ;;
    7) MIRROR_URL=$(whiptail --title "Пользовательское зеркало" --inputbox "Введите полный URL зеркала:" 10 60 3>&1 1>&2 2>&3) ;;
    8) MIRROR_URL="" ;;
esac

if [ -n "$MIRROR_URL" ]; then
    mkdir -p /etc/docker
    [ -f /etc/docker/daemon.json ] && cp /etc/docker/daemon.json /etc/docker/daemon.json.bak
    cat > /etc/docker/daemon.json <<EOF
{
    "dns": ["8.8.8.8", "114.114.114.114"],
    "registry-mirrors": ["$MIRROR_URL"]
}
EOF
    whiptail --title "Настройка выполнена" --msgbox "Зеркало добавлено: $MIRROR_URL\nDocker будет перезапущен." 12 60
    systemctl restart docker.service
fi

# -----------------------------------------------------------------------------
# 13. Создание каталогов данных и моделей внутри INSTALL_DIR
# -----------------------------------------------------------------------------
echo "------------------------------------------------------------"
echo "Создаём каталоги внутри $INSTALL_DIR"
mkdir -p "$INSTALL_DIR/data"
mkdir -p "$INSTALL_DIR/models/SenseVoiceSmall"

# -----------------------------------------------------------------------------
# 14. Загрузка модели распознавания речи
# -----------------------------------------------------------------------------
echo "------------------------------------------------------------"
echo "Загружаем модель распознавания речи..."
MODEL_PATH="$INSTALL_DIR/models/SenseVoiceSmall/model.pt"
if [ ! -f "$MODEL_PATH" ]; then
    (
        for i in {1..20}; do
            echo $((i*5))
            sleep 0.5
        done
    ) | whiptail --title "Загрузка" --gauge "Загрузка модели распознавания речи..." 10 60 0
    curl -fL --progress-bar https://modelscope.cn/models/iic/SenseVoiceSmall/resolve/master/model.pt -o "$MODEL_PATH" || {
        whiptail --title "Ошибка" --msgbox "Ошибка загрузки model.pt" 10 50
        exit 1
    }
else
    echo "model.pt уже существует, пропускаем"
fi

# -----------------------------------------------------------------------------
# 15. Загрузка docker-compose и конфига (если не было обновления)
# -----------------------------------------------------------------------------
if [ -z "$UPGRADE_COMPLETED" ]; then
    check_and_download "$INSTALL_DIR/docker-compose_all.yml" \
        "https://ghfast.top/https://raw.githubusercontent.com/xinnan-tech/xiaozhi-esp32-server/refs/heads/main/main/xiaozhi-server/docker-compose_all.yml"
    check_and_download "$INSTALL_DIR/data/.config.yaml" \
        "https://ghfast.top/https://raw.githubusercontent.com/xinnan-tech/xiaozhi-esp32-server/refs/heads/main/main/xiaozhi-server/config_from_api.yaml"
fi

# -----------------------------------------------------------------------------
# 16. Запуск Docker-контейнеров и ожидание готовности
# -----------------------------------------------------------------------------
(
    echo "------------------------------------------------------------"
    echo "Загрузка Docker-образов и запуск контейнеров..."
    echo "Это может занять несколько минут."

    cd "$INSTALL_DIR" || exit 1
    docker compose up -d

    if [ $? -ne 0 ]; then
        whiptail --title "Ошибка" --msgbox "Ошибка запуска Docker. Попробуйте сменить зеркало." 10 60
        exit 1
    fi

    echo "Ожидаем готовности веб-приложения (логи xiaozhi-esp32-server-web)..."
    TIMEOUT=300
    START_TIME=$(date +%s)
    while true; do
        CURRENT_TIME=$(date +%s)
        if [ $((CURRENT_TIME - START_TIME)) -gt $TIMEOUT ]; then
            whiptail --title "Ошибка" --msgbox "Таймаут ожидания запуска сервиса." 10 60
            exit 1
        fi
        if docker logs xiaozhi-esp32-server-web 2>&1 | grep -q "Started AdminApplication in"; then
            break
        fi
        sleep 1
    done

    echo "Сервер успешно запущен!"
    docker compose up -d   # повторно, чтобы убедиться
)

# -----------------------------------------------------------------------------
# 17. Настройка секретного ключа server.secret
# -----------------------------------------------------------------------------
PUBLIC_IP=$(hostname -I | awk '{print $1}')
whiptail --title "Настройка ключа сервера" --msgbox "Откройте в браузере консоль управления:\n\nВнутренний: http://127.0.0.1:8002/\nВнешний: http://$PUBLIC_IP:8002/ (если облако – откройте порты 8000, 8001, 8002).\n\nПервый пользователь – суперадминистратор.\nПосле регистрации нажмите Enter." 18 70

SECRET_KEY=$(whiptail --title "Настройка ключа сервера" --inputbox "Войдите как суперадминистратор.\nВ меню: «Словарь параметров» → «Управление параметрами»\nНайдите параметр server.secret, скопируйте значение.\n\nВведите ключ (или оставьте пустым для пропуска):" 15 60 3>&1 1>&2 2>&3)

if [ -n "$SECRET_KEY" ]; then
    python3 -c "
import sys, yaml
config_path = '$INSTALL_DIR/data/.config.yaml'
with open(config_path, 'r') as f:
    config = yaml.safe_load(f) or {}
config['manager-api'] = {'url': 'http://xiaozhi-esp32-server-web:8002/xiaozhi', 'secret': '$SECRET_KEY'}
with open(config_path, 'w') as f:
    yaml.dump(config, f)
"
    docker restart xiaozhi-esp32-server
fi

# -----------------------------------------------------------------------------
# 18. Финальное сообщение
# -----------------------------------------------------------------------------
LOCAL_IP=$(hostname -I | awk '{print $1}')
whiptail --title "Установка завершена!" --msgbox "\
Сервер успешно установлен в папку: $INSTALL_DIR

Адреса:
Панель управления:  http://$LOCAL_IP:8002
OTA:                 http://$LOCAL_IP:8002/xiaozhi/ota/
Анализ изображений: http://$LOCAL_IP:8003/mcp/vision/explain
WebSocket:           ws://$LOCAL_IP:8000/xiaozhi/v1/

Нажмите Enter для выхода." 16 70
