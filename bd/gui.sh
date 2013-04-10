#!/bin/bash

# imports
source sql_helper.sh
SqlHelperInitialize

# Get domain name
_zenity="/usr/bin/zenity"
_out="/tmp/files.output.$$"

if ! zenity --width=250 \
          --entry --title="Вход в систему" \
          --text="Введите свой логин:" \
          --entry-text="root"
then
  zenity --error --text="Логин не введён"
  exit 0
fi

login=$?

if ! zenity --width=250 \
          --entry --title="Проверка прав доступа" \
          --text="Введите свой пароль:" \
          --entry-text="" --hide-text
then
  zenity --error --text="Пароль не введён"
  exit 0
fi

password=$?

CreateDB $login $password

if [ $? -eq 0 ]
then

  zenity --list --title="Работа с БД" \
         --text="Выберите сущность для просмотра:" \
         --column="Сущность" \ 
         Происшествия Участники 
fi





	

#  ans=$(${_zenity} --list --text "Show List" --checklist --column "Pick" --column "List" "${list[@]}" --separator=":")
#  echo $ans

