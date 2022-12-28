# My personal qemu preferences

This project contains scripts building qemu vm the way I use it for
development. Some provisioning scripts are separated as I sometimes need
them in my containers or other environments.

## Provisioning the VM

```
curl https://raw.githubusercontent.com/simple-is-hard/my-setup/main/qemu-vm/bootstrap | sh
```

## Starting the VM

```
curl https://raw.githubusercontent.com/simple-is-hard/my-setup/main/qemu-vm/vm > vm
chmod +x vm
./vm
```

## SSH to the VM

Connecting with SSH `ssh -p 42022 root@127.0.0.1`

Copy files with scp `scp -P 42022 file root@127.0.0.1:/file`

Midnight Commander shell link `root@127.0.0.1:42022`
