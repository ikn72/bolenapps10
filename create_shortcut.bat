@echo off
title Buat Shortcut Desktop - Bolen Pisang
color 3F

echo.
echo ========================================
echo    Membuat Shortcut Desktop
echo    🍌 Bolen Pisang 🍌
echo ========================================
echo.

set "currentDir=%~dp0"
set "desktopPath=%USERPROFILE%\Desktop"
set "shortcutName=Bolen Pisang - Pembelajaran Kuliner.lnk"

echo Membuat shortcut di Desktop...
echo.

REM Create VBS script to create shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo sLinkFile = "%desktopPath%\%shortcutName%" >> "%temp%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\CreateShortcut.vbs"
echo oLink.TargetPath = "%currentDir%BolenPisang.bat" >> "%temp%\CreateShortcut.vbs"
echo oLink.WorkingDirectory = "%currentDir%" >> "%temp%\CreateShortcut.vbs"
echo oLink.Description = "Bolen Pisang - Pembelajaran Kuliner Tradisional Indonesia" >> "%temp%\CreateShortcut.vbs"
echo oLink.Save >> "%temp%\CreateShortcut.vbs"

REM Execute VBS script
cscript //nologo "%temp%\CreateShortcut.vbs"

REM Clean up
del "%temp%\CreateShortcut.vbs"

echo ✅ Shortcut berhasil dibuat di Desktop!
echo.
echo 📁 Lokasi: %desktopPath%\%shortcutName%
echo.
echo Sekarang Anda bisa double-click shortcut di Desktop
echo untuk membuka aplikasi Bolen Pisang! 🍌
echo.
echo Tekan tombol apa saja untuk keluar...
pause >nul