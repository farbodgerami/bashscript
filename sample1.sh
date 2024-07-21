!/bin/bash

echo "yechi hagh" 
ls -alh > ls.txt
apt update 2>errors.txt

variable:
name="james"
b=12
to print variable:
echo $a $b
echo "yourname is $name and you are $b"
echo "yourname is ${name}i and you are ${b}"

read -p "what is your name? " name
echo "how old are you?"
read age
echo $name $age

senario: craete a variable: name=james. then go to a new bash with inserting keyword bash. now the variable name cant be reached becouse it works only in previous pash
so we sould create an environment variable:
export NAME= james
for deleting env variable:
unset $NAME
but there is sth very intresting:
if you made the variable in a parent shell but now are in a child shell(the second shell by inserting keyword shell of bash or sth like that) 

if:
if[ condition ]; then
echo "asdfg"
fi

age=33
name="james"
if [ $age -lt 30 ]; then
echo "less than 30"
elif [ $name != "lars" ]; then
echo "your name is not lars" 
else 
echo "access granted"
fi
arithmetic operators
-lt -gt -eq -ne -ge -le



logical operators:
read -p "yechi vared kon 0-10" number
if [[ "$number" -ge 0 && "$number" -lt 10 ]]; then
    echo "p1"
else 
    echo "p2"
fi

-f: regbual file
-e: any file
-d: directory
-x/ -w/ -r: file permissions
-z: string is not empty
 -n: variable is empty
read -p "give a path to an existing file:" path
if [[ ! -f "$path" ]]; then
echo "file is not a path" >&2
exit 1
else echo "file exists"
exit 0
fi

read -p "ye chi vared kon " yechi
case "$yechi" in 
apple)
echo "apple"
;;
orange)
echo "orange"
;;
kivi)
echo "kivi"
;;
*)
echo " hich chi"

read -p "enter y or n: " ANSWER #Yes yEs ...

case "$ANSWER" in [yY] | [yY][eE][sS] ) # in y or yes
echo " you answered yes"
;;
[nN] | [nN][oO])
echo "you answerd no"
;;
*)
echo "invalid anser"
;;
esac


read -p "enter a file or directory path: " path
#sth like this: 
# -f /path/to/file
# -d /path/to/directory

case "$path" in 
# f* means anything starts with -f
-f*) #${path:3} means delete first 3 chars: -f /yechi/ =/yechi/
if [ -f "${path:3}" ]; then
    echo "file hast"
else 
    echo "file not exist"
fi
;;
-d*)
if [ -d "${path:2}" ]; then
    echo "directory exists"
else
    echo "directory does not exist"
fi;;
*)
echo "invalid input"
;;
esac



&&: and, & run task in background: sudo apt update &
it gives us a pid. we can insert kill pid to kill the background process

loops
for i in 1,2,3,4,5
do 
    echo $i
done

j=10
i=0

read from file.txt and echo line by line:
while read line
do 
echo $line
 
done < file.txt
until this happen(file.txt be created or existed) sleep 1 sec
until [ -e "file1.txt" ]; do
sleep 1
done
echo "file created"

positional args:
arg0 arg1 arg2 arg3 arg4
ls -ahl |    grep   yechi
run test file and get these things as variable
./test asefg esrg rth era gyr 

forloop:
for fruit in apple banana cherry
do 
echo " yechi $fruit"
done

for file in $(ls)
do
echo "file: $file"
done

for i in {1..5}
do 
echo "number: $i"
done

for((i=0;i<5;i++))
do
echo "count: $i"
done

fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"
do echo "fruit: $fruit"
done

counter=1
while [ $counter -le 10 ]
do 
echo $counter 
((counter++))
done

input=""
while [ "$input" != "quit" ]
do
read -p "enter a word or quit:" input
echo "you entered $input"
done

while read line
do
echo $line
done < inputfile.txt


output=$(ls)
while read line
do
echo $line
done <<< "$output"


arrays:
cars=("car1" "car2" "car3" "car4" "car5")
# to access to the elements of the array:
echo "${cars[0]}"
echo "${cars[@]}"
# get length:
echo "${#cars[@]}"

# delete an element:
unset cars[2]
echo "${cars[@]}"
cars[2]="yechihagh"
echo "${cars[@]}"

for i in ${cars[@]}
do
echo $i
done


for i in ${cars[@]}
do
if [ $i = "car4" ]
then
echo "you have car4"
fi
echo $i
done


for i in ${cars[@]}
do
if [ $i = "car4" ]
then
echo "you have car4, stop"
break
fi
echo $i
done

for i in ${cars[@]}
do
if [ $i = "car4" ]
then
echo "you have car4, stop"
continue
fi
echo $i
done
