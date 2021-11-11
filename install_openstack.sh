#! /usr/bin/bash
#! @author: @ruhend (Mudigonda Himansh)

#? Variables
PASSWD="SRMCloudN3t"
local_config="local.conf"
ip_addr=1.79.17/24 ###### CHANGE THIS ######


#? update system
sudo apt-get update -y
sudo apt-get full-upgrade -y
init 6

#? create stack user
sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

#? install git
sudo apt-get install git -y

#? git clone devstack repo
git clone https://git.openstack.org/openstack-dev/devstack

#? change dir into devstack
cd devstack

#? configuring local.conf
echo "" >> $local_config
echo "[[local|localrc]]" >> $local_config
echo "" >> $local_config
echo "# Password for KeyStone, Database, RabbitMQ and Services" >> $local_config
echo "ADMIN_PASSWORD=$PASSWD" >> $local_config
echo "DATABASE_PASSWORD=\$ADMIN_PASSWORD" >> $local_config
echo "RABBIT_PASSWORD=\$ADMIN_PASSWORD" >> $local_config
echo "SERVICE_PASSWORD=\$ADMIN_PASSWORD" >> $local_config
echo "" >> $local_config
echo "# Host IP - get your Server/VM IP address from ip addr command" >> $local_config
echo "HOST_IP=$ip_addr" >> $local_config
echo "" >> $local_config

# Install Devstack
./stack.sh

# Horizon – OpenStack Dashboard
# Nova – Compute Service
# Glance – Image Service
# Neutron – Network Service
# Keystone – Identity Service
# Cinder – Block Storage Service
# Placement – Placement API

# Open Dashboard in Firefox
firefox https://$ip_addr/dashboardip_addrip_addr

# Extra Configs
DEST=/opt/stackLOG_COLLOG_COLOR=False
OR=False

LOGFILE=$DEST/logs/stack.sh.log
LOG_COLOR=False
