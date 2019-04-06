#! /bin/bash


ansible_host=( kubmaster kubnode1 kubnode2 devops )
ansible_user=( kubmaster kubnode1 kubnode2 devops )
source_dir=$(pwd)/public_key
password=$1
ansible_key=$2
s=root

for h in "${ansible_host[@]}"
do 
clear >$(tty)
# echo "Please enter ssh password of "${ansible_user[n]}""

u="${ansible_user[n]}"
host="${ansible_host[n]}"
echo -en '\n'
echo -en '\n' 
echo "Please enter SCP password of "${ansible_host[n]}" Host"
echo -en '\n'
echo -en '\n'
scp authorized_keys $s@$host:/home/"${ansible_user[n]}"/.ssh
echo -en '\n'
echo -en '\n'
echo "changing authorized_keys permission to 400"
echo -en '\n'
echo -en '\n'
ssh $s@$host "chmod 400 /home/"${ansible_user[n]}"/.ssh/authorized_keys"
((n++))

done
