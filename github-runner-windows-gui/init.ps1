Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#init.ps1 $VNC_USER" "$VNC_PASSWORD" "$VNC_USER_PASSWORD" "$TAILSCALE_TOKEN"

VNC_USER=$1
VNC_PASSWORD=$2
VNC_USER_PASSWORD=$3
TAILSCALE_TOKEN=$4

 choco install tailscale -y
 refreshenv
 tailscale up --authkey ${env:TAILSCALE_TOKEN} --unattended