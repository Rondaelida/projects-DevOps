## Part 1. Настройка gitlab-runner

- Поднять виртуальную машину Ubuntu Server 20.04 LTS
    ![Alt text](./screen/1.png)

- Скачать и установить на виртуальную машину gitlab-runner:
 `curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash`
 `apt-cache madison gitlab-runner`
 `sudo apt-get install gitlab-runner=14.9.1`
- Устанавливаем все необходимые пакеты в Ubuntu:
`sudo apt install make`
`sudo apt install gcc`
`sudo apt install clang-format`
    ![Alt text](screen/2.png)

- Регистрируем проект:
`sudo gitlab-runner register, указываем URL, токен и тэг`
    ![Alt text](screen/3.png)
----

## Part 2. Сборка
- Этап по сборке приложений представлен в `.gitlab-ci.yml stage: build:`
    ![Alt text](screen/4.png)
- Запускаем на Ubuntu gitlab-runner командой `gitlab-runner run`
    ![Alt text](screen/5.png)

## Part 3. Тест кодстайла  
- Не забываем дописать этап в начало `.gitlab-ci.yml` 
    ![Alt text](screen/6.png) 
    ![Alt text](screen/7.png)

# конец 