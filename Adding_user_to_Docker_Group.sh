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

echo "Adding User to docker group"
echo -en '\n'
echo -en '\n'
ssh -i /home/home/Documents/Ansible_Lab/ansible $u@$host "sudo usermod -aG docker "${ansible_user[n]}""

echo " done"
((n++))

done
