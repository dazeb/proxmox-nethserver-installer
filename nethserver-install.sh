#!/bin/bash

# Variables
IMAGE_URL=$(whiptail --inputbox 'Enter the URL for the Nethserver image (default: https://github.com/NethServer/ns8-core/releases/download/1.0.0/ns8-debian-11-1.0.0.qcow2:' 8 78 'https://github.com/NethServer/ns8-core/releases/download/1.0.0/ns8-debian-11-1.0.0.qcow2' --title 'Nethserver Installation' 3>&1 1>&2 2>&3)
RAM=$(whiptail --inputbox 'Enter the amount of RAM (in MB) for the new virtual machine (default: 2048):' 8 78 2048 --title 'Nethserver Installation' 3>&1 1>&2 2>&3)
CORES=$(whiptail --inputbox 'Enter the number of cores for the new virtual machine (default: 2):' 8 78 2 --title 'Nethserver Installation' 3>&1 1>&2 2>&3)

# Get the next available VMID
ID=$(pvesh get /cluster/nextid)

touch "/etc/pve/qemu-server/$ID.conf"

# Get the storage name from the user
STORAGE=$(whiptail --inputbox 'Enter the storage name where the image should be imported:' 8 78 --title 'Nethserver Installation' 3>&1 1>&2 2>&3)

# Download Nethserver image
wget "$IMAGE_URL"

# import the qcow2 file to the default virtual machine storage
qm importdisk "$ID" "$IMAGE_NAME.qcow2" "$STORAGE"

# Set vm settings
qm set "$ID" --cores "$CORES"
qm set "$ID" --memory "$RAM"
qm set "$ID" --net0 'virtio,bridge=vmbr0'
qm set "$ID" --scsi0 "$STORAGE:vm-$ID-disk-0"
qm set "$ID" --boot order='scsi0'
qm set "$ID" --scsihw virtio-scsi-pci
qm set "$ID" --name 'nethserver' >/dev/null
qm set "$ID" --description '### [Nethserver Website](https://ns8.nethserver.org/) >/dev/null

# Tell user the virtual machine is created
echo "VM $ID Created."

# Start the virtual machine
qm start "$ID"
