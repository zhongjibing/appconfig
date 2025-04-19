```bash
mkdir /var/swap
# dd if=/dev/zero of=/var/swap/file.swp bs=4k count=2097152
fallocate -l 4G /var/swap/file.swp
chmod 0600 /var/swap/file.swp
mkswap /var/swap/file.swp
swapon /var/swap/file.swp

vi /etc/fstab
	/var/swap/file.swp	swap swap defaults 0 0
```
