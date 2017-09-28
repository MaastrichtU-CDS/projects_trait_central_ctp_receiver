#Install required packages
yum install git wget screen vim

#Add ctpservice user
adduser svcctp

#set install home directory
INSTALL_HOME="/opt"

cd $INSTALL_HOME

#download java
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

#set java home
JAVA_HOME="$INSTALL_HOME/jdk1.8.0_144"
PATH="$PATH:$JAVA_HOME/bin"
export JAVA_HOME PATH

#extract Java
tar -xzvf jdk-8u144-linux-x64.tar.gz

#download CTP
wget --quiet --no-check-certificate http://mirc.rsna.org/download/CTP-installer.jar

#extract CTP jar file
jar xf CTP-installer.jar
rm CTP-installer.jar

