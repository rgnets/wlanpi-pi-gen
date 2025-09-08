#!/bin/bash -e


on_chroot <<CHEOF
  # Run logrotate much more frequently
	echo "*/5 *   * * *   root    /etc/cron.daily/logrotate" >> /etc/crontab
	# Add size restriction to logrotate for syslog and daemon
  sed -i '/{/a\        size 1G' /etc/logrotate.d/rsyslog
CHEOF

