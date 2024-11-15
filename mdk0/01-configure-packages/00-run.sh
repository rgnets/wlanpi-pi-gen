#!/bin/bash -e


install -m 644 files/agent_config.toml "${ROOTFS_DIR}/etc/wlanpi-rxg-agent/config.toml"

on_chroot <<CHEOF
	# MDK: Make sure services are enabled
	systemctl enable wlanpi-mqtt-bridge
	systemctl enable wlanpi-rxg-agent
CHEOF
