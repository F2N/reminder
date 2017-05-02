# Find Nagios check results from database :
SELECT * FROM `nagios_servicechecks` WHERE `service_object_id` = 480 AND `start_time` LIKE '%2017-04-22 00:0%' ORDER BY `start_time` DESC

# TcpDump on FreeBSD :
tcpdump -A -v -C 300 -W 600 -w "/mnt/logDepot/jmf-logs/capture_5-226-4-DST" dst 5.226.4.XXX or dst 5.226.4.XXX or dst 5.226.4.XXX

# Rsync Dry RUN :
rsync --dry-run -ruvpz --log-file /var/log/rsyncDry.log root@server.domain.dc:/var/www/      /var/www/

