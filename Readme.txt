 Copy files: cron1.sh health.py requirements.txt in a folder.

 cron1.sh: A bash script to deployment.

 health.py: python script  to test helth service and recieve an URL as argument.

 requirements.txt: needed packages to be installed.

 run terminal in the folder
 
sudo bash -x [bash script] [python script] [URL]
example: sudo bash -x cron1.sh health.py https://example=service.fsecure.com/health


 Check that: 
$ systemctl enable crond.service 
$ systemctl status crond.service
