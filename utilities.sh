#!/bin/bash
set -e
source /build/buildconfig
set -x

# Prepare for compiling from sources and tests:
apt-get update
apt-get install python-software-properties software-properties-common git

# Required to install PHP 5.4
add-apt-repository ppa:ondrej/php5-oldstable -y
apt-get update
apt-get upgrade -y

# Instaling MySQL server with empty root password
apt-get -q -y install mysql-server

# Packages required for Sphinx compilation, running tests and building deb packages
apt-get install -y php5 php5-mysql php5-curl php5-cli wget gawk libmysqlclient-dev libpq-dev libexpat-dev unixodbc unixodbc-dev git build-essential bash-completion mc debhelper autoconf automake

# Teamcity user required to run CI builds
groupadd teamcity -g 1000
useradd teamcity -s /bin/bash -m -u 1000 -g teamcity -G teamcity

# This tool runs a command as another user and sets $HOME.
cp /build/bin/setuser /sbin/setuser
