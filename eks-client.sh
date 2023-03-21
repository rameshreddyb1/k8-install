#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
pwd
mkdir eks-client-install
cd eks-client-install
pwd
LOG=eks-client-install.log
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
	echo  -e "$R You are not the root user, you dont have permissions to run this $N"
	exit 1
fi

VALIDATE(){
	if [ $1 -ne 0 ]; then
		echo -e "$2 ... $R FAILED $N"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS $N"
	fi

}

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &>> $LOG

VALIDATE $? "Downloaded AWS CLI V2"

unzip awscliv2.zip &>> $LOG

VALIDATE $? "Unzip AWS CLI V2"

./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update &>> $LOG

VALIDATE $? "Updated AWS CLI V2"