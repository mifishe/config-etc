#!/bin/bash
SCRIPT_FILE="set-layout.sh"
EXEC_PATH="$HOME/bin/$SCRIPT_FILE"
XBIND_RC="$HOME/.xbindkeysrc"

cp -u $SCRIPT_FILE ~/bin
chmod +x ${EXEC_PATH}
set +e
touch $XBIND_RC
set -e

input_list=$(gsettings get org.gnome.desktop.input-sources sources \
    | sed 's/[[]\(.*\)[]]/\1/g'  | sed "s/('xkb', '\(..\)')/\1/g" | sed 's/ //g' | tr "," "\n")

counter=0
for lang in $input_list
do  
    echo "# Language: $lang" >> $XBIND_RC
    echo "\"~/bin/set-layout.sh ${counter}\"" >> $XBIND_RC
    counter=$((counter+1))
    echo " alt+shift+$counter" >> $XBIND_RC
    echo " " >> $XBIND_RC
done