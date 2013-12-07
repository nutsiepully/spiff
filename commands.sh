
find datasets/www.wikipaintings.org/ -print | xargs file | cut -d : -f 2 - | sed "s/[ \t]*//" | uniq -ci
