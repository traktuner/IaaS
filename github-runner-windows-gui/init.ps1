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

#add local user
New-LocalUser ${env:VNC_USER} -Password ${env:VNC_USER_PASSWORD} -FullName ${env:VNC_USER} -Description "LOCAL USER"

echo "Init Tailscale ..."
tailscale up --authkey ${env:TAILSCALE_TOKEN} --unattended