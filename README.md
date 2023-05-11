# Proxmox nethserver Installer

A Proxmox Helper Script to install nethserver in Proxmox.

## How to use

### Download the script to your Proxmox host by cloning the repo or using `wget`

```sh
git clone https://github.com/dazeb/proxmox-nethserver-installer.git
```

cd into the folder, make the file executable then run the script
```sh
cd proxmox-nethserver-installer
chmod +x nethserver-install.sh
./nethserver-install.sh
```
### You can also download the script with `wget`
```sh
wget https://raw.githubusercontent.com/dazeb/proxmox-nethserver-installer/main/nethserver-install.sh
```
Make the file executable then run the script.
```sh
chmod +x nethserver-install.sh
./nethserver-install.sh
```

The installer will ask where to import the VM disk, How much RAM to allocate and the number of processor cores. The rest is automatic.
Default values are 2GB RAM and 2 Cores.

#### I'm sure there is better ways of doing it but this works fine. Tested and confirmed working with Proxmox 7.3

### For more helper scripts like this but much better check out [tteck's Proxmox Heler Scripts](https://tteck.github.io/Proxmox/)
