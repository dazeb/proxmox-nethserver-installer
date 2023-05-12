![proxmox-nethserver-installer](https://github.com/dazeb/proxmox-nethserver-installer/assets/67932890/6417807b-439f-4433-80f0-0b3525f776f6)

# Proxmox Nethserver 8 Installer

A Proxmox Helper Script to install Nethserver in Proxmox.

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
## Accessing the Admin Panel

To access the login page go to `vm-ip/cluster-admin` eg `192.168.0.111/cluster-admin`

Login `admin`
Password `Nethesis,1234`

The installer will ask you to change the password.

## Multiple machines

Just run the script multiple times to add new nodes, the script will make sure they all have different ID's

The installer will ask where to import the VM disk, How much RAM to allocate and the number of processor cores. The rest is automatic.
Default values are 2GB RAM and 2 Cores.

#### I'm sure there is better ways of doing it but this works fine. Tested and confirmed working with Proxmox 7.3

### For more helper scripts like this but much better check out [tteck's Proxmox Heler Scripts](https://tteck.github.io/Proxmox/)
