## Secure Build

#### 138
### Огляд безпечної збірки
Практика **Secure Build (SB)** підкреслює важливість створення програмного забезпечення у стандартизованій, повторюваній манері з використанням безпечних компонентів, включаючи сторонні програмні залежності.

#### Потік A: Процес збірки
Основна увага приділяється вилученню суб'єктивних факторів із процесу збірки шляхом автоматизації. Автоматизована збірка може включати додаткові перевірки безпеки, такі як SAST (статичний аналіз безпеки) та DAST (динамічний аналіз безпеки), що забезпечує раннє виявлення та попередження дефектів безпеки.

#### Потік B: Програмні залежності
Залежності від сторонніх бібліотек є поширеною практикою в сучасному програмуванні. Метою є ідентифікація цих залежностей та моніторинг їхньої безпеки для зменшення впливу можливих вразливостей на додаток.

---
#### 139
### Огляд потоків

#### Потік A - Процес збірки

Стабільний процес збірки гарантує, що програмне забезпечення, яке ви розгортаєте, є передбачуваним і безпосередньо пов'язане з вихідним кодом. Ви також можете використовувати процес збірки для виконання різних заходів безпеки.

#### Потік B - Програмні залежності

Зовнішні бібліотеки є важливою частиною сучасного програмного забезпечення. Дії в цьому потоці допомагають створити огляд зовнішніх бібліотек і забезпечити, що їхня безпека є адекватною.

---
#### 140
### Огляд активностей

| Потік A | Потік B |
| --- | --- |
| **Процес збірки** | **Програмні залежності** |
| **Рівень зрілості 1** | Процес збірки повторюваний і послідовний. Створіть формальний опис процесу збірки, щоб він став стабільним і повторюваним. Створіть записи з Bill of Materials (BOM) для ваших застосунків і за можливості аналізуйте ці залежності. |
| **Рівень зрілості 2** | Процес збірки оптимізований і повністю інтегрований у робочий процес. Автоматизуйте конвеєр збірки та захистіть використання інструментів. Додайте перевірки безпеки в конвеєр збірки. Оцініть використані залежності та своєчасно реагуйте на ризики для ваших застосунків. |
| **Рівень зрілості 3** | Процес збірки допомагає запобігти відомим дефектам, що потрапляють у виробниче середовище. Визначте обов’язкові перевірки безпеки у процесі збірки і переконайтеся, що збірка невідповідних артефактів зазнає невдачі. Аналізуйте залежності на наявність проблем безпеки на рівні, подібному до вашого власного коду. |
---
#### 141
### Потік A - Процес збірки

#### Рівень зрілості 1

**Переваги**: Обмеження ризику людської помилки під час процесу збірки, що мінімізує проблеми з безпекою.

**Активності**: 
1. Визначте процес збірки, розбивши його на набір чітких інструкцій для людини або автоматизованого інструменту.
2. Опис процесу збірки повинен охоплювати весь процес від початку до кінця, щоб його можна було виконувати послідовно щоразу і отримувати однакові результати.
3. Визначення має зберігатися централізовано та бути доступним інструментам або особам.
4. Уникайте зберігання кількох копій, які можуть стати застарілими або невідповідними.
5. Переконайтеся, що визначення процесу не містить секретів, зокрема, пов'язаних із процесом збірки.
6. Переглядайте всі інструменти для збірки, щоб переконатися, що вони активно підтримуються постачальниками та оновлюються відповідно до патчів безпеки. Посильте конфігурацію кожного інструменту відповідно до рекомендацій постачальників та галузевих найкращих практик.
7. Визначте значення для кожного створеного артефакту, яке можна використовувати для перевірки його цілісності, наприклад, підпис або хеш. Захистіть це значення та приватний сертифікат підпису.
---
#### 142
## Потік A - Процес збірки

### Рівень зрілості 1

**Активність (продовження)**

Забезпечте, що інструменти збірки регулярно оновлюються патчами та належним чином посилені.

---
#### 143
### Потік A - Процес збірки

#### Рівень зрілості 1

**Питання**: Чи ваш процес збірки формально описаний?

**Критерії якості**:
- Ви маєте достатньо інформації, щоб відтворити процес збірки.
- Ваша документація збірки актуальна.
- Документація зберігається в доступному місці.
- Контрольні суми для артефактів створюються під час збірки для підтримки перевірки в майбутньому.
- Ви посилили інструменти, які використовуються в процесі збірки.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.
---
#### 144
## Потік A - Процес збірки

#### Рівень зрілості 2

**Переваги**: Ефективний процес збірки з інтегрованими інструментами безпеки.

**Активності**:
1. Автоматизуйте процес збірки таким чином, щоб збірки могли виконуватися послідовно в будь-який час. Процес збірки не повинен вимагати втручання, що додатково зменшує ймовірність людських помилок.
2. Використання автоматизованої системи збільшує залежність від безпеки інструментів збірки, тому посилення і підтримка інструментів стають ще більш критичними.
3. Зверніть особливу увагу на інтерфейси цих інструментів, такі як веб-портали, і на те, як їх можна заблокувати. Відкритий доступ до інструменту збірки може дозволити зловмиснику втручатися в процес і порушити його цілісність.
4. Автоматизований процес може вимагати доступу до облікових даних і секретів, необхідних для збірки програмного забезпечення, таких як сертифікати підпису коду або доступ до репозиторіїв. Обробляйте ці дані з обережністю.
---
#### 145
## Потік A - Процес збірки

### Рівень зрілості 2

**Активність (продовження)**

Нарешті, додайте відповідні автоматизовані перевірки безпеки (наприклад, використання інструментів SAST) у конвеєр збірки, щоб використати автоматизацію для посилення безпеки.

---
#### 146
### Потік A - Процес збірки

#### Рівень зрілості 2

**Питання**: Чи ваш процес збірки повністю автоматизований?

**Критерії якості**:
- Процес збірки не вимагає втручання людини.
- Інструменти для збірки посилені згідно з найкращими практиками та рекомендаціями постачальників.
- Секрети, необхідні для збірки, зашифровані, а доступ контролюється за принципом найменших привілеїв.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.

---
#### 147

### Потік A - Процес збірки

#### Рівень зрілості 3

**Переваги**: Забезпечення того, що ви створюєте програмне забезпечення, яке відповідає вимогам безпеки.

**Активності**:
1. Визначте перевірки безпеки, які мають виконуватись під час процесу збірки, а також мінімальні критерії для успішного завершення збірки — ці вимоги можуть варіюватись залежно від ризик-профілю різних застосунків.
2. Додайте відповідні перевірки безпеки до процесу збірки та забезпечте зупинку збірки, якщо встановлені критерії не виконані.
3. Запровадьте систему попередження для проблем нижче порогового значення та відстежуйте ці попередження у централізованій системі для подальшого контролю і прийняття заходів.
4. Якщо доцільно, реалізуйте механізм винятків, який дозволить обійти це правило у випадках, коли ризик певної вразливості було прийнято або пом'якшено. Проте переконайтесь, що такі випадки явно схвалені та записані разом із поясненням.

---
#### 148
### Потік A - Процес збірки

#### Рівень зрілості 3

**Питання**: Чи забезпечується автоматична перевірка безпеки у ваших процесах збірки?

**Критерії якості**:
- Збірки провалюються, якщо програма не відповідає заздалегідь визначеному мінімуму з безпеки.
- Ви маєте максимальний прийнятний рівень серйозності для вразливостей.
- Попередження та помилки фіксуються у централізованій системі.
- Ви обираєте та налаштовуєте інструменти для перевірки кожного застосунку на відповідність вимогам безпеки принаймні раз на рік.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.

---
#### 149
### Потік B - Програмні залежності

#### Рівень зрілості 1

**Переваги**: Доступна інформація про відомі проблеми безпеки в залежностях.

**Активності**:
1. Ведіть записи про всі залежності, які використовуються в цільовому виробничому середовищі. Це часто називається Bill of Materials (BOM).
2. Врахуйте, що різні компоненти програми можуть використовувати різні залежності. Наприклад, якщо програмний пакет — це веб-додаток, покрийте як серверний код програми, так і клієнтські скрипти.
3. При складанні цих записів враховуйте різні місця, де можуть бути вказані залежності, такі як файли конфігурації, директорія проєкту на диску, інструмент управління пакетами або сам код (наприклад, IDE, що підтримує список залежностей).

Збирайте таку інформацію про кожну залежність:
- Де вона використовується або посилається.
- Версія, що використовується.
- Ліцензія.

---
#### 150
### Потік B - Програмні залежності

#### Рівень зрілості 1

**Активність (продовження)**

- Інформація про джерело (посилання на репозиторій, ім'я автора тощо).
- Статус підтримки та обслуговування залежності.

Перевіряйте записи, щоб виявити залежності з відомими вразливостями, і оновлюйте або замінюйте їх відповідно.

---
#### 151
### Потік B - Програмні залежності

#### Рівень зрілості 1

**Питання**: Чи ви добре обізнані про залежності, на які покладаєтеся?

**Критерії якості**:
- У вас є актуальний Bill of Materials (BOM) для кожного застосунку.
- Ви можете швидко визначити, які застосунки зачеплені певним CVE (вразливістю).
- Ви аналізували, вирішували та документували проблеми із залежностями принаймні один раз за останні три місяці.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.

---
#### 152
### Потік B - Програмні залежності

#### Рівень зрілості 2

**Переваги**: Повна прозорість щодо відомих проблем безпеки в залежностях.

**Активності**:
1. Оцінюйте використовувані залежності та створюйте список прийнятних залежностей, схвалених для використання у проєкті, команді або в організації загалом відповідно до визначених критеріїв.
2. Впровадьте центральний репозиторій залежностей, на основі якого можуть бути створені всі програмні продукти.
3. Регулярно переглядайте залежності, щоб переконатися, що:
   - вони правильно ліцензовані,
   - не мають відомих серйозних вразливостей, що можуть впливати на ваші застосунки,
   - залежать від компонентів, що активно підтримуються і обслуговуються,
   - використовуються актуальні версії.

---
#### 153
### Потік B - Програмні залежності

#### Рівень зрілості 2

**Активність (продовження)**

- Переконайтеся, що є обґрунтована причина для включення залежності.

Реагуйте своєчасно та відповідно на невідповідності, розглядаючи їх як дефекти. Розгляньте можливість використання автоматизованих інструментів для сканування вразливих залежностей та призначення виявлених проблем відповідним командам розробників.

---
#### 154
### Потік B - Програмні залежності

#### Рівень зрілості 2

**Питання**: Чи ви керуєте ризиками, пов'язаними з залежностями від третіх сторін, за допомогою формального процесу?

**Критерії якості**:
- Ви ведете список схвалених залежностей, що відповідають визначеним критеріям.
- Ви автоматично оцінюєте залежності щодо нових CVE (вразливостей) і повідомляєте відповідальним працівникам.
- Ви автоматично виявляєте зміни ліцензій, що можуть вплинути на легальне використання застосунку.
- Ви відстежуєте та сповіщаєте про використання залежностей, що більше не підтримуються.
- Ви надійно виявляєте і видаляєте непотрібні залежності з програмного забезпечення.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.

---
#### 155

### Потік B - Програмні залежності

#### Рівень зрілості 3

**Переваги**: Обробка питань безпеки в залежностях на рівні, подібному до власного коду.

**Активності**:
**Переваги**: Обробка питань безпеки в залежностях на рівні, подібному до власного коду.

**Активності**:
1. Підтримуйте "whitelist" (білий список) схвалених залежностей і версій. Переконайтеся, що процес збірки зупиняється, якщо виявлено залежність, якої немає в списку.
2. Включіть процес схвалення для обробки винятків з цього правила, якщо це доцільно.
3. Проводьте перевірку безпеки для залежностей зі списку, використовуючи методи, аналогічні тим, що застосовуються до цільових застосунків (особливо за допомогою SAST і аналізу транзитивних залежностей).
4. Забезпечте, щоб ці перевірки також націлювались на виявлення потенційних прихованих дефектів або бекдорів у залежностях.
5. Встановіть процес розкриття вразливостей із залученням авторів залежностей, зокрема узгодьте рівні сервісу (SLAs) для виправлення проблем.
6. У випадку, коли дотримання SLA є нереальним (наприклад, для відкритих проектів), передбачте і забезпечте компенсуючі заходи для пом'якшення ризиків.
7. Реалізуйте регресійне тестування для виправлення виявлених проблем.

---
#### 156

### Потік B - Програмні залежності

#### Рівень зрілості 3

**Активність (продовження)**

Відстежуйте всі виявлені проблеми та їхній стан за допомогою системи відстеження дефектів. Інтегруйте конвеєр збірки із цією системою, щоб процес збірки зупинявся, коли включені залежності містять проблеми вище визначеного рівня критичності.

---
#### 157
### Потік B - Програмні залежності

#### Рівень зрілості 3

**Питання**: Чи ви запобігаєте створенню програмного забезпечення, якщо воно зачеплене вразливостями в залежностях?

**Критерії якості**:
- Ваша система збірки підключена до системи відстеження ризиків залежностей від третіх сторін, і збірка зупиняється, якщо вразливість не оцінена як хибнопозитивна або ризик не прийнятий офіційно.
- Ви скануєте залежності за допомогою інструменту статичного аналізу.
- Ви повідомляєте виявлені проблеми авторам залежностей, використовуючи встановлений процес відповідального розкриття.
- Використання нових залежностей, не оцінених на ризики безпеки, призводить до зупинки збірки.

**Відповіді**:
- Ні.
- Так, для деяких застосунків.
- Так, для принаймні половини застосунків.
- Так, для більшості або всіх застосунків.

---