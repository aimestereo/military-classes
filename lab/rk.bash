#!/bin/bash

# check credentials

if [ "$(whoami)" != 'student' ]; then
  echo "У вас нет прав для запуска $0."
  exit 1;
else
  echo -e "У вас есть права для запуска $0. Стартуем.\n"
fi

# prepare

rm -fr ./bin/*
mkdir ./bin &>/dev/null

# search execute files

FILES="/bin/* /usr/bin/*"
list=""

for f in $FILES
do
  symbols=`head -n 1 $f 2>/dev/null | cut -b 1-2`

  if [ -x $f ] && [ "$symbols" = "#!" ]; then
    list=$list" "$f
  fi
done

# get extention for a new file and fill hash for every extention

declare -A extentions

for f in $list
do
  line=`head -n 1 $f`
  IFS='/' read -a temp <<< "$line"
  endOfLine="${temp[${#temp[@]}-1]}"
  IFS=' ' read -a temp <<< $endOfLine
  extention="${temp[0]}"

  extentions["$extention"]+=" $f"
  
  # for all files
  #cp $f "/home/student$f.$extention"
done

# inform user about files

for extention in "${!extentions[@]}";
do
  count=0
  
  files="${extentions[$extention]}"
  files=( $files )
  
  echo "$extention - ${#files[@]} файл(ов)"
  
done

# choose right interpretator

echo "введите название интерпретаторов файлы которых вы хотите скопировать (через пробел)"
read names

# copy only needed files

for name in $names;
do
  files="${extentions[$name]}"

  for f in $files;
  do
    filename=$(basename "$f")
    filename="${filename%.*}"    
    cp $f "/home/student/bin/$filename.$name"
  done
done



  
