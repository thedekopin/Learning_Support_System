#!/bin/bash
cat -A /var/log/cmd.log | sed "s/\^\[\[[0-9;]*m//g" | sed "s/t\^H\^\[\[K//g" | sed "s/\^M//g" > log/in_server_status.log

flag=0
HOST=`hostname`
WHEN=""
WHERE=""
SCRIPT=""
array=()

while read line; do
    if [[ $line =~ \^\[\]0\; ]]; then
	for word in $line; do 
	    ((cnt++))
	    
	    if [[ $word =~ [0-9]+\-[0-9]+\-[0-9]+\T[0-9]+\:[0-9]+\:[0-9]+ ]]; then
	        WHEN=`echo $word | awk '{print substr($0, length($0)-18, 19)}'`
    	    elif [ -n $WHEN ] && [ $cnt = 3 ]; then 
	        WHERE=$word
    	    elif [ -n $WHERE ] && [ $cnt -ge 4 ]; then
	        if [ $flag = 0 ]; then
	            SCRIPT="$word"
	        else
	            SCRIPT="$COM $word"
	        fi
	        flag=1
	    fi
        done
    else
	if [ ${#line} -ge 63 ];then
	    for ((i=0; i < ${#line}; i+=63)); do
            	if [ $i -eq 0 ];then
                    array+=("[\"${line:i:63}\"")
            	else
                    array+=(", \"${line:i:63}\"")
                fi  
            done
	    array+=("]")
	    mongo --host db test -u "teacher" -p "rehcaet" --eval "db.students.insert({'id':'$HOST','When':'$WHEN','Where':'$WHERE','Script':'$SCRIPT', 'Res':`echo ${array[@]}`})" >> log/db.log
	else
	    mongo --host db test -u "teacher" -p "rehcaet" --eval "db.students.insert({'id':'$HOST','When':'$WHEN','Where':'$WHERE','Script':'$SCRIPT', 'Res':'$line'})" >> log/db.log
	fi
	echo $WHEN
	echo $WHERE
	echo $COM
	echo ${array[@]}
        array=()
        flag=0
	cnt=0
    fi
done < log/in_server_status.log
