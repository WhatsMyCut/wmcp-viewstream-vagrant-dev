#!/usr/bin/env bash
sudo mkdir -p /usr/lib/jvm
cd /usr/lib/jvm

JAVA_TOKEN=jdk8
JAVA_VERSION=8u221
JAVA_HOME_DIR=jdk1.8.0_221
JAVA_PLATFORM=linux-x64

sudo cp /vagrant/scripts/vagrant/jdk-${JAVA_VERSION}-${JAVA_PLATFORM}.tar.gz .
sudo tar -xvzf jdk-${JAVA_VERSION}-${JAVA_PLATFORM}.tar.gz
sudo ln -sf /usr/lib/jvm/${JAVA_HOME_DIR} /usr/lib/jvm/${JAVA_TOKEN}
JAVA_HOME=/usr/lib/jvm/${JAVA_TOKEN}
echo "JAVA_HOME=${JAVA_HOME}" >> /home/vagrant/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
sudo update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 0
sudo update-alternatives --set java ${JAVA_HOME}/bin/java
sudo update-alternatives --set javac ${JAVA_HOME}/bin/javac

update-alternatives --list java
update-alternatives --list javac
java -version
