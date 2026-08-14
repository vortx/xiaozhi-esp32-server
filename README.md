[![Баннеры](docsimagesbanner1.png)](https.txt)
[Начало содержимого файла]
[![Баннеры](docs/images/banner1.png)](https://github.com/xinnan-tech/xiaozhi-esp32-server)

<h1 align="center">Бэкенд-сервис Xiaozhi — xiaozhi-esp32-server</h1>

<p align="center">
Этот проект основан на теории и технологиях человеко-машинного симбиоза для разработки программно-аппаратной системы интеллектуальных терминалов.<br/>Он предоставляет бэкенд-сервисы для проекта开源智能硬件
<a href="https://github.com/78/xiaozhi-esp32">xiaozhi-esp32</a>.<br/>
Реализован на Python, Java и Vue в соответствии с <a href="https://ccnphfhqs21z.feishu.cn/wiki/M0XiwldO9iJwHikpXD5cEx71nKh">протоколом связи Xiaozhi</a>.<br/>
Поддерживает протоколы MQTT+UDP, WebSocket, точку подключения MCP, распознавание голоса по отпечатку и базу знаний.
</p>

<p align="center">
<a href="./docs/FAQ.md">Часто задаваемые вопросы</a>
· <a href="https://github.com/xinnan-tech/xiaozhi-esp32-server/issues">Сообщить о проблеме</a>
· <a href="./README.md#%E9%83%A8%E7%BD%B2%E6%96%87%E6%A1%A3">Документация по развёртыванию</a>
· <a href="https://github.com/xinnan-tech/xiaozhi-esp32-server/releases">Журнал изменений</a>
</p>

<p align="center">
  <a href="./README.md"><img alt="README на упрощённом китайском" src="https://img.shields.io/badge/简体中文-DBEDFA"></a>
  <a href="./docs/readme/README_en.md"><img alt="README на английском" src="https://img.shields.io/badge/English-DFE0E5"></a>
  <a href="./docs/readme/README_vi.md"><img alt="Tiếng Việt" src="https://img.shields.io/badge/Tiếng Việt-DFE0E5"></a>
  <a href="./docs/readme/README_de.md"><img alt="Deutsch" src="https://img.shields.io/badge/Deutsch-DFE0E5"></a>
  <a href="./docs/readme/README_pt_BR.md"><img alt="Português (Brasil)" src="https://img.shields.io/badge/Português (Brasil)-DFE0E5"></a>
  <a href="https://github.com/xinnan-tech/xiaozhi-esp32-server/releases">
    <img alt="Участники GitHub" src="https://img.shields.io/github/v/release/xinnan-tech/xiaozhi-esp32-server?logo=docker" />
  </a>
  <a href="https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/LICENSE">
    <img alt="Pull requests на GitHub" src="https://img.shields.io/badge/license-MIT-white?labelColor=black" />
  </a>
  <a href="https://github.com/xinnan-tech/xiaozhi-esp32-server">
    <img alt="Звёзды" src="https://img.shields.io/github/stars/xinnan-tech/xiaozhi-esp32-server?color=ffcb47&labelColor=black" />
  </a>
</p>

<p align="center">
Возглавляется командой профессора Сыюаня Лю (Южно-Китайский технологический университет)
</br>
刘思源教授团队主导研发（华南理工大学）
</br>
<img src="./docs/images/hnlg.jpg" alt="Южно-Китайский технологический университет" width="50%">
</p>

---

## Для кого этот проект 👥

Этот проект предназначен для использования с аппаратным обеспечением ESP32. Если вы уже приобрели соответствующее оборудование ESP32, успешно подключались к бэкенд-сервису, развёрнутому «Ся Гэ», и хотите самостоятельно развернуть собственный бэкенд-сервис `xiaozhi-esp32`, то этот проект идеально вам подойдёт.

Хотите увидеть его в действии? Смотрите видео 🎥

<table>
  <tr>
    <td>
      <a href="https://www.bilibili.com/video/BV1FMFyejExX" target="_blank">
        <picture>
          <img alt="Ощущение скорости отклика" src="docs/images/demo9.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1vchQzaEse" target="_blank">
        <picture>
          <img alt="Секреты оптимизации скорости" src="docs/images/demo6.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1WEcxzFEAT" target="_blank">
        <picture>
          <img alt="Цифровой аватар Xiaozhi с голосовой активацией" src="docs/images/demo8.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1CKVz6UEuB" target="_blank">
        <picture>
          <img alt="Вызов устройства с устройства, как по телефону" src="docs/images/demo0.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1C1tCzUEZh" target="_blank">
        <picture>
          <img alt="Сложный медицинский сценарий" src="docs/images/demo1.png" /></picture>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://www.bilibili.com/video/BV1VC96Y5EMH" target="_blank">
        <picture>
          <img alt="Воспроизведение музыки, запрос погоды, новости" src="docs/images/demo7.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV12J7WzBEaH" target="_blank">
        <picture>
          <img alt="Прерывание в реальном времени" src="docs/images/demo10.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1Co76z7EvK" target="_blank">
        <picture>
          <img alt="Распознавание объектов по фото" src="docs/images/demo12.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1pNXWYGEx1" target="_blank">
        <picture>
          <img alt="Управление бытовой техникой" src="docs/images/demo5.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1TJ7WzzEo6" target="_blank">
        <picture>
          <img alt="Многокомандные задачи" src="docs/images/demo11.png" /></picture>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://www.bilibili.com/video/BV1ZQKUzYExM" target="_blank">
        <picture>
          <img alt="Точка подключения MCP" src="docs/images/demo13.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1zUW5zJEkq" target="_blank">
        <picture>
          <img alt="Отправка команд MQTT" src="docs/images/demo4.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1Exu3zqEDe" target="_blank">
        <picture>
          <img alt="Распознавание голосового отпечатка" src="docs/images/demo14.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV1CDKWemEU6" target="_blank">
        <picture>
          <img alt="Пользовательский тембр голоса" src="docs/images/demo2.png" /></picture>
      </a>
    </td>
    <td>
      <a href="https://www.bilibili.com/video/BV12yA2egEaC" target="_blank">
        <picture>
          <img alt="Общение на кантонском диалекте" src="docs/images/demo3.png" /></picture>
      </a>
    </td>
  </tr>
</table>

---

## Предупреждение ⚠️

1.  Данное программное обеспечение является открытым исходным кодом. Оно не находится в коммерческих партнёрских отношениях с какими-либо сторонними поставщиками API-сервисов (включая, но не ограничиваясь, платформами распознавания речи, больших языковых моделей, синтеза речи и т. д.) и не даёт никаких гарантий относительно качества их услуг или безопасности средств. Рекомендуется по возможности выбирать поставщиков, имеющих соответствующие лицензии, и внимательно ознакомиться с их условиями обслуживания и политикой конфиденциальности. Данное ПО не хранит учётные данные (ключи API), не участвует в движении денежных средств и не несёт ответственности за потери средств при пополнении счёта.

2.  Функционал проекта не завершён и он не проходил проверку на безопасность в сетях. Пожалуйста, не используйте его в производственной среде. Если вы развёртываете и изучаете проект в публичной сети, обязательно примите необходимые меры защиты.

---

## Документация по развёртыванию

![Баннеры](docs/images/banner2.png)

Проект предлагает два способа развёртывания. Выберите подходящий в зависимости от ваших потребностей:

#### 🚀 Выбор способа развёртывания
| Способ развёртывания | Особенности | Сценарии применения | Документация | Требования к конфигурации | Видеоурок |
|---------|------|---------|---------|---------|---------|
| **Минимальная установка** | Интеллектуальный диалог, управление одним агентом | Низкие требования к среде, данные хранятся в конфигурационных файлах, база данных не требуется | [① Docker-версия](./docs/Deployment.md#%E6%96%B9%E5%BC%8F%E4%B8%80docker%E5%8F%AA%E8%BF%90%E8%A1%8Cserver) / [② Развёртывание из исходников](./docs/Deployment.md#%E6%96%B9%E5%BC%8F%E4%BA%8C%E6%9C%AC%E5%9C%B0%E6%BA%90%E7%A0%81%E5%8F%AA%E8%BF%90%E8%A1%8Cserver)| При использовании `FunASR` требуется 2 ядра и 4 ГБ ОЗУ; если все через API — 2 ядра и 2 ГБ ОЗУ | - |
| **Полная установка** | Интеллектуальный диалог, управление несколькими пользователями и агентами, управление через веб-интерфейс | Полный набор функций, данные хранятся в базе данных | [① Docker-версия](./docs/Deployment_all.md#%E6%96%B9%E5%BC%8F%E4%B8%80docker%E8%BF%90%E8%A1%8C%E5%85%A8%E6%A8%A1%E5%9D%97) / [② Развёртывание из исходников](./docs/Deployment_all.md#%E6%96%B9%E5%BC%8F%E4%BA%8C%E6%9C%AC%E5%9C%B0%E6%BA%90%E7%A0%81%E8%BF%90%E8%A1%8C%E5%85%A8%E6%A8%A1%E5%9D%97) / [③ Автоматическое обновление из исходников](./docs/dev-ops-integration.md) | При использовании `FunASR` требуется 4 ядра и 8 ГБ ОЗУ; если все через API — 2 ядра и 4 ГБ ОЗУ | [Видеоурок по локальному запуску из исходников](https://www.bilibili.com/video/BV1wBJhz4Ewe) |

Часто задаваемые вопросы и руководства можно найти по [этой ссылке](./docs/FAQ.md)

> 💡 Подсказка: Ниже приведена тестовая платформа, развёрнутая по последнему коду. При необходимости вы можете прошить устройство для тестирования. Количество одновременных подключений — 6, данные сбрасываются ежедневно.
