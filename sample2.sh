#!/bin/bash
###################################################################
#Script Name	: Hello Bacsh
#Description	: sample and learning bash script
#Author       	: Ahmad Rafiee
#Email         	: rafiee1001@gmail.com
###################################################################

echo "Hello bash"

# Global variable vs local variable
USER=ahmad

function fname {
    USER=ali
    echo "hello ${USER}"
}

echo "hello ${USER}"
fname

myfunc(){
    echo "$0 fff"
    echo "$1"
    echo "$2"
    echo "$@"
}

myfunc "first" "second"

echo $((20+5))
echo $((20-5))
echo $((20/5))
echo $((20*5))
echo $((5**3))

# Single and double quotes
echo "There is no * in my path: $PATH"
echo 'There is no * in my path: $PATH'

# read age from input
read -p "Enter your age: " AGE
echo "your age: $AGE"

# read age from input and with default value
read -p "Enter your age [37]: " AGE
AGE=${AGE:-37}
echo $AGE

# select sample
select OS_NAME in debian ubuntu arch alpine busybox
do
  echo "Your OS: $OS_NAME"
  break
done

DIR_PATH=./test
[ -d $DIR_PATH ] && echo "Directory is exist" || echo "Directory is not exist"

# while loop sample
x=1
while [ $x -le 5 ]
do
  echo "Welcome $x times"
  sleep 1
  x=$(( $x + 1 ))
done

# for loop example
#for NUMBER in 1 2 3 4 5 6
for NUMBER in {1..3}
do
    echo My Number: $NUMBER
    sleep 1
done

# for normal usage
for (( c=1; c<=5; c++ ))
do
    echo "Welcome $c times"
    sleep 1
done

# until normal usage
counter=0
until [ $counter -gt 5 ]
do
  echo Counter: $counter
  sleep 1
  ((counter++))
done

# normal usage until
log_path="./log"
until [ -f $log_path ]
do
  echo "Waiting for the file to be created..."
  sleep 1
done
echo "The file exists. Proceeding..."


until ping -c1 www.google.com &>/dev/null
do
echo "Waiting for www.google.com - network down?"
sleep 1
done
echo "Ping successful! www.google.com is reachable."

# if example
echo -n "Enter a number: "
read VAR

if [[ $VAR -gt 10 ]]
then
  echo "The variable is greater than 10."
else
  echo "The variable is equal or less than 10."
fi


echo -n "Enter a number: "
read VAR

if [[ $VAR -gt 10 ]]
then
  echo "The variable is greater than 10."
elif [[ $VAR -eq 10 ]]
then
  echo "The variable is equal to 10."
else
  echo "The variable is less than 10."
fi

# hear doc sample
cat << EOF > /tmp/test
These contents will be written to the file.
        This line is indented.
EOF

# case sample
echo "what is your favorite operating system?"
read OS_NAME

case $OS_NAME in

  linux)
    echo "you love Linux? we do too!"
    ;;

  bsd)
    echo "BSD is a good system, too"
    ;;

  windows)
    echo "I am not like windows"
    ;;

  *)
    echo "you should consider an open source system"
    ;;
esac

# other case sample
day=$(date +"%a")

case $day in

  Mon | Tue | Wed | Thu | Fri)
    echo "today is a weekday"
    ;;

  Sat | Sun)
    echo "today is the weekend"
    ;;

  *)
    echo "date not recognized"
    ;;
esac

# array sample
array=(one two three four five six)
echo ${array[0]}
echo ${array[1]}
echo ${array[2]}
echo ${array[3]}
echo ${array[4]}
echo ${array[5]}
echo ${array[*]}

number=${#array[@]}
for (( i=0;i<$number; )); do
	echo ${array[${i}]}
	((i++))
done

# Array syntax:​
#arrayName=(element1 element2 element3 element4)

# Syntax to get the length of the array:
#{#arrayName[@]}

# Syntax to get a particular array element:
#{arrayName[index]}
#{arrayName[$i]}

# All the elements in array​
#'${arrayName[@]}'

# sed examle
echo "Bash Scripting Language" | sed 's/Bash/Perl/g'

cat <<EOF > /tmp/test.txt
Python is a very popular language.
Python is easy to use. Python is easy to learn.
Python is a cross-platform language
EOF

sed 's/Python/Perl/g'   /tmp/test.txt # change all patern with replace
sed '1 s/Python/Perl/g' /tmp/test.txt # change patern on line number
sed '2 s/Python/Perl/g' /tmp/test.txt # change patern on line number
sed '3 s/Python/Perl/g' /tmp/test.txt # change patern on line number
sed 's/Python/perl/g2'  /tmp/test.txt # Here, the searching text, ‘Python’ appears two times in the second line only and it is replaced by the text ‘Perl’

# get free spase size
free=$(df --output=avail -h / | sed '1d;s/[^0-9]//g')
echo free

# awk sample
cat <<EOF > /tmp/sample.txt
1) Amit     Physics   80
2) Rahul    Maths     90
3) Shyam    Biology   87
4) Kedar    English   85
5) Hari     History   89
EOF

awk '{print $0}' /tmp/sample.txt
awk '{print $3 "\t" $4}' /tmp/sample.txt
awk '{print $2 "\v" $4}' /tmp/sample.txt
awk '{print $1 "\t" $4}' /tmp/sample.txt
awk '/a/' /tmp/sample.txt                                       # Printing All Lines
awk '/a/ {print $3 "\t" $4}' /tmp/sample.txt                    # Printing Columns by Pattern
awk '/a/{++cnt} END {print "Count = ", cnt}' /tmp/sample.txt    # Counting and Printing Matched Pattern
awk 'length($0) > 18' /tmp/sample.txt                           # Printing Lines with More than 18 Characters

# get free spase size
free=$(df --output=avail -h / | awk 'NR==2 {print $1}')
echo $free

# cut sample
cut -d: -f1,6 /etc/passwd

