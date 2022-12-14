#Install required packages
#yum install git wget screen vim httpd

#Add ctpservice user
#adduser svcctp
#passwd svcctp

##########
# sudo -c "chown -R $USER:root /opt"
##########

#set install home directory
INSTALL_HOME="/opt"

cd $INSTALL_HOME

#download java
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

#set java home
JAVA_HOME="$INSTALL_HOME/jdk1.8.0_144"
PATH="$JAVA_HOME/bin:$PATH"
export JAVA_HOME PATH

#extract Java
tar -xzvf jdk-8u144-linux-x64.tar.gz

#download CTP
wget --no-check-certificate http://mirc.rsna.org/download/CTP-installer.jar

#extract CTP jar file
jar xf CTP-installer.jar
rm CTP-installer.jar
rm -Rf META-INF/ config/ org/

cp ~/Repositories/trait_ctp_receiver/config.xml CTP/config.xml
cp ~/Repositories/trait_ctp_receiver/xnatOnly.script CTP/xnatOnly.script
cp ~/Repositories/trait_ctp_receiver/startup.sh startup.sh

cp ~/Repositories/trait_ctp_receiver/ctp-proxy.conf /etc/httpd/conf.d/ctp-proxy.conf

sudo systemctl enable httpd
sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

#add CTP to startup
cp ctpService-red.sh /etc/init.d/ctpService
chkconfig --add ctpService
