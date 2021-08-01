# 5037 adb default port.
export WSL_HOST_IP="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
export ADB_SERVER_SOCKET=tcp:$WSL_HOST_IP:5037