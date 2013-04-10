#!/bin/bash

function SqlHelperInitialize()
{
  MYSQL=`which mysql`
  DBCreateSqript=GetDBCreateScript
}

function GetDBCreateScript
{
  SQL=()
  SQL+="DROP DATABASE IF EXISTS StreetsSituations;"
  SQL+="CREATE DATABASE IF NOT EXISTS StreetsSituations;"
  SQL+="USE StreetsSituations;"

  #############################
  # Persons
  #############################

  SQL+="CREATE TABLE Persons (
      id   INT,
      firstname VARCHAR(15),
      lastname VARCHAR(15),
      middlename VARCHAR(15)
  );"

  SQL+="INSERT INTO Persons (id,lastname,firstname,middlename) VALUES(0,'Кладов', 'Стас', 'Александрович');"
  SQL+="INSERT INTO Persons (id,lastname,firstname,middlename) VALUES(1,'Меньшиков', 'Никита', 'Махнович');"
  SQL+="INSERT INTO Persons (id,lastname,firstname,middlename) VALUES(2,'Прокопчук', 'Андрей', 'Геннадьевич');"

  #############################
  # Types
  #############################

  SQL+="CREATE TABLE Types (
      id   INT,
      name VARCHAR(15)
  );"

  SQL+="INSERT INTO Types (id,name) VALUES(0,'Авария');"
  SQL+="INSERT INTO Types (id,name) VALUES(1,'Столкновение');"
  SQL+="INSERT INTO Types (id,name) VALUES(2,'Наезд');"

  #############################
  # ParticipantTypes
  #############################

  SQL+="CREATE TABLE ParticipantTypes (
      id INT,
      name VARCHAR(15)
  );"

  SQL+="INSERT INTO ParticipantTypes (id,name) VALUES(0,'Участник');"
  SQL+="INSERT INTO ParticipantTypes (id,name) VALUES(1,'Виновный');"

  #############################
  # Events
  #############################

  SQL+="CREATE TABLE Events (
      id   INT,
      typeId INT,
      linkId INT,
      description VARCHAR(100)
  );"

  SQL+="INSERT INTO Events (id,typeId,linkId,description) VALUES(0,0,0, 'Водитель врезался в столб на 3км Киевского шоссе');"
  SQL+="INSERT INTO Events (id,typeId,linkId,description) VALUES(1,2,1, 'Столкновение на перекрестке Большой и Малой почтовых улиц');"

  #############################
  # Links
  #############################

  SQL+="CREATE TABLE Links (
      id INT,
      personId INT,
      paticipantTypeId INT,
      description VARCHAR(100)
  );"

  SQL+="INSERT INTO Links (id,personId,paticipantTypeId,description) VALUES(0,0,1,'Водитель врезался в столб');"
  SQL+="INSERT INTO Links (id,personId,paticipantTypeId,description) VALUES(1,1,1,'Водитель двигался по Малой почтовой и проехал на красный сигнал светофора, в следствии чего врезался в автомобиль едущий по пересекающей дороге');"
  SQL+="INSERT INTO Links (id,personId,paticipantTypeId,description) VALUES(1,2,0,'Водитель начал движение на зеленый свет и не успел среагировать на нарушителя, гнавшего на красный свет с примыкаемой дороги');"

  return $SQL
}

#if [ $# -ne $EXPECTED_ARGS ]
#then
#  echo "Usage: $0 dbname dbuser dbpass"
#  exit $E_BADARGS
#fi
 
function CreateDB()
{
  local x=$1
  local y=$2
  echo "$(( $x + $y ))"
  echo "CreateD $x $y"
  $MYSQL -u "$1" -h 192.168.222.165 -p"$2" -e "$DBCreateSqript"
}

function eventQuery()
{
  eventsQuery="
	  SELECT Events.id, Types.name
	  FROM Events 
	  JOIN Types ON typeId = Types.id;"

  result=`"$MYSQL" -u root -h 192.168.222.165 -p"$password" -e "$eventsQuery" StreetsSituations`


  while read -a row
  do
	  echo "..${row[0]}..${row[1]}.."
  done
}



#temp = "
#	SELECT Events.id, Types.name, Persons.firstname, Links.description 
#	from Events 
#	join Types on typeId = Types.id 
#	join Links on linkId = Links.id 
#	join Persons on Links.personId = Persons.id;"
