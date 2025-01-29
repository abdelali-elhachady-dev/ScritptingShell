#!/bin/bash

echo "!NOTE!:All CSV files should have the same header." 

read -p "how many csv files do you have?" fileCount                               #right here it's optimesed instead of 'echo + read'
declare -a files                                                                  #declare array named files

for((i = 1; i<= fileCount;i++))
do 
read -p "Enter the path way of the file '$i'" filename

if [ -f "$filename" ]; then
 files+=("$filename")
else
 echo "File '$filename' does not existe, Please try again ."
i =$((i--))
fi
done 
read -p "Enter the name of output file ." outputFile 
head  -n 1 "${files[0]}" >  "$outputFile"

for file in "${files[@]}"
do 
echo "prossecnig '$file'"
tail -n +2 "$file" >> "$outputFile"
done 
 echo " Merge Multiple CSV Files in $outputFile are going succesfuly :)"
