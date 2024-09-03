#!/bin/bash -e

on_chroot <<CHEOF
	# MDK: Add dev repo
    curl -s https://packagecloud.io/install/repositories/rgnets_mdk/wlanpi-dev/script.deb.sh | sudo bash

CHEOF

install -m 644 files/mdk_packagekit "${ROOTFS_DIR}/etc/apt/preferences.d/"