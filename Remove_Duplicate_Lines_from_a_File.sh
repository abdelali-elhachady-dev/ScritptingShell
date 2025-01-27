#!/bin/bash


check_file()
{
	if [ ! -f "$1" ]; then
       
         return 1 
        else 
         return 0
fi
}


while true; do

echo "please put the file path "
read filePath

if check_file "$filePath" ;then
      break
else 
      echo "File does not exist. Please try again."
fi 
done 

echo "You wnat modifie the file or you want a copie from the file"
echo " 1 or 2  ?"
read x

if [ "$x" -eq 2 ]; then 
echo "Type the name of copie file "
read copieFile
    # u can do this but the order of text will be changed sort "$filePath" | uniq > "$copieFile"
awk '!seen[$0]++' "$filePath" > "$copieFile"
echo "Duplicated lines removed and saved in $copieFile"

 else 
   
    awk '!seen[$0]++' "$filePath" > tmp_file ; mv tmp_file "$filePath"
    echo "Duplicated lines removed and saved in $copieFile"
fi
