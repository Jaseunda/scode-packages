#!/bin/bash
#
#
# SCode IDE Compiler
# Script created by SCode Bot & Other contributors.
# 
# SCODE_PKG_HOMEPAGE=https://github.com/Jaseunda/scode-packages/blob/main/packages
# SCODE_PKG_DESCRIPTION="Installer"
# SCODE_PKG_LICENSE="Apache-2.0"
# SCODE_PKG_MAINTAINER="@scode"
# _TAG_VERSION=0.0.1
# _TAG_REVISION=33
# SCODE_PKG_VERSION=${_TAG_VERSION}.${_TAG_REVISION}
# SCODE_PKG_REVISION=15
# SCODE_PKG_SKIP_SRC_EXTRACT=true
# SCODE_PKG_BUILD_IN_SRC=true
# SCODE_PKG_DEPENDS=""
clear
termux-setup-storage
figlet SCode 
figlet Compiler 
echo "Docs: https://jaseunda.gitbook.io/scode-ide/"
echo " "
echo "-Jaseunda"
echo " "
echo " "
echo " "
apt-get update && apt-get upgrade -y
apt update -y
apt upgrade -y -y
pkg install figlet -y
pkg install pip -y
pkg install python2 -y
pkh install python3 -y
apt install vim -y
apt install nano -y
apt install clang -y
pkg install nodejs -y
apt install nodejs -y
pkg install php -y
pkg install golang -y
pkg install mariadb -y
pkg install git -y
apt install php-apache -y
apt install termux-api php
#Installing Java

#Java Libraries compiled by Hax4us, scripts written by Hax4us, MasterDevX and Guzio, with some very, very tiny help from Harshiv-Patel.
#Setup Java
set -e
shopt -s expand_aliases
alias ee='echo -e'

#Greetings
echo
ee "\e[93mJava Libraries compiled by \e[32mHax4us\e[93m, script written by \e[32mHax4us \e[93mand \e[32mMasterDevX\e[93m."
echo

#Checking for existing Java installation
if [ -e $PREFIX/bin/java ]
then
	ee "\e[32mJava is already installed!"
	echo
	exit
else
	#Checking, whether is someone trying to cheat and simplyfy their installation it on Linux (i.e. x86 (not listad, as you can see) machine) using this script, which have no reason to work.
	case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64"; tag="v8" ;;
	arm64)
		archname="aarch64"; tag="v8" ;;
	armhf)
		archname="arm"; tag="v8-151" ;;
	armv7l)
		archname="arm"; tag="v8-151" ;;
	arm)
		archname="arm"; tag="v8-151" ;;
	*)
		ee "\e[91mERROR: Unknown architecture."; echo; exit ;;
	esac

	#Actual installation
	ee "\e[32m[*] \e[34mDownloading JDK-8 (~70Mb) for ${archname}...  🕛This will take some time, so better make a coffee.🕛"
	wget https://github.com/Hax4us/java/releases/download/${tag}/jdk8_${archname}.tar.gz -q

	ee "\e[32m[*] \e[34mMoving JDK to system..."
	mv jdk8_${archname}.tar.gz $PREFIX/share

	ee "\e[32m[*] \e[34mExtracting JDK..."
	cd $PREFIX/share
	tar -xhf jdk8_${archname}.tar.gz

	ee "\e[32m[*] \e[34mSeting-up %JAVA_HOME%..."
	export JAVA_HOME=$PREFIX/share/jdk8
	echo "export JAVA_HOME=$PREFIX/share/jdk8" >> $HOME/.profile

	ee "\e[32m[*] \e[34mCoping Java wrapper scripts to bin..."
	#I'm not 100% sure, but getting rid of bin contnent MAY cause some issues with %JAVA_HOME%, thus it's no longer moved - copied instead. Sorry to everyone short on storage.
	cp bin/* $PREFIX/bin

	ee "\e[32m[*] \e[34mCleaning up temporary files..."
	rm -rf $HOME/installjava
	rm -rf $PREFIX/share/jdk8_${archname}.tar.gz
	rm -rf $PREFIX/share/bin

	echo
	ee "\e[32mSCode Compiler was successfully installed!\e[39m"
	 touch .scode.runfile
	echo "For more information go to: https://jaseunda.gitbook.io/scode-ide/"
    echo "Restart termianl to run Scode Compiler"
fi
