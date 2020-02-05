#!/bin/bash
files1=$1'*.tex'
echo $files

for file in files1; 
    do
        echo "FILE: $file"
        echo "**** SPELL-CHECK ****"
        for word in $(aspell --mode=tex --add-extra-dicts=./.aspell.en.pws list < "$file" | sort -u); do
            grep -Hno "\b$word\b" "$file" || true
        done
        echo "**** PROSELINT ****"
        proselint "$file" || true
        echo ""
     done | tee 'check_text.txt'

