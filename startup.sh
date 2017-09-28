
#set install home directory
INSTALL_HOME="/opt"
CTP_HOME="$INSTALL_HOME/CTP"

#set java home
JAVA_HOME="$INSTALL_HOME/jdk1.8.0_144"
PATH="$JAVA_HOME/bin:$PATH"
export JAVA_HOME PATH

cd $CTP_HOME && java -Xmx512m -Xms128m -Djava.ext.dirs=$JAVA_HOME/jre/lib/ext:/usr/java/packages/lib/ext -jar libraries/CTP.jar &
