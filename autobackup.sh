#!/bin/bash -x

echo ====Auto Backup====
echo -Made by Johnanater-
echo 

# The whole directory you want to backup
Directory="./tobak"

# Where the backup should be stored
BackupDir="./backupto"

# The folder name inside the zip
ZipFolderName="Servers"

# Your password for encrypting the zip file
ZipPassword="yourpassword"

mkdir ./temp/
if [ ! -d "$BackupDir" ]; then
	mkdir $BackupDir
fi

# If you want to copy more folders, just copy paste this line
# Replace $UnturnedDir with your directory!
cp -R $Directory ./temp/$ZipFolderName/

echo Finished copy!

# Start the compression
Date=`date +%m-%d-%y`
7z a -m0=lzma2 -p$ZipPassword -mhe -mx -r -bb0 "$BackupDir/Backup_$Date.7z" "./temp/$ZipFolderName"

# Delete the temp directory
if [ -d ./temp ]; then
	rm -rf ./temp/
fi

read -p "Finished!"
