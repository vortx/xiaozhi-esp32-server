Часто задаваемые вопросы

# Часто задаваемые вопросы ❓

### 1\. Почему мои слова часто распознаются как корейский, японский или английский? 🇰🇷

**Рекомендация:** Проверьте, есть ли в папке `models/SenseVoiceSmall` файл `model.pt`. Если его нет — скачайте его: [Скачать файл модели для распознавания речи](Deployment.md#模型文件)

### 2\. Почему появляется ошибка "TTS задача не выполнена, файл не существует"? 📁

**Рекомендация:** Проверьте, установлены ли библиотеки `libopus` и `ffmpeg` через `conda`.  
Если не установлены, выполните:

conda install conda-forge::libopus
conda install conda-forge::ffmpeg

### 3\. TTS часто не работает или превышает время ожидания ⏰

**Рекомендация:** Если часто не работает `EdgeTTS`, сначала проверьте, используете ли вы прокси (VPN). Если да — попробуйте отключить и повторить попытку.  
Если используете Doubao TTS от Volcengine и часто возникают сбои, рекомендуется перейти на платную версию (тестовая поддерживает только 2 одновременных подключения).

### 4\. Через Wi-Fi сервер подключается, а через 4G — нет 🔐

**Причина:** Прошивка XiaGe требует защищённого соединения в 4G режиме.  
**Решения (выберите одно):**

1.  Изменить код. Смотрите видео: [https://www.bilibili.com/video/BV18MfTYoE85](https://www.bilibili.com/video/BV18MfTYoE85)
2.  Настроить SSL-сертификат через nginx. Инструкция: [https://icnt94i5ctj4.feishu.cn/docx/GnYOdMNJOoRCljx1ctecsj9cnRe](https://icnt94i5ctj4.feishu.cn/docx/GnYOdMNJOoRCljx1ctecsj9cnRe)

### 5\. Как ускорить отклик XiaoZhi? ⚡

Проект по умолчанию настроен на минимальные издержки — начните с бесплатных моделей, чтобы убедиться, что "работает", а затем оптимизируйте скорость.  
С версии `0.5.2` поддерживается потоковая конфигурация, что ускоряет отклик примерно на 2,5 секунды.

Модуль

Бесплатная настройка

Потоковая настройка

ASR (Распознавание речи)

FunASR (локально)

👍XunfeiStreamASR (iFlytek потоково)

LLM (Большая модель)

glm-4-flash (Zhipu)

👍qwen-flash (Alibaba Baichuan)

VLLM (Визуальная модель)

glm-4v-flash (Zhipu)

👍qwen3.5-flash (Alibaba Baichuan)

TTS (Синтез речи)

EdgeTTS (Microsoft)

👍HuoshanDoubleStreamTTS (Volcano потоково)

Intent (Распознавание намерений)

function\_call (вызов функций)

function\_call (вызов функций)

Memory (Память)

mem\_local\_short (локальная краткосрочная)

mem\_local\_short (локальная краткосрочная)

Для измерения времени работы компонентов смотрите [отчёт о производительности XiaoZhi](https://github.com/xinnan-tech/xiaozhi-performance-research) и тестируйте в своей среде.

### 6\. Я говорю медленно, а XiaoZhi постоянно меня перебивает 🗣️

**Рекомендация:** В конфиге найдите такой фрагмент и увеличьте значение `min_silence_duration_ms` (например, до `1000`):

VAD:
  SileroVAD:
    threshold: 0.5
    model\_dir: models/snakers4\_silero-vad
    min\_silence\_duration\_ms: 700  # Если паузы в речи длинные, увеличьте это значение

### 7\. Руководства по развертыванию

1.  [Минимальная установка](./Deployment.md)
2.  [Полная установка всех модулей](./Deployment_all.md)
3.  [Настройка шлюза MQTT + UDP](./mqtt-gateway-integration.md)
4.  [Автоматическое обновление и запуск кода](./dev-ops-integration.md)
5.  [Интеграция с Nginx](https://github.com/xinnan-tech/xiaozhi-esp32-server/issues/791)
6.  [Сборка собственного Docker-образа](./docker-build.md)

### 8\. Руководства по сборке прошивки

1.  [Сборка прошивки XiaoZhi](./firmware-build.md)
2.  [Изменение OTA-адреса на основе прошивки XiaGe](./firmware-setting.md)
3.  [Настройка автообновления OTA для одного модуля](./ota-upgrade-guide.md)

### 9\. Руководства по расширениям

1.  [Включение регистрации по номеру телефона](./ali-sms-integration.md)
2.  [Интеграция с HomeAssistant для умного дома](./homeassistant-integration.md)
3.  [Включение визуальных моделей для распознавания объектов](./mcp-vision-integration.md)
4.  [Развертывание точки доступа MCP](./mcp-endpoint-enable.md)
5.  [Интеграция с точкой доступа MCP](./mcp-endpoint-integration.md)
6.  [Получение информации об устройстве через MCP](./mcp-get-device-info.md)
7.  [Включение голосовой биометрии](./voiceprint-integration.md)
8.  [Настройка новостного плагина](./newsnow_plugin_config.md)
9.  [Интеграция базы знаний ragflow](./ragflow-integration.md)
10.  [Развертывание источников контекста](./context-provider-integration.md)
11.  [Интеграция PowerMem для интеллектуальной памяти](./powermem-integration.md)
12.  [Настройка погодного плагина](./weather-integration.md)
13.  [Включение плагина вызова устройств](./device-call-guide.md)
14.  [Включение поиска в интернете](./web-search-integration.md)

### 10\. Руководства по цифровому человеку

1.  [Запуск digital-human](./digital-human-wakeword.md)
2.  [Развертывание digital-human на мини-ПК N100](./all-in-one-digital-human-setup.md)

### 11\. Клонирование и локальный синтез речи

1.  [Клонирование голоса через консоль управления](./huoshan-streamTTS-voice-cloning.md)
2.  [Интеграция index-tts для локального синтеза](./index-stream-integration.md)
3.  [Интеграция fish-speech для локального синтеза](./fish-speech-integration.md)
4.  [Интеграция PaddleSpeech для локального синтеза](./paddlespeech-deploy.md)

### 12\. Руководства по тестированию производительности

1.  [Тестирование скорости компонентов](./performance_tester.md)
2.  [Публичные результаты тестов](https://github.com/xinnan-tech/xiaozhi-performance-research)

### 13\. Остались вопросы? Свяжитесь с нами 💬

Оставьте ваш вопрос в [issues](https://github.com/xinnan-tech/xiaozhi-esp32-server/issues).
