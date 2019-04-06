#! /bin/bash
ansibleuser=$1
password=$2

# clearing screen
clear >$(tty)

# check the permission to create new user

if [ $(id -u) -eq 0 ]; then
# Empty line
  echo -en '\n'
  echo -en '\n' 
  echo " Creating new user $ansibleuser"
  # Empty Line
  echo -en '\n'
  echo -en '\n'
  egrep "$ansibleuser" /etc/passwd >/dev/null

  if [ $? -eq 0 ]; then 
    echo -en '\n'
    echo -en '\n'
    echo " $ansibleuser user Already  exist !!.. "
    echo -en '\n'
    echo -en '\n'
    echo " Making Sudo  without Paswword for user $ansibleuser"
    echo -en '\n'
    echo -en '\n'
    find /etc/sudoers.d/$ansibleuser >/dev/null

  if [ $? -eq 0 ]; then
      rm -f /etc/sudoers.d/$ansibleuser
      echo "$ansibleuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$ansibleuser
      mkdir /home/$ansibleuser/.ssh
      echo -en '\n'
      echo -en '\n'
      echo "changing permission .ssh"
      chown $ansibleuser:$ansibleuser /home/$ansibleuser/.ssh 
      chmod 700 /home/$ansibleuser/.ssh
      echo -en '\n'
      echo -en '\n'
      echo " File already exist in  /etc/sudoers.d/$ansibleuser  Completed Successfully"
      echo -en '\n'
      echo -en '\n'
  else
      touch /etc/sudoers.d/$ansibleuser
      echo "$ansibleuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$ansibleuser
      mkdir /home/$ansibleuser/.ssh
      echo -en '\n'
      echo -en '\n'
      echo "changing permission .ssh"
      chown $ansibleuser:$ansibleuser /home/$ansibleuser/.ssh 
      chmod 700 /home/$ansibleuser/.ssh 
      echo -en '\n'
      echo -en '\n'
      echo " All operation Completed successfully"
      exit
      fi
    
    exit

  else 
      
      adduser "$ansibleuser"
      echo "$password" | passwd "$ansibleuser" --stdin
      echo "$ansibleuser User Created"
      echo -en '\n'
      echo -en '\n'
      echo " Making Sudo without Paswword for User $ansibleuser"

      find /etc/sudoers.d/$ansibleuser >/dev/null
  if [ $? -eq 0 ]; then
    echo -en '\n'
    echo -en '\n'
      echo " File already exist in  /etc/sudoers.d/$ansibleuser "
  else
      touch /etc/sudoers.d/$ansibleuser
      echo "$ansibleuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$ansibleuser
      mkdir /home/$ansibleuser/.ssh
      chown $ansibleuser:$ansibleuser /home/$ansibleuser/.ssh 
      chmod 700 /home/$ansibleuser/.ssh 
      echo -en '\n'
      echo -en '\n'
      echo " All operation Completed successfully"
      exit
      fi

      exit
      fi
else
  echo -en '\n'
  echo -en '\n'
  echo " Only Root can add user, you dont access privillage"
  echo -en '\n'
  echo -en '\n'
  exist
  fi


