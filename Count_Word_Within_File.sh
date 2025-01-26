#!/bin/bash 

check_file(){
 if [ ! -f "$1" ]; then
  echo "erreur the path '$1' is wrong ,  please put correct path ."
  return 1
 else
   return 0
fi
}

echo "Enter the keyword to search for:"
read keyword

while true; do
echo "Enter the path to the file:"
read filepath
if check_file "$filepath" ; then
        break
fi
done

count=$(grep -o -i "$keyword" "$filepath" | wc -l  )
echo "The keyword '$keyword' appears $count times in the file."
