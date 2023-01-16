Set-ExecutionPolicy Unrestricted -Scope Process -Force;

#init wrapper

./utils/create_user.ps1
#./utils/install_apps.ps1
#./utils/configure.ps1
./utils/init_tailscale.ps1