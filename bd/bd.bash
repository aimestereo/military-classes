#!/bin/bash

MYSQL=`which mysql`

SQL=()
SQL+="DROP DATABASE IF EXISTS StreetsSituations;"
SQL+="CREATE DATABASE IF NOT EXISTS StreetsSituations;"
SQL+="USE StreetsSituations;"
SQL+="CREATE TABLE people (
    id   INT,
    firstname VARCHAR(15),
    lastname VARCHAR(15),
    middlename VARCHAR(15),
)"

SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(0,'Кладов', 'Стас', 'Александрович');"
SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(1,'Меньшиков', 'Никита', 'Махнович');"
SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(2,'Прокопчук', 'Андрей', 'Геннадьевич');"
 
#if [ $# -ne $EXPECTED_ARGS ]
#then
#  echo "Usage: $0 dbname dbuser dbpass"
#  exit $E_BADARGS
#fi
 
$MYSQL -u root -h 192.168.222.209 -p -e "$SQL"
