#!/bin/bash



 read -p "Enter the path way of the file '$i'" filename


   if [ -f "$filename" ]; then
     files+=("$filename")
   else
     echo "File '$filename' does not existe, Please try again ."
   fi


 sum=0
  count=0
   value=()
  read -p "Entre the Column number of file '${files[$1]}' to analyse:" column 

   while IFS=, read  -r line; do
       value=$(echo "$line" | awk -F, -v col="$column" '{print $col}')

       if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]];then 
          values+=("$value")
          sum=$(echo "$sum + $value" | bc)
         ((count++))
       fi
   done < "${files[$1]}"

mean=$(echo "scale=2; $sum / $count" | bc)

sorted_values=($(printf "%s\n" "${values[@]}" | sort -n))

mid=$((count  / 2))

if (( count % 2 == 0 ));then
   median=$(echo "scale=2 ; (${sorted_values[$mid - 1]}  +  ${sorted_values[$mid]}) /  2 " | bc)
else
   median=${sorted_values[$mid]}
fi


echo "Total Sum: $sum"
echo "Mean: $mean"
echo "Median: $median"
