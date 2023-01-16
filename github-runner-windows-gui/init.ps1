Set-ExecutionPolicy Unrestricted -Scope Process -Force;

#init wrapper

./utils/create_user.sh
#./utils/install_apps.sh
#./utils/configure.sh
./utils/init_tailscale.sh