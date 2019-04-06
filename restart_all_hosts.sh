#! /bin/bash

clear >$(tty)
ansible_host=( kubmaster kubnode1 kubnode2 devops )
ansible_user=( kubmaster kubnode1 kubnode2 devops )
decision=$1


if [ "$decision" == "shutdown" ]; then

r=h
else
r=r
fi

for h in "${ansible_host[@]}"
do 

# echo "Please enter ssh password of "${ansible_user[n]}""

u="${ansible_user[n]}"
host="${ansible_host[n]}"
echo -en '\n'
echo -en '\n' 
echo "Please enter  password of "${ansible_host[n]}" Host"
echo -en '\n'
echo -en '\n'
ssh $u@$host "sudo shutdown -"$r" now "
((n++))

done