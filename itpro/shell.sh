!/bin/bash
date
df -h

#whoami - print effective user name
whoami

echo "jk,byhg \" ugk ' j,hgjkhgkj"

# echo 'asdfa"w erg  \\' esfa'
echo $PATH
echo $USER
echo $HOME
echo $UID
print all of the env variables:
printenv
user variables:
var1='yechi hagh'
echo $var1
var=`date`
echo $var
var1=$(date)
echo $var1

var2=$(docker image ls)
echo $var2
date >> datefile.txt
today=$(date +%y%m%d)
ls /var/log/auth.log* -alh > log.$today

wc < test.txt


# EOF means end of file, you can put anything instead

wc << EOF 
string 1
string 2 
string 3
EOF

wc << aa 
string 1
string 2 
string 3
aa

ls -alh /etc/ | grep fstab | wc

var1=$[1 + 2]
var2=$[3 + 5]
var3=$[$var1+$var2]
echo $var3
var5=$var1+$var2
echo $var5

var6=$[100 / 45]
echo $var6

var7=$[100.00 / 45.00];
echo $var7
bc=bash calculator 
var1=$(echo "scale=2;3.44 / 5 " | bc)
echo $var1

var1=100
var2=45
var3=$(echo "scale=2; $var1 / $var2" | bc )
echo $var3

var1=11.11
var2=22.22
var3=33.33
var4=44
var5=$(bc << EOF 
scale=4
a1 = ( $var1 + $var2 )
b1 = ( $var3 + $var4 )
a1 + b1  
EOF
)
 
echo $var5

if pwd
then
 echo "it worked"
fi

if pwd; then
    echo 'it worked'
fi

if [$USER = 'john'];then
 echo 'user is john'
elif [$USER = 'james'];then
    echo 'use is james'
else
echo "user is $USER"
fi


var1=10
var2=20

if [ $USER = 'farbod' ];then
    echo 'hi james'
    if [ $var1 -eq 10 ];then
        echo 'yechi hagh'
    else
        echo 'yechi na hagh'
    fi
else
    echo 'hi'

fi

hint:
all have - 
eq: equal, ge: greater than and equal,gt greater than...
nt: not equal 

string 
str1 = str2  str1 is the same as str2
str1 != str2
<>
-n str1 length greater than 0
-z str1  length equal 0


# -e : exists:
homer=/home/farbod

if [ -e $homer ];then
    echo "$homer is valid"
    if [ -f $homer ];then 
        echo "$homer is a file"
    elif [ -d $homer ];then
        echo "$homer is a dir"
    else
        echo "$homer is neither file or dir"
    fi
else
    echo "wdf bro!!!"
fi

> is also redirector so sould be usesd as \> \<

var1=10
var2=20
if [ $var1 -eq 10 ] && [ $var2 -eq 20 ]
if [ $var1 -eq 1 ] || [ $var2 -eq 20 ]
if [ $var1 -eq 1 ] && [ $var2 -eq 20 ]
then 
 echo "sussess"
else
    echo "not sucdess"
fi


var1=10
echo " $[$var1 ** 2]"

x=1
((++x))
echo $x
((x++))
echo $x

if [[ $USER == [f,F]arbod ]];then
    echo "yes"
else
    echo "no"
fi



var1="alice"
var2="marry"

case $var1 in 
john|mary)
    echo "yes";;
alice)
    echo "alis";;
*)
    echo "yechi";;
esac


for i in asdf sfd erwtg te5rh
do 
echo "var is $i"
done


for i in 'new yuork' 'sfd' 'erwtg' 'te5rh'
do 
echo "var is $i"
done


for i in i'm new yuork sfd erwtg te5r 'h
do 
echo "var is $i"
done
cat <<EOT >> ./aaa.txt
# Decrease TIME_WAIT seconds
net.ipv4.tcp_fin_timeout = 50

EOT


for file in /home/farbod/* 
do 
    if [ -d "$file" ];then
        echo "$file is a directory"
    elif [ -f "$file" ];then
        echo "$file is a file"
    else 
        echo "$file doesn't exests"
    fi
done


for ip in {1..254}
    do
        sleep 0.05
        ping -c 1 192.168.219.$ip | grep ^"64" | cut -d " " -f 4 &
    done
IFS=$'\n'
file="test.txt"
for item in $(cat $file)
do 
    echo "next item: $item"
done

for ((i=0;i<=10;i++))
do
    printf "... $i\n"
done

for (( a=0,b=10;a<=10;a++,b--))
do
    echo "$[$a-$b]"
done

for i in 1 2 3 4
do 
echo $i
done
echo "parameter \$0 is $0"
echo "parameter \$1 is $1"
./shell.sh 234 3456

if [ $# -lt 2 ];then
    echo "not enough parameter"
elif [ $# -gt 2 ];then
    echo "too many parameter"
else
    echo "sum is $[$1+$2]"
    echo "sum is $(($1+$2))"
fi


# -z is checkin for null
if [ -z "$1" ];then
    echo "not enough parameters"
else
    echo "$*"
fi

for var1 in "$@"
do
    echo "$var1"
done