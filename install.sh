#!/bin/bash

# TODO: Rimuovi, solo per test
# firmware_path="/lib/firmware/"
firmware_path="./temp/lib/firmware/"

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
NULL='\033[0;m'

function test() {
	echo "esemese"
}

function ath6k_firmware() {
	ath6k_firmware_path="$firmware_path/ath6k/AR6004"

	echo "Copy Atheros Wifi firmware files..."
	
	if [[ ! -d "$ath6k_firmware_path" ]]; then
		echo -e "Creating ath6k firmware directory..."
		mkdir -p $ath6k_firmware_path
	fi

	if [[ ! -f "$ath6k_firmware_path/hw1.3/bdata.bin" && ! -f "$ath6k_firmware_path/hw1.3/fw-5.bin" ]]; then

		if [[ -d "./ath6kl-firmware" ]]; then
			echo -e "Copying hw1.3 atheros firmware..."
			cp -rf "./ath6kl-firmware/ath6k/AR6004/hw1.3" $ath6k_firmware_path
		else
			echo -e "Copying hw1.3 atheros firmware online..."
			mkdir -p "$ath6k_firmware_path/hw1.3"
			wget -P "$ath6k_firmware_path/hw1.3/" https://github.com/open-antux/dellv8pro-firmware/raw/main/ath6kl_firmware/ath6k/AR6004/hw1.3/bdata.bin
			wget -P "$ath6k_firmware_path/hw1.3/" https://github.com/open-antux/dellv8pro-firmware/raw/main/ath6kl_firmware/ath6k/AR6004/hw1.3/fw-5.bin
		fi

	fi

	if [[ ! -f "$ath6k_firmware_path/hw3.0/bdata.bin" && ! -f "$ath6k_firmware_path/hw3.0/fw-5.bin" ]]; then

                if [[ -d "./ath6kl-firmware" ]]; then
                        echo -e "Copying hw3.0 atheros firmware..."
                        cp -rf "./ath6kl-firmware/ath6k/AR6004/hw3.0" $ath6k_firmware_path
                else
                        echo -e "Copying hw3.0 atheros firmware online..."
                        mkdir -p "$ath6k_firmware_path/hw3.0"
                        wget -P "$ath6k_firmware_path/hw3.0/" https://github.com/open-antux/dellv8pro-firmware/raw/main/ath6kl_firmware/ath6k/AR6004/hw3.0/bdata.bin
                        wget -P "$ath6k_firmware_path/hw3.0/" https://github.com/open-antux/dellv8pro-firmware/raw/main/ath6kl_firmware/ath6k/AR6004/hw3.0/fw-5.bin
                fi

        fi
}

function intel_firmware() {
	intel_firmware_path="$firmware_path/intel"

	if [[ ! -d "$intel_firmware_path" ]]; then
                echo -e "Creating intel firmware directory..."
                mkdir -p $intel_firmware_path
        fi

	if [[ ! -f "$intel_firmware_path/fw_sst_0f28.bin" ]]; then
                
                if [[ -d "./intel-firmware" ]]; then
                        echo -e "Copying intel firmware..."
                        cp -rf "./intel-firmware/fw_sst_0f28.bin" $intel_firmware_path
                else    
                        echo -e "Copying intel firmware online..."
                        wget -P "$intel_firmware_path/intel/" https://github.com/open-antux/dellv8pro-firmware/raw/main/intel_firmware/fw_sst_0f28.bin
                fi
        
        fi
}

function main() {
	ath6k_firmware
	intel_firmware
}

if [[ "$(id -g)" == "0" ]]; then
	main
	echo -e "${GREEN}Reboot your system to apply the firmware changes${NULL}"
else
	echo -e "${RED}You can't run this script as normal user!${NULL}"
	exit 1
fi
