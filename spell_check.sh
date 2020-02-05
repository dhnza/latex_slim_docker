#!/bin/bash

# first argument is the repo location
# second argument is the save location
files=`find $1  -name "*.tex" -or -name "*.xtx" `
echo $files
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

