# Simple Docker
## Contents 
   1. [Ready-made docker](#part-1-ready-made-docker)
   2. [Operations with container](#part-2-operations-with-container) 
   3. [Mini web server](#part-3-mini-web-server)
   4. [Your own docker](#part-4-your-own-docker)
   5. [Dockle](#part-5-dockle)
   6. [Basic Docker Compose](#part-6-basic-docker-compose)


## Part 1. Ready-made docker
- Взял официальный докер образ с nginx и выкачал его при помощи `docker pull nginx`
   ![Вывод команды docker pull nginx](/Screen/1.png)

- роверил наличие докер образа с помощью команды `docker images`
  ![Alt text](/Screen/2.png)

- Запустил докер образ через `docker run -d [image_id|repositor` и проверил, что образ запустился через `docker ps` 
![Alt text](/Screen/3.png) 
  
- Посмотрел информацию о контейнере через `docker inspect`
   ![Alt text](/Screen/4.png)

##### По выводу команды определить и поместить в отчёт:  
- размер контейнера `docher ps -s`
   ![Alt text](/Screen/5.png) 
- список замапленных портов
   ![Alt text](/Screen/6.png)
- ip контейнера через `docker inspect 5db00410dbb3 | grep IPAdd`
   ![Alt text](/Screen/7.png)

- Остановил докер образ через `docker stop [container_id|container_name]` и проверил, что образ остановился через `docker ps`  
   ![Alt text](/Screen/8.png)
- Запустил докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run* и проверил результат через `docker ps`
![Alt text](/Screen/9.png)

- Проверил, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
   ![Alt text](/Screen/10.png)

- Перезапустил докер контейнер через `docker restart [container_id|container_name]`
   ![Alt text](/Screen/11.png)

- Проверил, что контейнер запустился, повторно ввел в адресной строке localhost:80
   ![Alt text](/Screen/12.png)
___

## Part 2. Operations with container
- Прочитал конфигурационный файл *nginx.conf* внутри докер контейнера через команду `docker exec 8bdc2fe6075d cat /etc/nginx/nginx.conf` где 8bdc2fe6075d = CONTAINER ID
   ![Alt text](/Screen/13.png)

- Создал на локальной машине файл *nginx.conf* и настроил в нем по пути */status* отдачу страницы статуса сервера **nginx** 
   ![Alt text](/Screen/14.png)

- Скопировал созданный файл *nginx.conf* внутрь докер образа через команду `docker cp nginx.conf 8bdc2fe6075d:/etc/nginx/` и перезапустил **nginx** внутри докер образа через команду `docker exec 8bdc2fe6075d nginx -s reload`
   ![Alt text](/Screen/15.png)

- Проверил, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
   ![Alt text](/Screen/16.png)

- Экспортировал контейнер в файл *container.tar* через команду `docker export 8bdc2fe6075d > container.tar` и проверил наличие через `ls`  
   ![Alt text](/Screen/17.png)

- Остановил контейнер `docker stop 8bdc2fe6075d` и проверил `docker ps`
   ![Alt text](/Screen/18.png)

- Удалил образ через `docker rmi a6bd71f48f68 -f`, не удаляя перед этим контейнеры, предварительно вывел список образов `docker images -a`
   ![Alt text](/Screen/19.png)

- Удалил остановленный контейнер `docker rm 8bdc2fe6075d`
   ![Alt text](/Screen/20.png)

- Импортировал контейнер обратно через команду `docker import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' container.tar nginx_imp`
   ![Alt text](/Screen/21.png)

- Проверил, что контейнер импортировался  `docker images`, после чего запустил импортированный контейнер `docker run -dp 80:80 -p 443:443 512c78f137e9`.
   ![Alt text](/Screen/22.png)

- Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx** 
   ![Alt text](/Screen/23.png)
___

## Part 3. Mini web server
- Написать мини сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`
   ![Alt text](/Screen/24.png)
- Написать свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080* 
   ![Alt text](/Screen/25.png)
- Cкачал образ Docker для nginx `docker pull nginx` и запустил контейнер с именем "hello" в фоновом режиме `-d` с привязкой порта 81 на хосте к порту 81 контейнера `docker run docker run -d -p 81:81 --name hello nginx` 
![Alt text](/Screen/26.png)
- Копировал созданные файлы server.c и nginx.conf в `/etc/nginx/` внутри созданного контейнера `hello`.
   ![Alt text](/Screen/27.png)

- Обновил пакеты внутри контейнера командой `docker exec hello apt-get update` После чего выполнил команду `docker exec hello apt-get install -y gcc spawn-fcgi libfcgi-dev` для установки пакетов gcc, spawn-fcgi и libfcgi-dev 
   ![Alt text](/Screen/28.png)

- При помощи gcc с флагом `-lfcgi`(подключение либы libfcgi) компилирую файл server.c `docker exec hello gcc /etc/nginx/server.c -lfcgi`
- Запустил процесс `spawn-fcgi`, который обслуживает внешние запросы к `a.out` с прослушкой порта 8080 на вхождение.
- Перезагрузил процессы nginx и вывел в консоль http запрос по `localhost:81`
   ![Alt text](/Screen/30.png)
- Проверил, что в браузере по *localhost:81* отдается написанная вами страничка
   ![Alt text](/Screen/29.png)
---
## Part 4. Your own docker
#### Написать свой докер образ, который: 
##### Основан на последней версии nginx:
##### Копирует локальный файл nginx.conf по указанному пути внутрь контейнера `/etc/nginx/nginx.conf`
##### Копирует локальный `server.c` внутрь контейнера в корневой каталог
- Запустил образ и обновил пакеты внутри контейнера  `apt-get update` После чего выполнил команду `apt-get install -y gcc spawn-fcgi libfcgi-dev` для установки пакетов gcc, spawn-fcgi и libfcgi-dev 
   ![Alt text](/Screen/31.png)

- Собрал написанный докер образ через `docker build . -t name_repo:tag`. Флаг -t (аналог --tag) устанавливает имя и тег.
-  Запустил собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки *./nginx* внутрь контейнера по адресу, где лежат конфигурационные файлы **nginx**'а `docker run -d -p 80:81 --name hello_name name_repo:tag`  
   ![Alt text](/Screen/32.png)
- Проверил через `docker images`, что все собралось корректно
   ![Alt text](/Screen/33.png)

- Проверил, что по localhost:80 доступна страничка написанного мини сервера
- Проверить, что теперь по *localhost:80/status* отдается страничка со статусом **nginx**
   ![Alt text](/Screen/34.png)
   ![Alt text](/Screen/35.png)
____

## Part 5. **Dockle**
- Установил dockle через `brew install goodwithtech/r/dockle`
- Просканировал образ из предыдущего задания через `dockle [image_id|repository]`
   ![Alt text](/Screen/36.png)
- Исправил образ так, чтобы при проверке через **dockle** не было ошибок и предупреждений
   ![Alt text](/Screen/37.png)
____

## Part 6. Basic **Docker Compose**
- Написал файл docker-compose.yml
   ![Alt text](/Screen/38.png)
- Проверил, что в браузере по localhost:80 отдается написанная  страничка, как и ранее
![Alt text](/Screen/39.png)

