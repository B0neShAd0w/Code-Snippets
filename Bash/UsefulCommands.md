List installed applications
```bash
apt list --installed
```
Fully remove application
```bash
sudo apt purge --auto-remove APPLICATION
```

Set a new Hostname
```bash
sudo hostnamectl set-hostname NEW-HOSTNAME
```
 Remove Alias
 ```bash
 unalias ALIAS_NAME
 ```
Get Info with Steghide
```
steghide info image.jpg
```

Extract with Steghide
```
steghide extract -sf image.jpg
```
Bruteforce with stegcracker
```
stegcracker image.jpg /usr/share/wordlists/rockyou.txt
```
