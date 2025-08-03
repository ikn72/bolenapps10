@echo off
echo ========================================
echo  Node.js Auto Installer
echo ========================================
echo.

echo Checking if Node.js is already installed...
node --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo ✅ Node.js sudah terinstall: %NODE_VERSION%
    echo.
    echo Lanjut ke build aplikasi...
    pause
    call build.bat
    exit /b 0
)

echo ❌ Node.js belum terinstall
echo.
echo 🔄 Membuka halaman download Node.js...
echo.
echo 📋 INSTRUKSI MANUAL:
echo 1. Halaman download akan terbuka di browser
echo 2. Download versi LTS (Long Term Support)
echo 3. Jalankan installer yang didownload
echo 4. Ikuti wizard instalasi (pilih "Add to PATH")
echo 5. Restart komputer setelah instalasi selesai
echo 6. Jalankan file "build.bat" untuk build aplikasi
echo.

start https://nodejs.org/en/download/

echo 💡 Setelah install Node.js, jalankan "build.bat"
echo.
pause