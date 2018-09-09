**Installion:**

1. Extract the zip anywhere
2. Edit the config section of "autobackup.bat"
2. Setup a simple task in task scheduler to run the .bat file
3. Run "autobackup.bat", it will automatically backup your servers
4. Enjoy!

---
	
**Extra Setup:**

I recommend using Battle Encoder Shirase (BES) for xcopy, and Rar/7z to throttle it's CPU usage.
BES throttles the program so that it won't max the CPU out at 100%, which would cause the server to lag.
I recommend using the latest, as it allows watching for more programs.

You can find BES here:  http://mion.faireal.net/BES/

The GUI is nice, but the CLI can be used easier here so we'll use that.

You can add this line to the copying section of autobackup.bat. Use Rar.exe or 7z.exe (Around line 56)

	bes.exe -J -m "C:\Windows\System32\Xcopy.exe" 45 --add "C:\Program Files\WinRAR\Rar.exe" 80 --add
	
As well as a taskkill at the end (Around line 93)

	taskkill /IM bes.exe
	
This will start BES and make it watch for those programs, then at the end it'll close BES.

---

**FAQ:**

1. I have more folders, how do I backup those?

	**Answer**: Open autobackup.bat and scroll down to where it says "Copying"
	You can copy paste that line and edit the directories you want to copy.
			
2. I see "File verification failed.", what's wrong?

	**Answer**: It's most likely nothing. If you have a plugin that moves files (PLSTimedSpy),
	then some files might not be in the same directory when the backup
	started. If you don't want this to happen at all, then only run backups
	when the servers are restarting or offline.
	
3. Which should I choose? WinRAR or 7zip?

	**Answer**: They are both great, so it's mostly down to personal preference. Feel free
	to experiment
	
	Here's a screenshot of a backup of Unturned server files (mostly plaintext with tiny jpgs)
	https://imgur.com/a/hMDeXsy
	
4. Do you have a Linux version of this?

	**Answer**: Even though it's mostly for Windows, yes! I made a quick version of it
	in Bash. It's called autobackup.sh in this repo!

---	
		
**Help:**

If you still need help feel free to contact me on Discord: Johnanater#6836

or on my Discord server: https://discord.gg/VTCzMVG

---	
	
**Editing the script:**

I have tried my best to comment everything, so feel free to edit anything to your liking!

If you want to modify this script, please give me credit! :)

---	
	
**Love my work?**

Ethereum: 0x43db5a4a44a57f0699c320dbf1131879ec831274

Ripple: rDrdhCVD79js6dTWHC1d6cdHjvj2hD3T1H

[![](https://www.paypalobjects.com/webstatic/en_US/btn/btn_donate_cc_147x47.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7QEHYC457X5SW)
