#!/bin/bash -e


install -m 644 files/agent_config.toml "${ROOTFS_DIR}/etc/wlanpi-rxg-agent/config.toml"

on_chroot <<CHEOF
	# MDK: Make sure services are enabled
	systemctl enable wlanpi-mqtt-bridge
	systemctl enable wlanpi-rxg-agent

  echo "
  mac_addr=0
  preassoc_mac_addr=0
  gas_rand_mac_addr=0
  " > /etc/wpa_supplicant/wpa_supplicant.conf


CHEOF
