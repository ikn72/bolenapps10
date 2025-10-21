@echo off
echo ========================================
echo   MySQL Troubleshooting Script
echo ========================================
echo.

echo 🔍 Checking MySQL Installation...
echo.

REM Check if MySQL is in PATH
where mysql >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ MySQL found in PATH
    mysql --version
) else (
    echo ❌ MySQL not found in PATH
)

echo.
echo 🔍 Checking MySQL Services...
echo.

REM Check MySQL services
powershell -Command "Get-Service -Name '*mysql*' | Format-Table -AutoSize"

echo.
echo 🔍 Checking MySQL Ports...
echo.

REM Check if port 3306 is in use
netstat -an | findstr :3306
if %errorlevel% == 0 (
    echo ✅ Port 3306 is in use (MySQL might be running)
) else (
    echo ❌ Port 3306 is not in use
)

echo.
echo 🔍 Checking XAMPP Installation...
echo.

REM Check for XAMPP
if exist "C:\xampp\mysql\bin\mysql.exe" (
    echo ✅ XAMPP MySQL found
    echo Location: C:\xampp\mysql\bin\mysql.exe
) else (
    echo ❌ XAMPP MySQL not found
)

echo.
echo 🔧 Troubleshooting Options:
echo.
echo 1. Install MySQL Server:
echo    - Download from: https://dev.mysql.com/downloads/mysql/
echo.
echo 2. Install XAMPP (Easier):
echo    - Download from: https://www.apachefriends.org/
echo.
echo 3. Start MySQL Service (if installed):
echo    - Run: net start mysql
echo    - Or: Start-Service -Name "MySQL80"
echo.
echo 4. Test MySQL Connection:
echo    - Run: python test_mysql.py
echo.

pause