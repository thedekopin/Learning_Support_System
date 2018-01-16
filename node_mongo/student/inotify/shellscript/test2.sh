col -bx < /var/command.log > res.log
sed -n 2p res.log 
WHEN=`sed -n 2p res.log | cut -d " " -f 1`
WHO=`sed -n 2p res.log | cut -d " " -f 2`
WHERE=`sed -n 2p res.log | cut -d " " -f 3`
COM=`sed -n 2p res.log | cut -d " " -f 4`

if [ $COM = 'service' ] || [ $COM = 'yum' ] || [ $COM = 'ls' ];then
   COM2=`sed -n 2p res.log | cut -d " " -f 5`
   COM3=`sed -n 2p res.log | cut -d " " -f 6`
else
   COM2='NULL'
   COM3='NULL'
fi

echo $WHEN 
echo $WHO
echo $WHERE
echo $COM

if [ $COM = 'service' ] || [ $COM = 'yum' ] || [ $COM = 'ls' ];then
   COM2=`sed -n 2p res.log | cut -d " " -f 5`
   COM3=`sed -n 2p res.log | cut -d " " -f 6`
   
   echo $COM2
   echo $COM3
fi

mongo --host db test -u "teacher" -p "rehcaet" --eval "When='$WHEN',Who='$WHO',Where='$WHERE',Com='$COM',Com2='$COM2',Com3='$COM3'" save.js 
exit
script -f /var/command.log
#NUM=`cat command.log | wc -l`
#array=()

#for (( i=3; i<=$NUM; i++)) 
#do
 # array[$i]=`sed -n ${i}p command.log`
 # echo ${array[$i]} >> test.log
  #mongo --host db -u "teacher" -p "rehcaet" --eval "db.students.insert({res+'$i': '${array[$i]}'})"
#done

