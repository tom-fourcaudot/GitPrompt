#!/bin/bash

#search the .bashrc file
bashrc=$(find $HOME -maxdepth 3 -name .bashrc)
if [ -z $bashrc ] 
then
    echo "❌ No such file .bashrc" >&2
    exit 1
fi

cat bashrc.txt 1>> $bashrc
bash && clear
echo " ✅ Done"
exit 0