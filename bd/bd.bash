#!/bin/bash

MYSQL=`which mysql`

SQL=()
SQL+="DROP DATABASE IF EXISTS StreetsSituations;"
SQL+="CREATE DATABASE IF NOT EXISTS StreetsSituations;"
SQL+="USE StreetsSituations;"

# People
SQL+="CREATE TABLE people (
    id   INT,
    firstname VARCHAR(15),
    lastname VARCHAR(15),
    middlename VARCHAR(15)
);"

SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(0,'Кладов', 'Стас', 'Александрович');"
SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(1,'Меньшиков', 'Никита', 'Махнович');"
SQL+="INSERT INTO people (id,lastname,firstname,middlename) VALUES(2,'Прокопчук', 'Андрей', 'Геннадьевич');"
 
# Type
SQL+="CREATE TABLE type (
    id   INT,
    type VARCHAR(15)
);"

SQL+="INSERT INTO type (id,type) VALUES(0,'Авария');"
SQL+="INSERT INTO type (id,type) VALUES(1,'Столкновение');"
SQL+="INSERT INTO type (id,type) VALUES(2,'Наезд');"

# Event
SQL+="CREATE TABLE event (
    id   INT,
    typeId INT,
    linkId INT,
    description VARCHAR(100)
);"

SQL+="INSERT INTO event (id,typeId,linkId,description) VALUES(0,0,0, 'Водитель врезался в столб');"

# link
SQL+="CREATE TABLE event (
    linkId INT,
    peopleId INT
);"

SQL+="INSERT INTO event (id,typeId,linkId,description) VALUES(0,0,0, 'Водитель врезался в столб');"


#if [ $# -ne $EXPECTED_ARGS ]
#then
#  echo "Usage: $0 dbname dbuser dbpass"
#  exit $E_BADARGS
#fi
 
$MYSQL -u root -h 192.168.222.165 -p -e "$SQL"
