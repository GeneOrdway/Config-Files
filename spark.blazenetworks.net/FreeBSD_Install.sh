#!/bin/sh
#
# FreeBSD 11 Installation Script

###       ###
### TO DO ###
###       ###

# 1 -  

###          ###
### PROGRAMS ###
###          ###
PRINTF="/usr/bin/printf"
FREEBSDUPDATE="/usr/bin/freebsd-update"
PKG="/usr/bin/pkg"
PORTSNAP="/usr/bin/portsnap"
FIND="/usr/bin/find"
SUDO="/sbin/sudo"


# Exit if anything fails.
set -e

###      ###
### MAIN ###
###      ###

### 1 - Update the system ###
$FREEBSDUPDATE fetch install
$PKG update
$PKG upgrade
$PORTSNAP fetch install

### 2 - Catalog original content on the system. ###
$CAT /etc/passwd > $HOME/original_list_users.txt
$CAT /etc/group > $HOME/original_list_groups.txt
$FIND / - > $HOME/original_list_files.txt
$PKG info > $HOME/original_list_programs.txt

### 3 - Add Swap Space ###


### 2 - Install Software ###
# Poudriere
cd /usr/ports/ports-mgmt/poudriere
sudo make install clean

# Portmaster
cd /usr/ports/ports-mgmt/portmaster
sudo make install clean

# Vim
$PKG install vim-lite

# Zsh
$PKG install zsh

# 

### 3 - Add / Modify User Accounts ###

# Change default 'freebsd' user to 'gene'


### 4 - Configure and Harden the Host ### 

# SSH

# IPFW

# OpenNTPD

#

### 5 - Setup Jails ###

# IOCage or EZJails

### 5 - Install Software in Jails ###

# NGINX

# MYSQL

# 

### 6 - Configure and Harden the Jails ###

# NGINX

# MYSQL

exit 0
#EOF
