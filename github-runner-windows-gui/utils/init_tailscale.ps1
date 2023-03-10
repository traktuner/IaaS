#upgrade choco
echo "Upgrade chocolatey ..."
choco upgrade chocolatey

#install tailscale
echo "Install Tailscale ..."
choco install tailscale -y

echo "Revresh env variables ..."
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") #refresh PATH variables

echo "Init Tailscale ..."
tailscale up --authkey ${env:TAILSCALE_TOKEN} --unattended