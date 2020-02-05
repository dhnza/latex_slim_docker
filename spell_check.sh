#!/bin/bash


if [ "$1" == "-h" ]; then
  echo "\nFirst command line arg: seach_location"
  echo "\n\t search_location: Folder location for the spell checker to search "
  echo "\n Second command line arg: save_location"
  echo "\n\t save_location: Folder location for the spell checker to save output, if it doesnt exist we will create it"
  echo "\n\n\n"
  exit 0
fi 

# check if seach location is defined, 
# if it is not we exit
if [ -z "$1" ]
  then 
    echo "No location given to check "
    exit 1
fi    

# check if save location is defined, 
# if it is not we will save to ~/output
if [ -z "$2" ]
then
      2="~/output"
      echo "saving output to \$2"
else
      echo "saving output to: \$2 "
fi

# final all files ending in .tex or .xtx in search location
files=`find $1  -name "*.tex" -or -name "*.xtx" `

# check if the output directory exists, if not make it
mkdiri -p $2

for file in $files; 
    do
        echo "FILE: $file"
        echo "**** SPELL-CHECK ****"
        for word in $(aspell --mode=tex --add-extra-dicts=./.aspell.en.pws list < "$file" | sort -u); do
            grep -Hno "\b$word\b" "$file" || true
        done
        echo "**** PROSELINT ****"
        proselint "$file" || true
        echo ""
     done | tee $2'check_text.txt'

