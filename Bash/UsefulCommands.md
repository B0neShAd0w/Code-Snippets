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
 Aliases
 ```bash
 # Add an Alias
 alias theharvester='python3 ~/theHarvester/theHarvester.py'
 
 # Remove Alias
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
Bruteforce with stegcracker (note: StegSeek has replaced StegCracker)
```
stegcracker image.jpg /usr/share/wordlists/rockyou.txt
```
Crack Password protected Zip file
```
fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt file.zip -v
```

Decrypt .CPT files
```
ccdecrypt -K PASSWORD *.cpt*
```
