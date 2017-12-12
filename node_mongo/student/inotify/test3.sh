history > com.log
while read line; do
    NUM=`echo $line | cut -d " " -f 1`
    echo $NUM
    WHEN=`echo $line | cut -d " " -f 2`
    echo $WHEN
    while [ `echo $line | cut -d " " ] COM=`echo $line | cut -d " " -f 3`
    echo $COM
done < com.log

