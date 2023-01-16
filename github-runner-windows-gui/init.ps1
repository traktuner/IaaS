Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#upgrade choco
echo "Upgrade chocolatey ..."
choco upgrade chocolatey

#install tailscale
echo "Install Tailscale ..."
choco install tailscale -y

echo "Revresh env variables ..."
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") #refresh PATH variables

#add local admin user
echo "Add local admin user ..."
${env:VNC_USER_PASSWORD} = $adminpassword
New-LocalUser ${env:VNC_USER} -Password "1234" -FullName ${env:VNC_USER} -Description "LOCAL ADMIN USER"
Add-LocalGroupMember -Group "Administrators" -Member ${env:VNC_USER}

echo "Init Tailscale ..."
tailscale up --authkey ${env:TAILSCALE_TOKEN} --unattended