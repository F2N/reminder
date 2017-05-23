#############################################
################ Syscommands ################
#############################################

# PSQL building on FreeBSD
git clone -b v1.4.0 https://github.com/sysown/proxysql.git proxysql
gmake
mv proxysql/src/proxysql /usr/local/bin

# Rsync Dry RUN :
rsync --dry-run -ruvpz --log-file /var/log/rsyncDry.log root@server.domain.dc:/var/www/      /var/www/
rsync --dry-run -ruvvapzt --exclude '/var/www/.htaccess' --log-file /var/log/rsyncDATE root@server01.domain.dc:/var/www/ /var/www/ | tee /mnt/logDepot/rsyncDATE

# Reboot router through Telnet
00 13 * * * ( sleep 3 ; echo LOGIN ; sleep 3 ; echo PASSWORD ; sleep 3 ; echo reboot ; sleep 3 ; ) | telnet 192.168.1.1

# TcpDump on FreeBSD :
tcpdump -A -v -C 300 -W 600 -w "/mnt/logDepot/jmf-logs/capture_5-226-4-DST" dst 5.226.4.XXX or dst 5.226.4.XXX or dst 5.226.4.XXX

# Find Dell Express tag from windows CMD :
wmic bios get serialnumber

# Pattern replacement :
find . -type f -name "*baz*" -exec sed -i 's/foo/bar/g' {} +
find . -type f -name "*.php" -exec sed -i '.bak' 's/192\.168\.1\.XXX/domain.fqdn.dc/g' {} +
grep -rl 192.168.1.XXX ~/folder/ | xargs sed -i '.bak' s@192.168.1.XXX@domain.fqdn.dc@g

# Users and groups editing tools :
vipw
vigr

# Forbidden RDP to Administrateur/Administrator :
# https://serverfault.com/questions/598278/how-to-disable-rdp-access-for-administrator

To deny a user or a group logon via RDP, explicitly set the "Deny logon through Remote Desktop Services" privilege. To do this access a group policy editor (either local to the server or from a OU) and set this privilege:

1. Start | Run | Gpedit.msc if editing the local policy or chose the appropriate policy and edit it.
2. Computer Configuration | Windows Settings | Security Settings | Local Policies | User Rights Assignment.
3. Find and double click "Deny logon through Remote Desktop Services"
4. Add the user and / or the group that you would like to dny access.
5. Click ok.
6. Either run gpupdate /force /target:computer or wait for the next policy refresh for this setting to take effect.

# NFS mount (FreeBSD) :
mount 192.168.1.XXX:/logDepot                /mnt/logDepot

# Find Nagios check results from database :
SELECT * FROM `nagios_servicechecks` WHERE `service_object_id` = 480 AND `start_time` LIKE '%2017-04-22 00:0%' ORDER BY `start_time` DESC
