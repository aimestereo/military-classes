#!/bin/bash

# search files

FILES=/tmp/GenTargets/Targets/*
list=""

for f in $FILES
do
  match=`expr match "$f" '\{Target.id.*.\}'`
  echo $match
  
  
done
