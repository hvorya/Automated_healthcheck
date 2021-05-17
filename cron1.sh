#!/bin/bash
if (($# != 2));then
     echo "Usage:Bash -x script url"
     exit 0

fi
if python3 --version 2>&1 | grep -q "[^python3\.]";then
	echo "testtt"
        sudo apt-get install python3-pip
	pip3 install virtualenv
	python3 -m virtualenv ./venv_health
	cp ./health.py ./venv_health
	cp ./requirements.txt ./venv_health
	chmod +x ./venv_health/health.py
	source ./venv_health/bin/activate
	./venv_health/bin/pip3 install -r requirements.txt
	deactivate
       #python3 $0 $1
else
        echo 'Installing  python version > 3.5.....'
	sudo apt-get update -y
	sudo apt-get install python3.7
        sudo apt-get install python3-pip
	export PATH="/usr/bin/python3/bin:$PATH"
	pip3 install virtualenv
	python3 -m virtualenv ./venv_health
	cp ./health.py ./venv_health
	chmod +x ./venv_health/health.py
	cp ./requirements.txt ./venv_health
	source ./venv_health/bin/activate
	./venv_health/bin/pip3 install -r requirements.txt
	deactivate
       #python3 $0 $1 
fi
echo $1
echo $2
crontab -l > mycron
echo "SHELL=/bin/bash" >> mycron
# please input the path to your virtual_env 
echo "@reboot source $PWD/venv_health/bin/activate && $PWD/venv_health/bin/python3  $PWD/venv_health/$1 $2 >> $PWD/health.log 2>&1" >> mycron
echo "*/10 * * * * source $PWD/venv_health/bin/activate && $PWD/venv_health/bin/python3 $PWD/venv_health/$1 $2 >> $PWD/health.log 2>&1" >> mycron
crontab mycron  
#echo $line1 && $line2 >> mycron
#crontab -u "$USER" 

	

