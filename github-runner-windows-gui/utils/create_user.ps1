#add local admin user
echo "Add local admin user ..."
$adminpassword = convertto-securestring ${env:VNC_USER_PASSWORD} -asplaintext -force
New-LocalUser ${env:VNC_USER} -Password $adminpassword -FullName ${env:VNC_USER} -Description "LOCAL ADMIN USER"
Add-LocalGroupMember -Group "Administrators" -Member ${env:VNC_USER}