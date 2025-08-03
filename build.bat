@echo off
echo ========================================
echo  Bolen Pisang Interactive - Build Script
echo ========================================
echo.

echo Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Node.js tidak ditemukan!
    echo.
    echo 📋 LANGKAH YANG HARUS DILAKUKAN:
    echo 1. Buka browser dan kunjungi: https://nodejs.org/
    echo 2. Download versi LTS (Long Term Support)
    echo 3. Install Node.js dengan mengikuti wizard
    echo 4. Restart komputer setelah instalasi
    echo 5. Jalankan script ini lagi
    echo.
    echo 💡 TIP: Pilih "Add to PATH" saat instalasi
    echo.
    start https://nodejs.org/
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ Node.js ditemukan: %NODE_VERSION%
echo.

echo Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Gagal menginstall dependencies!
    pause
    exit /b 1
)

echo.
echo Building executable...
call npm run build-win
if %errorlevel% neq 0 (
    echo ERROR: Gagal membuild aplikasi!
    pause
    exit /b 1
)

echo.
echo ========================================
echo  BUILD BERHASIL!
echo ========================================
echo.
echo File executable tersedia di folder 'dist\'
echo - Installer: dist\Bolen Pisang Interactive Setup 1.0.0.exe
echo - Portable: dist\win-unpacked\Bolen Pisang Interactive.exe
echo.
pause