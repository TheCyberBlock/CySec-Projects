@echo off
xcopy \\YAGNESH-PC\burp-cert /E /Y
copy firefox\bin\*.* C:\Windows\SysWOW64 /y
add-certs.cmd
cd C:
cd "%APPDATA%\Mozilla\Firefox\Profiles\"
cd *.default
echo user_pref("network.proxy.http", "192.168.1.7"); >>prefs.js
echo user_pref("network.proxy.http_port", 8585); >>prefs.js
echo user_pref("network.proxy.ssl", "192.168.1.7"); >>prefs.js
echo user_pref("network.proxy.ssl_port", 8585); >>prefs.js
echo user_pref("network.proxy.share_proxy_settings", true); >>prefs.js
echo user_pref("network.proxy.type", 1); >>prefs.js
cd %windir%

