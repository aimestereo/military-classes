#!/bin/bash

# Get domain name
_zenity="/usr/bin/zenity"
_out="/tmp/files.output.$$"

function get_login()
{
  local result=$1

  local _login=$(${_zenity} --width=250 --title="Вход в систему" --text="Введите свой логин:" --entry --entry-text="root")

  if [ ! $? -eq 0 ]
  then
    zenity --error --text="Логин не введён"
    exit 0
  fi

  eval $result="'$_login'"
}

function get_password()
{
  local result=$1

  local password=$(${_zenity} --width=250 --title="Проверка прав доступа" --text="Введите свой пароль:" --entry --entry-text="" --hide-text)

  if [ ! $? -eq 0 ]
  then
    zenity --error --text="Пароль не введён"
    exit 0
  fi

  eval $result="'$password'"
}

function get_ip()
{
  local result=$1

  local default_ip="192.168.222.165"

  local ip=$(${_zenity} --width=250 --title="Ввод ip адреса БД" --text="Проверьте ip:" --entry --entry-text="$default_ip")

  if [ ! $? -eq 0 ]
  then
    zenity --error --text="Ip не введён"
    exit 0
  fi

  eval $result="'$ip'"
}
