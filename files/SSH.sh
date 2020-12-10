#!/bin/bash

apt update -y ;
apt upgrade -y ;
echo "STEP 1 >>>> update and upgarde is completed"
apt install openssh -y ;
apt install rsync -y ;
echo "STEP 2 >>>> Installed openssh";
echo "STEP 3 >>>> Installed rsync";
echo -e "root\nroot" | passwd ;
cd ./.ssh;
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDW2fIF2FfITNH+lp7GlJkJAPKBJlpIuKNcaLZFiVp/4kOBxiVCKJYk4/FViYiQ4e1+viRgC2eqNzRH0Zxy6pJJ1T3vo/8wAtWIz3rudF//wYgA6sFN6lb88QV0aKrijA3833GEwpO8Nu/oA+xy3PetJhHXKk/WjeBXFJmlZxCCK1SnARxyikB447EhNbb5sA8cBXBLFCHgkxbmTSfyARsQ7CxPMQSQf+M09vuu83q/87pqGtGeudonmuCbwjfxHnPDpNqauKGNpmk3zNxqCvWtvYdKp3v30BFX+REfj1H+2ZFkZ917IQ/wvm8ENexPy5UxMUf628oH3X33d9OTghM2ylBFDmXAk2mB3pvXYBa+gxaaqXc6ielK3Co6pB9PXfd/GiyN2oUs1va3f++TwSgEFDinJQzcR68bQ3bplfIBqYCFtk43+daufawrowkHLVefHU98SjT5jkF8XpskvyGAAtoHVpfJ3Ke+yIqN5YvF4zczadpxocP4eEeL/WfK8j8= adarshbp@adarshbp
' >> authorized_keys ;
chmod 777 authorized_keys ;
echo "STEP 4 >>>> Configured key";
