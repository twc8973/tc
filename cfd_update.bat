@echo off
sc stop cloudflared >nul 2>&1
rename "C:\Cloudflared\cloudflared.exe" cloudflared.exe.old
rename "C:\Cloudflared\cloudflared.exe.new" cloudflared.exe
del "C:\Cloudflared\cloudflared.exe.old"
sc start cloudflared >nul 2>&1
del cfd_update.bat