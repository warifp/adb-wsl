<h1 align="center" style="font-weight: bold">
  ADB WSL
</h1>


1.  **Configuration** [.bashrc / .zshrc]

    Add this script.

    ```shell
    # 5037 adb default port.
    export WSL_HOST_IP="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
    export ADB_SERVER_SOCKET=tcp:$WSL_HOST_IP:5037
    ```

2.  **Windows Defender Firewall**

    Then create a firewall entry, create a new "Inbound" Rule. Select "Port" then Specific TCP port "5037" then "Allow the connection" then check all of Domain, Private and Public and add a name. After the firewall entry is added, open up its properties, go to Scope -> Remote IP Addresses -> Add "172.16.0.0/12".

3.  **VBS Script** (optional)

    ```shell
    CreateObject("WScript.Shell").Run "%USERPROFILE%\AppData\Local\Android\Sdk\platform-tools\adb.exe kill-server", 0, True
    CreateObject("WScript.Shell").Run "%USERPROFILE%\AppData\Local\Android\Sdk\platform-tools\adb.exe -a -P 5037 nodaemon server", 0, True
    ```

    or
    
    ```
    adb -a -P 5037 nodaemon server
    ```
