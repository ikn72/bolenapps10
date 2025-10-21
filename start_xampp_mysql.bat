@echo off
echo ========================================
echo   Starting XAMPP MySQL
echo ========================================
echo.

echo 🔄 Checking XAMPP Control Panel...
echo.

REM Check if XAMPP Control Panel is running
tasklist /FI "IMAGENAME eq xampp-control.exe" 2>NUL | find /I /N "xampp-control.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo ✅ XAMPP Control Panel is already running
) else (
    echo 🚀 Starting XAMPP Control Panel...
    start "" "C:\xampp\xampp-control.exe"
    echo ✅ XAMPP Control Panel started
)

echo.
echo 📋 Instructions:
echo.
echo 1. XAMPP Control Panel should now be open
echo 2. Click "Start" button next to "MySQL"
echo 3. Wait for MySQL status to show "Running"
echo 4. MySQL will be available on port 3306
echo.
echo 🔧 Alternative Methods:
echo.
echo Method 1 - Via XAMPP Control Panel:
echo   - Open C:\xampp\xampp-control.exe
echo   - Click Start next to MySQL
echo.
echo Method 2 - Via Command Line (Run as Administrator):
echo   - net start mysql
echo.
echo Method 3 - Direct MySQL Start:
echo   - C:\xampp\mysql\bin\mysqld.exe --console
echo.

echo 🧪 Test MySQL Connection:
echo   - Run: python test_mysql.py
echo.

pause