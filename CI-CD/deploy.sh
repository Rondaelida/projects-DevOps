#!/bin/bash

sshpass -p "student" ssh student@192.168.100.10 'echo student | sudo -S rm /usr/local/bin/s21* 2>/dev/null'
sshpass -p "student" scp src/C3_SimpleBashUtils/cat/s21_cat student@192.168.100.10:/tmp/s21_cat
sshpass -p "student" scp src/C3_SimpleBashUtils/grep/s21_grep student@192.168.100.10:/tmp/s21_grep
sshpass -p "student" ssh student@192.168.100.10 'echo student | sudo -S mv /tmp/s21* /usr/local/bin 2>/dev/null | ls /usr/local/bin'
echo done