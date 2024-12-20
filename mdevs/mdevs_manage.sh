#!/bin/bash
# Create by https://github.com/randifilan, generated by chatgpt

# Get all mdev devices
mdev_list=$(mdevctl list | awk '{print $1}')

# Get all VMs
vm_list=$(virsh list --all --name)

# Function to check if an mdev is in use
is_mdev_used() {
  local mdev_uuid=$1
  for vm in $vm_list; do
    if [[ -n "$vm" ]]; then
      # Check if the mdev UUID is attached to the VM
      if virsh dumpxml "$vm" | grep -q "$mdev_uuid"; then
        return 0
      fi
    fi
  done
  return 1
}

# Loop through all mdevs
for mdev_uuid in $mdev_list; do
  echo "Checking mdev: $mdev_uuid"

  if is_mdev_used "$mdev_uuid"; then
    echo "mdev is in use by a VM. Keeping it."
    mdevctl define --auto --uuid "$mdev_uuid"
  else
    echo "mdev is not in use. Stoping it."
    mdevctl undefine --uuid "$mdev_uuid"
    sudo mdevctl stop -u "$mdev_uuid"
  fi
done

echo "Script completed."
