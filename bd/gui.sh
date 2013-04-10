#!/bin/bash

# imports
source sql_helper.sh
source input_helper.sh

# Get domain name
_zenity="/usr/bin/zenity"
_out="/tmp/files.output.$$"

# Ввод информации и Инициализация БД


get_login __login
get_password __password
get_ip __ip

SqlHelperInitialize $__login $__password $__ip

# Создание БД
CreateDB create_result

echo "$create_result"

echo $?

#if [ $? -eq 0 ]
#then

#  zenity --list --title="Работа с БД" --text="Выберите сущность для просмотра:" --column="Сущность" Происшествия Участники 
#fi


