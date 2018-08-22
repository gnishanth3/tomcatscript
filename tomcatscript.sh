#Download java
cd /tmp

sudo yum install wget unzip -y

wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

#install java
sudo rpm -ivh jdk-8u131-linux-x64.rpm

#create Tomcat user

sudo groupadd tomcat

sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat



#Download tomcat
wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32-windows-x64.zip

unzip apache-tomcat-8.5.32-windows-x64.zip

sudo mv apache-tomcat-8.5.32 /opt/tomcat

#update Permissions

cd /opt/tomcat

sudo chgrp -R tomcat bin

sudo chmod  g+rwx bin

sudo g+r bin/*

#sudo chown -R tomcat webapps/ work/ temp/ logs/

#chmod -R 755 /opt/tomcat

#Download petclinicapp

cd /tmp

wget http://cliqr-appstore.s3.amazonaws.com/petclinic/petclinic.war

cp /tmp/petclinic.war /opt/tomcat/webapps

/opt/tomcat/bin/startup.sh

cd /tmp 

sudo mv /tmp/startupscript.txt /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl status tomcat

sudo systemctl enable tomcat
