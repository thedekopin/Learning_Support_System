#!/bin/bash

F1=0
F2=0
F3=0
F4=0
WHEN=""
WHO=""
WHERE=""
COM=""
array=()

while read line; do
   for word in $line; do 
    if [[ $word =~ [0-9]+\-[0-9]+\-[0-9]+\T[0-9]+\:[0-9]+\:[0-9]+ ]]; then
	F1=1
	WHEN=$word
    elif [ $F1 = 1 ] && [[ $word =~ [0-9a-zA-Z]+\@[0-9a-zA-Z]+ ]]; then
        F2=1
	WHO=$word
    elif [ $F2 = 1 ] && [[ $word =~ \/*[\$|\#] ]]; then 
	F3=1
	WHERE=$word
    elif [ $F3 = 1 ] && [[ $word =~ [a-zA-Z] ]]; then
	if [ $F4 = 0 ]; then
	    COM="$word"
	else
	    COM="$COM $word"
	fi
	F4=1
    else
	array=("${array[@]}" "$word") 	
    fi
   done
    if [ $F4 = 1 ]; then
	echo "$WHEN"
	echo "$WHO"
	echo "$WHERE"
	echo "$COM"
	echo $array
	#mongo --host db test -u "teacher" -p "rehcaet" --eval "db.students.insert({'id':'B14069','When':'$WHEN','Who':'$WHO','Where':'$WHERE','Com':'$COM'})"
    fi
    F1=0
    F2=0
    F3=0
    F4=0
    WHEN=""
    WHO=""
    WHERE=""
    COM=""
    array=()
done < /var/command.log
