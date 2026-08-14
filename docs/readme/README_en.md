  Xiaozhi Backend Service — xiaozhi-esp32-server 
[![Banner](../images/banner1.png)](https://github.com/xinnan-tech/xiaozhi-esp32-server)

# Xiaozhi Backend Service  
xiaozhi-esp32-server

Этот проект основан на теории и технологии симбиотического интеллекта человека и машины для разработки интеллектуальных терминальных аппаратных и программных систем.  
Предоставляет серверные услуги для открытого проекта интеллектуального оборудования [xiaozhi-esp32](https://github.com/78/xiaozhi-esp32).  
Реализован с использованием Python, Java и Vue в соответствии с [Протоколом Xiaozhi](https://ccnphfhqs21z.feishu.cn/wiki/M0XiwldO9iJwHikpXD5cEx71nKh).  
Поддерживает протоколы MQTT+UDP, WebSocket, точку доступа MCP, распознавание голоса по отпечатку и базу знаний.

[ЧаВо](../FAQ.md) · [Сообщить о проблеме](https://github.com/xinnan-tech/xiaozhi-esp32-server/issues) · [Документация по развёртыванию](../../README.md#%E9%83%A8%E7%BD%B2%E6%96%87%E6%A1%A3) · [Заметки о релизах](https://github.com/xinnan-tech/xiaozhi-esp32-server/releases)

[![简体中文版自述文件](https://img.shields.io/badge/简体中文-DFE0E5)](../../README.md) [![README in English](https://img.shields.io/badge/English-DBEDFA)](./README_en.md) [![Tiếng Việt](https://img.shields.io/badge/Tiếng Việt-DFE0E5)](./README_vi.md) [![Deutsch](https://img.shields.io/badge/Deutsch-DFE0E5)](./README_de.md) [![Português (Brasil)](https://img.shields.io/badge/Português (Brasil)-DFE0E5)](./README_pt_BR.md) [![GitHub Contributors](https://img.shields.io/github/v/release/xinnan-tech/xiaozhi-esp32-server?logo=docker) ](https://github.com/xinnan-tech/xiaozhi-esp32-server/releases)[![GitHub pull requests](https://img.shields.io/badge/license-MIT-white?labelColor=black) ](https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/LICENSE)[![stars](https://img.shields.io/github/stars/xinnan-tech/xiaozhi-esp32-server?color=ffcb47&labelColor=black)](https://github.com/xinnan-tech/xiaozhi-esp32-server)

**Руководитель проекта — команда профессора Сыюань Лю (Южно-Китайский технологический университет)**  
![South China University of Technology](../images/hnlg.jpg)

* * *

## 👥 Целевая аудитория

Для работы этого проекта требуются аппаратные устройства ESP32. Если вы приобрели соответствующее оборудование ESP32, успешно подключились к развёрнутому серверу Brother Xia и хотите самостоятельно создать собственный сервер `xiaozhi-esp32`, то этот проект для вас.

Хотите посмотреть, как это работает? Нажмите на видео ниже 🎥

[![Скорость отклика](docs/images/demo9.png)](https://www.bilibili.com/video/BV1FMFyejExX)

[Скорость отклика

](https://www.bilibili.com/video/BV1FMFyejExX)

[![Секреты оптимизации скорости](docs/images/demo6.png)](https://www.bilibili.com/video/BV1vchQzaEse)

[Секреты оптимизации скорости

](https://www.bilibili.com/video/BV1vchQzaEse)

[![Цифровой человек с голосовой активацией](docs/images/demo8.png)](https://www.bilibili.com/video/BV1WEcxzFEAT)

[Цифровой человек с голосовой активацией

](https://www.bilibili.com/video/BV1WEcxzFEAT)

[![Звонок с устройства на устройство](docs/images/demo0.png)](https://www.bilibili.com/video/BV1CKVz6UEuB)

[Звонок с устройства на устройство

](https://www.bilibili.com/video/BV1CKVz6UEuB)

[![Сложный медицинский сценарий](docs/images/demo1.png)](https://www.bilibili.com/video/BV1C1tCzUEZh)

[Сложный медицинский сценарий

](https://www.bilibili.com/video/BV1C1tCzUEZh)

[![Музыка, погода, новости](docs/images/demo7.png)](https://www.bilibili.com/video/BV1VC96Y5EMH)

[Музыка, погода, новости

](https://www.bilibili.com/video/BV1VC96Y5EMH)

[![Прерывание в реальном времени](docs/images/demo10.png)](https://www.bilibili.com/video/BV12J7WzBEaH)

[Прерывание в реальном времени

](https://www.bilibili.com/video/BV12J7WzBEaH)

[![Фото и распознавание объектов](docs/images/demo12.png)](https://www.bilibili.com/video/BV1Co76z7EvK)

[Фото и распознавание объектов

](https://www.bilibili.com/video/BV1Co76z7EvK)

[![Управление бытовой техникой](docs/images/demo5.png)](https://www.bilibili.com/video/BV1pNXWYGEx1)

[Управление бытовой техникой

](https://www.bilibili.com/video/BV1pNXWYGEx1)

[![Многокомандные задачи](docs/images/demo11.png)](https://www.bilibili.com/video/BV1TJ7WzzEo6)

[Многокомандные задачи

](https://www.bilibili.com/video/BV1TJ7WzzEo6)

[![Точка доступа MCP](docs/images/demo13.png)](https://www.bilibili.com/video/BV1ZQKUzYExM)

[Точка доступа MCP

](https://www.bilibili.com/video/BV1ZQKUzYExM)

[![Отправка команд MQTT](docs/images/demo4.png)](https://www.bilibili.com/video/BV1zUW5zJEkq)

[Отправка команд MQTT

](https://www.bilibili.com/video/BV1zUW5zJEkq)

[![Распознавание голоса по отпечатку](docs/images/demo14.png)](https://www.bilibili.com/video/BV1Exu3zqEDe)

[Распознавание голоса по отпечатку

](https://www.bilibili.com/video/BV1Exu3zqEDe)

[![Пользовательский тембр](docs/images/demo2.png)](https://www.bilibili.com/video/BV1CDKWemEU6)

[Пользовательский тембр

](https://www.bilibili.com/video/BV1CDKWemEU6)

[![Общение на кантонском](docs/images/demo3.png)](https://www.bilibili.com/video/BV12yA2egEaC)

[Общение на кантонском

](https://www.bilibili.com/video/BV12yA2egEaC)

* * *

## ⚠️ Предупреждения

**1.** Это программное обеспечение с открытым исходным кодом. Оно не имеет коммерческого партнёрства с какими-либо сторонними поставщиками API-услуг (включая, но не ограничиваясь, платформы распознавания речи, больших языковых моделей, синтеза речи и т.д.), к которым оно подключается, и не предоставляет никаких гарантий в отношении качества их услуг или финансовой безопасности. Рекомендуется пользователям в первую очередь выбирать поставщиков услуг с соответствующими лицензиями и внимательно читать их условия обслуживания и политику конфиденциальности. Данное программное обеспечение не хранит учётные ключи, не участвует в денежных потоках и не несёт ответственности за потерю средств при пополнении баланса.

**2.** Функциональность этого проекта не завершена и не прошла оценку безопасности сети. Пожалуйста, не используйте его в производственных средах. Если вы развёртываете этот проект в общедоступной сети для учебных целей, убедитесь, что приняты необходимые меры защиты.

* * *

## 📖 Документация по развёртыванию

![Banner2](../images/banner2.png)

Проект предлагает два способа развёртывания. Выберите подходящий в зависимости от ваших потребностей:

### 🚀 Выбор метода развёртывания

Метод развёртывания

Особенности

Область применения

Документация

Требования к конфигурации

Видеоуроки

**Упрощённая установка**

Интеллектуальный диалог, управление одним агентом

Среды с низкими требованиями, данные хранятся в конфигурационных файлах, база данных не требуется

[① Docker-версия](../Deployment.md#%E6%96%B9%E5%BC%8F%E4%B8%80docker%E5%8F%AA%E8%BF%90%E8%A1%8Cserver) / [② Развёртывание из исходников](../Deployment.md#%E6%96%B9%E5%BC%8F%E4%BA%8C%E6%9C%AC%E5%9C%B0%E6%BA%90%E7%A0%81%E5%8F%AA%E8%BF%90%E8%A1%8Cserver)

2 ядра, 4 ГБ ОЗУ при использовании `FunASR`; 2 ядра, 2 ГБ ОЗУ при использовании всех API

—

**Полная модульная установка**

Интеллектуальный диалог, многопользовательское управление, управление несколькими агентами, интеллектуальная консоль с веб-интерфейсом

Полный функциональный опыт, данные хранятся в базе данных

[① Docker-версия](../Deployment_all.md#%E6%96%B9%E5%BC%8F%E4%B8%80docker%E8%BF%90%E8%A1%8C%E5%85%A8%E6%A8%A1%E5%9D%97) / [② Развёртывание из исходников](../Deployment_all.md#%E6%96%B9%E5%BC%8F%E4%BA%8C%E6%9C%AC%E5%9C%B0%E6%BA%90%E7%A0%81%E8%BF%90%E8%A1%8C%E5%85%A8%E6%A8%A1%E5%9D%97) / [③ Автообновление из исходников](../dev-ops-integration.md)

4 ядра, 8 ГБ ОЗУ при использовании `FunASR`; 2 ядра, 4 ГБ ОЗУ при использовании всех API

[Видеоурок по локальному запуску из исходников](https://www.bilibili.com/video/BV1wBJhz4Ewe)

Часто задаваемые вопросы и связанные руководства смотрите по [этой ссылке](../FAQ.md).

**💡 Примечание:** Ниже представлена тестовая платформа, развёрнутая с последней версией кода. Вы можете прошить устройство и протестировать при необходимости. Одновременных пользователей: 6, данные очищаются ежедневно.

*   **Интеллектуальная консоль:** [https://2662r3426b.vicp.fun](https://2662r3426b.vicp.fun)
*   **Интеллектуальная консоль (H5):** [https://2662r3426b.vicp.fun/h5/index.html](https://2662r3426b.vicp.fun/h5/index.html)
*   **Инструмент тестирования сервиса:** [https://2662r3426b.vicp.fun/test/](https://2662r3426b.vicp.fun/test/)
*   **OTA-интерфейс:** [https://2662r3426b.vicp.fun/xiaozhi/ota/](https://2662r3426b.vicp.fun/xiaozhi/ota/)
*   **WebSocket-интерфейс:** `wss://2662r3426b.vicp.fun/xiaozhi/v1/`

### 🚩 Описание и рекомендации по конфигурации

Проект предлагает две схемы конфигурации:

1.  **Бесплатный начальный уровень** — подходит для личного и домашнего использования, все компоненты используют бесплатные решения, дополнительные платежи не требуются.
2.  **Потоковая конфигурация** — подходит для демонстраций, обучения, сценариев с более чем 2 одновременными пользователями и т.д. Использует потоковую обработку для более быстрого отклика и лучшего опыта.

Начиная с версии `0.5.2` проект поддерживает потоковую конфигурацию. По сравнению с более ранними версиями, скорость отклика улучшена примерно на **2,5 секунды**, что значительно улучшает пользовательский опыт.

Модуль

Бесплатный начальный уровень

Потоковая конфигурация

ASR (распознавание речи)

FunASR (локально)

👍 XunfeiStreamASR (потоковый от iFLYTEK)

LLM (большая языковая модель)

glm-4-flash (Zhipu)

👍 qwen-flash (Alibaba Bailian)

VLLM (визуальная модель)

glm-4v-flash (Zhipu)

👍 qwen3.5-flash (Alibaba Bailian)

TTS (синтез речи)

EdgeTTS (Microsoft)

👍 HuoshanDoubleStreamTTS (потоковый от Volcano)

Распознавание намерений

function\_call (вызов функций)

function\_call (вызов функций)

Память

mem\_local\_short (локальная краткосрочная)

mem\_local\_short (локальная краткосрочная)

Если вас интересует задержка каждого компонента, обратитесь к [отчёту о тестировании производительности компонентов Xiaozhi](https://github.com/xinnan-tech/xiaozhi-performance-research) и протестируйте в своей среде, следуя описанным методам.

### 🔧 Инструменты тестирования

Название инструмента

Расположение

Способ использования

Описание функции

Инструмент аудиовзаимодействия

`main/digital-human/index.html`

Запустите `python start.py` в `main/digital-human`, затем откройте `http://127.0.0.1:8006/index.html`

Тестирует функции воспроизведения и приёма аудио, проверяет корректность обработки аудио на стороне Python

Инструмент тестирования отклика моделей

`main/xiaozhi-server/performance_tester.py`

Выполните `python performance_tester.py`

Тестирует скорость отклика трёх основных модулей: ASR, LLM, VLLM, TTS

💡 Примечание: при тестировании скорости моделей тестируются только те модели, для которых настроены ключи.

* * *

## ✨ Список возможностей

### ✅ Реализовано

![Схема архитектуры полного модуля](../images/deploy2.png)

Модуль

Описание

Базовая архитектура

Основана на [шлюзе MQTT+UDP](https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/mqtt-gateway-integration.md), серверах WebSocket и HTTP, предоставляет полноценную консоль управления и систему аутентификации.

Голосовое взаимодействие

Поддерживает потоковое ASR, потоковый TTS, VAD, распознавание на нескольких языках и обработку голоса.

Распознавание голоса по отпечатку

Поддерживает регистрацию, управление и распознавание отпечатков голоса для нескольких пользователей, работает параллельно с ASR, определяет личность говорящего в реальном времени и передаёт её в LLM для персонализированных ответов.

Интеллектуальный диалог

Поддерживает множество LLM, реализует интеллектуальный диалог.

Визуальное восприятие

Поддерживает множество VLLM, реализует мультимодальное взаимодействие.

Распознавание намерений

Поддерживает распознавание намерений через LLM, вызов функций Function Call, предоставляет плагин-механизм для обработки намерений.

Система памяти

Поддерживает локальную краткосрочную память, интерфейс mem0ai, интеллектуальную память PowerMem с функцией обобщения.

База знаний

Поддерживает базу знаний RAGFlow, позволяя LLM после получения вопроса пользователя решать, обращаться ли к базе знаний, и затем отвечать.

Вызов инструментов

Поддерживает клиентский протокол IoT, клиентский MCP, серверный MCP, конечные точки MCP, пользовательские инструменты.

Отправка команд

Поддерживает отправку команд MCP на устройства ESP32 через протокол MQTT из умной консоли.

Бэкенд управления

Предоставляет веб-интерфейс управления, поддерживает управление пользователями, системную конфигурацию и управление устройствами; поддерживает упрощённый китайский, традиционный китайский и английский языки.

Инструменты тестирования

Предоставляет инструменты для тестирования производительности, визуальных моделей и аудиовзаимодействия.

Поддержка развёртывания

Поддерживает развёртывание через Docker и локально, предоставляет полноценное управление конфигурационными файлами.

Плагинная система

Поддерживает расширение функциональности через плагины, разработку пользовательских плагинов и горячую подгрузку.

### 🚧 В разработке

Ознакомиться с конкретным планом разработки можно [здесь](https://github.com/users/xinnan-tech/projects/3). Часто задаваемые вопросы и руководства смотрите [по ссылке](../FAQ.md).

Если вы разработчик, вот [открытое письмо разработчикам](../contributor_open_letter.md). Добро пожаловать к участию!

* * *

## 👬 Экосистема продукта

Xiaozhi — это экосистема. Используя этот продукт, вы также можете посмотреть другие [замечательные проекты](https://github.com/78/xiaozhi-esp32/blob/main/README_zh.md#%E7%9B%B8%E5%85%B3%E5%BC%80%E6%BA%90%E9%A1%B9%E7%9B%AE) в этой экосистеме.

* * *

## 📋 Список поддерживаемых платформ и компонентов

### LLM — Большие языковые модели

Способ использования

Поддерживаемые платформы

Бесплатные платформы

Вызов через интерфейс OpenAI

Alibaba Bailian, Volcano Engine, DeepSeek, Zhipu, Gemini, iFLYTEK

Zhipu, Gemini

Вызов через интерфейс Ollama

Ollama

—

Вызов через интерфейс Dify

Dify

—

Вызов через интерфейс FastGPT

FastGPT

—

Вызов через интерфейс Coze

Coze

—

Вызов через интерфейс Xinference

Xinference

—

Вызов через интерфейс HomeAssistant

HomeAssistant

—

Фактически, любая LLM, поддерживающая интерфейс OpenAI, может быть интегрирована.

### VLLM — Визуальные модели

Способ использования

Поддерживаемые платформы

Бесплатные платформы

Вызов через интерфейс OpenAI

Alibaba Bailian, Zhipu ChatGLMVLLM

Zhipu ChatGLMVLLM

Фактически, любая VLLM, поддерживающая интерфейс OpenAI, может быть интегрирована.

### TTS — Синтез речи

Способ использования

Поддерживаемые платформы

Бесплатные платформы

Вызов через API

EdgeTTS, iFLYTEK, Volcano Engine, Tencent Cloud, Alibaba Cloud и Bailian, CosyVoiceSiliconflow, TTS302AI, CozeCnTTS, GizwitsTTS, ACGNTTS, OpenAITTS, Lingxi Streaming TTS, MinimaxTTS

Lingxi Streaming TTS, EdgeTTS, CosyVoiceSiliconflow (частично)

Локальные сервисы

FishSpeech, GPT\_SOVITS\_V2, GPT\_SOVITS\_V3, Index-TTS, PaddleSpeech

Index-TTS, PaddleSpeech, FishSpeech, GPT\_SOVITS\_V2, GPT\_SOVITS\_V3

### VAD — Обнаружение голосовой активности

Тип

Название платформы

Способ использования

Модель оплаты

Примечания

VAD

SileroVAD

Локально

Бесплатно

### ASR — Распознавание речи

Способ использования

Поддерживаемые платформы

Бесплатные платформы

Локально

FunASR, SherpaASR

FunASR, SherpaASR

Вызов через API

FunASRServer, Volcano Engine, iFLYTEK, Tencent Cloud, Alibaba Cloud, Baidu Cloud, OpenAI ASR

FunASRServer

### Распознавание голоса по отпечатку

Способ использования

Поддерживаемые платформы

Бесплатные платформы

Локально

3D-Speaker

3D-Speaker

### Хранилище памяти

Тип

Название платформы

Способ использования

Модель оплаты

Примечания

Память

mem0ai

Вызов через API

1000 запросов/месяц

Память

[powermem](../powermem-integration.md)

Локальное обобщение

Зависит от LLM и БД

OceanBase с открытым исходным кодом, поддерживает интеллектуальный поиск

Память

mem\_local\_short

Локальное обобщение

Бесплатно

Память

nomem

Без памяти

Бесплатно

### Распознавание намерений

Тип

Название платформы

Способ использования

Модель оплаты

Примечания

Намерение

intent\_llm

Вызов через API

На основе тарификации LLM

Распознаёт намерение через большие модели, сильная обобщаемость

Намерение

function\_call

Вызов через API

На основе тарификации LLM

Выполняет намерение через вызов функций большой модели, быстро и эффективно

Намерение

nointent

Без намерения

Бесплатно

Не выполняет распознавание намерений, сразу возвращает результат диалога

### RAG — Генерация с дополненным поиском

Тип

Название платформы

Способ использования

Модель оплаты

Примечания

RAG

ragflow

Вызов через API

Оплата за токены, расходуемые на сегментацию и извлечение ключевых слов

Использует возможности RAGFlow для более точных ответов

* * *

## 🙏 Благодарности

![Bailing Voice Dialogue Robot](../images/logo_bailing.png)

[Робот голосового диалога Bailing](https://github.com/wwbin2017/bailing) — этот проект вдохновлён им и реализован на его основе.

![Tenclass](../images/logo_tenclass.png)

[Tenclass](https://www.tenclass.com/) — благодарность за разработку стандартных протоколов, совместимость с множеством устройств и демонстрацию высоконагруженных сценариев для экосистемы Xiaozhi; предоставил полную техническую документацию для этого проекта.

![Xuanfeng Technology](../images/logo_xuanfeng.png)

[Xuanfeng Technology](https://github.com/Eric0308) — благодарность за вклад в реализацию framework вызова функций, протокола MCP и плагин-механизма. Благодаря стандартизированной системе инструкций и динамическим расширениям значительно повышена эффективность взаимодействия и функциональная расширяемость устройств IoT.

![huangjunsen](../images/logo_junsen.png)

[huangjunsen](https://github.com/huangjunsen0406) — благодарность за вклад в модуль _«Мобильная интеллектуальная консоль»_, обеспечивающий эффективное управление и взаимодействие в реальном времени с мобильных устройств.

![Huiyuan Design](../images/logo_huiyuan.png)

[Huiyuan Design](http://ui.kwd988.net/) — благодарность за профессиональные визуальные решения, основанные на опыте работы с тысячами предприятий.

![Xi'an Qinren Information Technology](../images/logo_qinren.png)

[Xi'an Qinren Information Technology](https://www.029app.com/) — углубление визуальной системы проекта, обеспечение согласованности и расширяемости дизайна.

![Contributors](../images/logo_contributors.png)

[Все участники кода](https://github.com/xinnan-tech/xiaozhi-esp32-server/graphs/contributors) — ваши усилия делают проект сильнее.

  [![Star History Chart](https://api.star-history.com/svg?repos=xinnan-tech/xiaozhi-esp32-server&type=Date)](https://star-history.com/#xinnan-tech/xiaozhi-esp32-server&Date)

Перевод оригинального README проекта [xiaozhi-esp32-server](https://github.com/xinnan-tech/xiaozhi-esp32-server).
