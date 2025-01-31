#!bin/bash

git clone https://github.com/saidtaylan/sample-task-devops.git
cd sample-task-devops/systemd

pip3 install -r requirements.txt

touch /var/log/task.log
chown /var/log/task.log
chmod 644 /var/log/task.log

cat ./task.service > /etc/systemd/system/task.service

systemd-analyze verify /etc/systemd/system/task.service

# dosyadan sonra dosyanın systemd tarafından okunmasını sağlar
systemctl daemon-reload

systemctl enable --now task.service