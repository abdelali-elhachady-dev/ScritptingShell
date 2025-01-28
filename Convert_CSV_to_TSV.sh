#!/bin/bash

check_file(){
 if [ ! -f "$1" ]; then
   return 1 
 else 
  return 0 
 fi
}
while true; do

echo "please put the file path :"
read filePath

if check_file "$filePath" ;then
      break
else
      echo "File does not exist. Please try again."
fi
done

echo "put the name of output file ."
read outputFile

sed 's/,/\t/g' "$filePath" > "$outputFile"
echo "the CSV file converted to TSV file '$outputFile'"
