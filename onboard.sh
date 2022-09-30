#!/bin/bash
Userfiles=$(cat names.csv)
PASSWORD=PASSWORD

# To ensure the user running this script has sudo privilege
     if [$(id -u) -eq 0]; then


# Reading the csv file
    for user in $Userfile;
    do
    echo $User
    if id "user"  & >/dev/null
    then
    echo "user exist"
    else

# This will create a new user
     Useradd -m -d/home/$user -s  /bin/bash -g developers $user
     echo
    "New user created"

# This will create a ssh folder in the user home folder
     Su - - c "mkdir  ~/ssh" $user
     echo " .ssh directory created for new user"

# We need to set the user permission for the ssh dir
     Su - - c "chmod 700 ~/.ssh" $user
     echo "user permission for .ssh directory set"

# This will create an authorized key file
     Su - - c "touch ~/.ssh/authorized_keys" $user
     echo "Authorized key file created"

#  We need to set the permission for the key file
      su - - c "chmod 600 ~/.ssh/authorized_keys" $user
      echo "user permission for the Authorized key file set"
      echo

#  We need to create and set public key for users in the server
      Cp ~R "/home/ubuntu/shell/id_rsa.pub" "/home/user/.ssh/authorized_keys"
      echo "copyied the public key to New user Account on the server"
      echo
      echo

echo "USER CREATED"

      #Generate a Password
      sudo echo -e "PASSWORD\n$PASSWORD" | sudo passwd "user"
      sudo passwd -5 $user
                  fi
              done
          else
echo "Only Admin Can Onboard A user"
      fi
