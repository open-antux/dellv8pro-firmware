# dell8pro-firmware
That's a simple script in order to add the correct firmware for WiFi (Atheros firmware) and sound (Intel firmware).

## Usage
You can use this script by cloning the repo on your machine or by executing the script online.

### Cloning repo
The only thing to do is cloning the repo and executing the script:
```bash
$ git clone https://github.com/open-antux/dellv8pro-firmware.git
$ cd dellv8pro-firmware
# chmod +x install.sh
# ./install.sh
```
### Online
In order to use this script online, you required `curl` and `wget`:
```bash
# bash <(curl https://raw.githubusercontent.com/open-antux/dellv8pro-firmware/main/install.sh)
```

## Thanksgiving 
Atheros firmware: @qca
Intel firmware: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/intel
