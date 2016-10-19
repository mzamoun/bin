#export DIR_DATA=/cygdrive/d
export DIR_DATA=/home/mzamoun/Documents
export URL_GIT_BASE=https://github.com/mzamoun

export WS=$DIR_DATA/ws
export PROJ=$DIR_DATA/proj
export APPS=$DIR_DATA/apps

alias ll='ls -al'
alias lt='ls -alrt'
alias ..='cd ..; lt'

export JAVA_HOME=$APPS/jdk1.8.0_102
export ECLIPSE=$APPS/eclipse-jee-neon-1/eclipse
export MAVEN_HOME=$APPS/apache-maven-3.3.9
export M2_HOME=$MAVEN_HOME
export NPP=$APPS/npp
export REDIS=$APPS/redis-3.2.4

export PATH=$REDIS/src:$NPP:$JAVA_HOME/bin:$MAVEN_HOME/bin:$ECLIPSE:~/bin:$PATH


