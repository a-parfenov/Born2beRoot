### Оглавление
    
    -> 1) Основные команды и тезисы
    -> 2) Переведенный subject с полезными заметками
    -> 3) Полезные ссылки

P.S. Материал собрал из информации, которой делились со мной + что нашел сам. Она не является исчерпывающей, так что вам все равно придется гуглить ;)
    
### Команды и тезисы
    
    
    1) Легче скачать и использовать Debian, чем CentOS (если нет опыта);
    2) Виртуальная машина используют софт вместо самого компьютера для запуска программ на ней. Также на ВМ можно независимо от основной ОС запускать одновременно другие ОС;
    3) ВМ позволяет запускать различные программы, использующие другие ОС на одной и той же машине или безопасно запускать программы в режиме "песочницы";
    4) ВМ симулирует аппаратное обеспечение, что позволяет запускать ВМ на основной машине;
    5) Aptitude - это менеджер пакетов высокого уровня, который может использовать менеджеры пакетов низкого уровня, такие как apt-get;
    6) AppArmor - защитный модуль Linus Kernel, который позволяет системному администратору ограничивать возможности программ с помощью профилей программ;
    7) SSH (Secure Shell или Secure Socket Shell) - это сетевой протокол, который дает пользователям, особенно системным администраторам, безопасный способ доступа к компьютеру по     незащищенной сети;
    8) Sudo - это альтернатива su для выполнения команд с правами суперпользователя (root).
    9) Cron — это хронологический демон-планировщик задач, работающий в операционных системах типа Unix, включая дистрибутивы Linux.
    10) Проверьте информацию об истечении срока действия пароля вновь созданного пользователя с помощью 
    // sudo chage -l <username>
    	Файл crontab содержит инструкции для cron в следующем упрощенном виде: «запустить эту команду в это время в этот день».
    
    11) 
    	| You have to create a new user here    |
    	| $ sudo adduser username               | <- создание нового пользователя
    	| $ sudo chage -l username              | <- Поддтверждение срока действия нового пароля для пользователя 
    	| $ sudo adduser username sudo          |
    	| $ sudo adduser username user42        | <- Присвоенике нового пользователя группа суду и юзер42;
    12)
    	| 1) lsblk                              1 <- Проверить разделы
    	| 2) sudo aa-status                     2 <- Статус AppArmor
    	| 3) getent group sudo                  3 <- Пользователи группы суду
    	| 4) getent group user42                4 <- Пользователи группы юзер42
    	| 5) sudo service ssh status            5 <- Статус SSH
    	| 6) sudo ufw status                    6 <- Статус UFW
    	| 7) ssh aleslie@localhost -p 4242      7 <- присоединиться к виртуальной машине через SSH	
    	| 8) vim /etc/sudoers.d/<filename>      8 <- Файл конфигурации суду (можно сначала прописать $ ls /etc/sudoers.d)
    	| 9) vim /etc/login.defs                9 <- Файл политики истечения срока паролей
    	| 10) vim /etc/pam.d/common-password    10 <- Файл политики паролей
    	| 11) sudo crontab -l                   11 <- схема cron
    	| 12) passwd                            12 <- изменить пароль
    
    13) Измение хоста.
    	$ hostnamectl - проверить текущие имя хоста
    	$ hostnamectl set-hostname new_hostname - изменить имя хоста
    	$ sudo vim /etc/hosts - файл с хостами 
    	$ sudo reboot - ребут 
    14) $ sudo apt update 
    	$ cd <nameofnewdirectory> && ls
    	$ cat log <- Input log
    	$ cat ttyout <- Output log
    15) Удаление порта 8080 в UFW
    	$ sudo ufw allow 8080 <- allow
    	$ sudo ufw status <- check
    	$ sudo ufw deny 8080 <- deny (yes)
    16) $ Сборка подписи виртуального диска (нужно перейти в папку с проектом, создается дольше минуты)
    	$ shasum <name> > signature.txt
    
    
    
### Переведенный subject с полезными заметками
    
Ссылка на subject: https://cdn.intra.42.fr/pdf/pdf/31621/en.subject.pdf

    	• Использование VirtualBox (или UTM, если вы не можете использовать VirtualBox) является обязательным.
    	• Вам нужно только сдать signature.txt файл в корневом каталоге вашего репозитория. Вы
    	должны вставить в него подпись виртуального диска вашей машины. Для получения дополнительной информации перейдите к разделу Отправка и
    	экспертная оценка.
    
    
    Этот проект состоит в том, чтобы вы настроили свой первый сервер, следуя определенным правилам.
    
    
    	Поскольку речь идет о настройке сервера, вы установите
    	минимум сервисов. По этой причине графический интерфейс
    	здесь бесполезен. Поэтому запрещается устанавливать X.org или любой другой
    	эквивалентный графический сервер. В противном случае ваша оценка будет равна 0.
    
    
    	Вы должны выбрать в качестве операционной системы либо последнюю стабильную версию Debian (без
    	тестирования/нестабильную), либо последнюю стабильную версию CentOS. Debian настоятельно рекомендуется
    	, если вы новичок в системном администрировании.
    
    Настройка CentOS довольно сложна. Поэтому вам не нужно
    настраивать KDump. Однако SELinux должен быть запущен при запуске, и его
    конфигурация должна быть адаптирована к потребностям проекта. AppArmor
    для Debian также должен быть запущен при запуске.  
    // Проверить -  sudo aa-status 
    
    Вы должны создать не менее 2 зашифрованных разделов с помощью LVM. Ниже приведен пример
    ожидаемого разделения: 
    // Проверка - lsblk
    
    Во время защиты вам будет задано несколько вопросов о
    выбранной вами операционной системе. Например, вы должны знать
    разницу между aptitude и apt, или что такое SELinux или AppArmor
    	Короче говоря, поймите, что вы используете!
    // Aptitude - это менеджер пакетов высокого уровня, который может использовать менеджеры пакетов низкого уровня, такие как apt-get;
    // Aptitude имеет только текстовый и интерактивный пользовательский интерфейс. 
    	Возможности apt-get ограничены возможностями командной строки, в то время как Aptitude - инструмент более высокого уровня, 
    	с текстовым интерактивном интерфейсом, а а также возможностью работы через командную строку.
    
    // SELinux или Security Enhanced Linux — это улучшенный механизм управления доступом. 
    	Реализация системы принудительного контроля доступа, которая может работать параллельно с классической избирательной системой контроля доступа.
    // AppArmor - защитный модуль Linus Kernel, который позволяет системному администратору ограничивать возможности программ с помощью профилей программ;
    
    Служба SSH будет работать только на порту 4242. По соображениям безопасности не должно быть
    возможности подключиться с помощью SSH в качестве root.
    
    Использование SSH будет проверено во время защиты путем создания новой
    учетной записи. Поэтому вы должны понимать, как это работает. 
    // sudo service ssh status
    
    Вы должны настроить свою операционную систему с помощью брандмауэра UFW и, таким образом, оставить открытым только
    порт 4242.  
    // Проверка порта - sudo ufw status numbered
    // добавить - sudo ufw allow 8080
    // удалить порт - sudo ufw delete
    // Расположение файла - sudo vi /etc/ssh/sshd_config
    // Номер порта - sudo grep Port /etc/ssh/sshd_config
    
    Ваш брандмауэр должен быть активен при запуске виртуальной машины.
    // sudo ufw status
    
    Имя хоста вашей виртуальной машины должно быть вашим именем входа, заканчивающимся на 42 (например,
    wil42). Вам придется изменить это имя хоста во время оценки.
    • Вы должны внедрить надежную политику паролей.
    • Вы должны установить и настроить sudo в соответствии со строгими правилами.
    • В дополнение к пользователю root должен присутствовать пользователь с вашим логином в качестве имени пользователя.
    • Этот пользователь должен принадлежать к группам user42 и sudo.
    // Проверка групп у пользователя - groups
    
    Во время защиты вам придется создать нового пользователя и назначить его
    в группу.
    // sudo adduser <username>
    // getent passwd <username>
    // Проверка пароля - sudo chage -l <username>
    // sudo addgroup <user42>
    // sudo adduser <username> user42
    // getent group user42
    
    Чтобы настроить надежную политику паролей, вы должны соответствовать следующим требованиям:
    • Срок действия вашего пароля истекает каждые 30 дней.
    • Минимальное количество дней, разрешенных до изменения пароля
    , будет установлено равным 2.
    • Пользователь должен получить предупреждающее сообщение за 7 дней до истечения срока действия его пароля.
    • Ваш пароль должен содержать не менее 10 символов. Он должен содержать заглавную
    букву и цифру. Кроме того, он не должен содержать более 3 последовательных одинаковых
    символов.
    Пароль не должен содержать имя пользователя.
    • Следующее правило не применяется к паролю root: пароль должен содержать
    не менее 7 символов, которые не являются частью предыдущего пароля.
    • Конечно, ваш пароль root должен соответствовать этой политике.
    // файл с настройками - vim /etc/login.defs
    // Файл с настройкой политики паролей - sudo visudo
    
    	После настройки файлов конфигурации вам придется изменить
    	все пароли учетных записей, присутствующих на виртуальной машине,
    	включая учетную запись root.
    
    Чтобы настроить надежную конфигурацию для вашей группы sudo, вы должны соответствовать
    следующим требованиям:
    • Аутентификация с использованием sudo должна быть ограничена 3 попытками в случае неправильного пароля.
    • Пользовательское сообщение по вашему выбору должно отображаться, если
    при использовании sudo возникает ошибка из-за неправильного пароля.
    • Каждое действие с использованием sudo должно быть заархивировано, как входы, так и выходы. Файл журнала
    должен быть сохранен в папке /var/log/sudo/.
    • Режим TTY должен быть включен по соображениям безопасности. // 1?
    • Также по соображениям безопасности пути, которые могут использоваться sudo, должны быть ограничены.
    Пример:
    /usr/локальный/sbin:/usr/локальный/бин:/usr/sbin:/usr/бин:/sbin:/бин:/привязка/бин
    
    Наконец, вам нужно создать простой скрипт под названием monitoring.sh . Он должен быть разработан в bash.
    При запуске сервера скрипт будет отображать некоторую информацию (перечисленную ниже) на всех терминалах каждые 10 минут (посмотрите на стену). Баннер является необязательным.     Ошибка не должна
    быть видна.
    Ваш скрипт всегда должен иметь возможность отображать следующую информацию:
    • Архитектура вашей операционной системы и версия ее ядра.
    • Количество физических процессоров.
    • Количество виртуальных процессоров.
    • Текущая доступная оперативная память на вашем сервере и коэффициент ее использования в процентах.
    • Текущая доступная память на вашем сервере и коэффициент ее использования в процентах.
    • Текущий коэффициент использования ваших процессоров в процентах.
    • Дата и время последней перезагрузки.
    • Независимо от того, активен LVM или нет.
    • Количество активных подключений.
    • Количество пользователей, использующих сервер.
    • IPv4-адрес вашего сервера и его MAC-адрес (Управление доступом к Мультимедиа).
    • Количество команд, выполняемых с помощью программы sudo.
    // bash /usr/local/bin/monitoring.sh
    // vim /usr/local/bin/monitoring.sh
    
    Во время защиты вас попросят объяснить, как работает этот скрипт
    работает. Вам также придется прервать его, не изменяя.
    Взгляните на крона. // 1?
    // Прервать работу скрипта - sudo crontab -u root -e
    
    Ниже приведены две команды, которые вы можете использовать для проверки некоторых требований субъекта:
    // /usr/sbin/ufw status
    
    
### Представление и коллегиальная оценка
    
    
    Представление и коллегиальная оценка
    Вам нужно только сдать signature.txt файл в корневом каталоге вашего репозитория Git. Вы
    должны вставить в него подпись виртуального диска вашей машины. Чтобы получить эту подпись, вам
    сначала нужно открыть папку установки по умолчанию (это папка, в которой
    сохранены ваши виртуальные машины).:
    • Windows: %ДОМАШНИЙ ДИСК%%ДОМАШНИЙ ПУТЬ%\Виртуальные машины VirtualBox\
    • Linux: ~/Виртуальные машины VirtualBox/
    • MacM1: ~/Библиотека/Контейнеры/com.utmapp.UTM/Данные/Документы/
    • macOS: ~/Виртуальные машины VirtualBox/
    Затем извлеките подпись из файла ".vdi" (или ".qcow2 для пользователей UTM") вашего
    виртуальная машина в формате sha1. Ниже приведены 4 примера команд для файла centos_server.vdi
    :
    • Windows: сертификат - хэш-файл centos_serv.vdi sha1
    • * Для Linux: centos_server помощью sha1sum.ВДИ
    • Для Mac M1: shasum Centos.utm/Изображения/диск-0.qcow2
    • * macOS: shasum centos_server.vdi**macOS: shasum centos_server.vdi
    Это пример того, какой результат вы получите:
    • 6e657c4619944be17df3c31faa030c25e43e40af
    
    
    Пожалуйста, обратите внимание, что подпись вашей виртуальной машины может быть изменена
    после вашей первой оценки. Чтобы решить эту проблему, вы можете
    скопировать свою виртуальную машину или использовать функцию сохранения состояния.
    
    Конечно, ЗАПРЕЩЕНО включать виртуальную машину в репозиторий Git. Во время защиты подпись signature.txt
    файл будет сравниваться с файлом вашей виртуальной машины. Если
    они не идентичны, ваша оценка будет равна 0.
    
    
### Полезные ссылки
    
>| -> Для понимания темы:
>https://www.youtube.com/watch?v=13YBlD0SOJo
>
>| -> Мануалы:
>
>Оба кривые, первый получше. Для выполнения проекта понадобятся оба, но сначала посмотрите видео и почитайте об основных моментах.
>
>https://github.com/hanshazairi/42-born2beroot#step-3-connecting-to-server-via-ssh
>https://baigal.medium.com/born2beroot-e6e26dfb50ac
    
      
#### 1) AppArmor 
    
   https://help.ubuntu.ru/wiki/руководство_по_ubuntu_server/безопасность/apparmor
   AppArmor - это реализация Модуля безопасности линукс по управлению доступом на основе имен. AppArmor ограничивает отдельные программы 
   набором перечисленных файлов и возможностями в соответствии с правилами Posix 1003.1e
    
   Проверить статус AppArmor sudo apparmor_status
    
#### 2) Настройка портов SSH и UFW
    
   nano /etc/ssh/sshd_config - с помощью редактора меняем строку Port 22 на Port 4242
    
   В с строке  PermitRootLogin ставим no чтобы запретить авторизацию от имени суперпользователя
    
   Установка UFW
   apt install ufw
    
    -запуск ufw enable
    -остановка uff disable
    -разрешить порт sudo ufw allow 4242
    -проверить статус sudo ufw status verbose
    -удалить правило ufw sudo ufw delete allow 4242
    -сброс uff sudo ufw reset

#### 3) Create a new user and assign it to a group
    
    Создать пользователя
    sudo adduser pes228
    
    Удалить пользователя
    sudo deluser name
    sudo userdel name
    https://losst.ru/kak-udalit-polzovatelya-linux
    
    Просмотреть список групп пользователя
    Id -Gn
    
    Просмотреть список пользователей можно с помощью файла /etc/passwd , в котором 
    Хранится вся информация об учетных записях
    	
    less /etc/passwd 
    
    Создать группуd
    sudo groupadd <name> 
    
    Добавить в группу можно с помощью команды sudo usermod -a -G wheel user
    https://losst.ru/kak-dobavit-polzovatelya-v-gruppu-linux
    
    -a - добавить пользователя в те группы, которые указаны после ключа -G, если не указать ключ a,
    то все старые группы затрутся, что может вызвать проблемы
    
#### 4) Implement a strong password policy
    - Your password has to expire every 30 days. nano /etc/login.defs строчка PASS_MAX_DAYS 30
    - minimum number of days allowed PASS_MIN_DAYS 2
    - Warning message 7 days before their password expires PASS_WARN_AGE 7
    
    chage -l aleslie показать правила пароля у chage

    Чтобы настроить всю бороду с количеством и качеством букв в пароле скачиваем пакет libpam-pquality
    sudo apt-get install libpam-pwquality

    Затем заходим в файл /etc/pam.d/common-password и устанавливаем нужные параметры в строку 25
https://computingforgeeks.com/enforce-strong-user-password-policy-ubuntu-debian/


#### 5) Set up a strong configuration for your sudo group
https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
    tty показывает имя терминала, который мы используем
https://zalinux.ru/?p=4490
    
#### 6) Script called monitoring.sh
    
#### 7) Изменить hostname 
    (sudo) hostnamectl set-hostname {name-here}
    
#### 8) Разница между apt и aptitude
https://www.tecmint.com/difference-between-apt-and-aptitude/
    
#### 9) Разница между centOS и Debian
https://forums.centos.org/viewtopic.php?t=71948
    
#### 10) Подробнее о разделах файловой системы
    
https://help.ubuntu.ru/wiki/разделы_и_файловые_системы_linux#виды_разделов
    
#### 11) Что такое LVM и как оно работает
https://habr.com/ru/post/67283/
https://www.dmosk.ru/terminus.php?object=lvm
https://interface31.ru/tech_it/2020/07/lvm-dlya-nachinayushhih-chast-1-obshhie-voprosy.html
    
 #### 12) Как добавить пользователя в группу sudo(кроме visudo)
   usermod -aG sudo aleslie

#### 13) Что такое UFW 
    https://ru.wikipedia.org/wiki/Uncomplicated_Firewall
    
#### 14) Как удалить пользователя 
    deluser aleslie --remove-all-files
https://losst.ru/kak-udalit-polzovatelya-linux
    
    Удалить пользователя из группы
    sudo gpasswd -d aleslie sudo
https://losst.ru/udalit-polzovatelya-iz-gruppy-linux
    
#### 15) Что такое SSH
    SSH (англ. Secure Shell — «безопасная оболочка»[1]) — сетевой протокол прикладного уровня, 
    позволяющий производить удалённое управление операционной системой и туннелирование     TCP-соединений
https://ru.wikipedia.org/wiki/SSH
    
#### 16) Crontab
https://winitpro.ru/index.php/2020/04/21/planirovshhik-zadach-cron-v-linux/
    cat /var/spool/cron/root
