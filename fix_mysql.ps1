# MySQL Error Fix Script
# Mengatasi masalah MySQL di Windows dengan XAMPP

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   MySQL Error Fix Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to check if process is running
function Test-ProcessRunning {
    param([string]$ProcessName)
    return (Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) -ne $null
}

# Function to check if port is in use
function Test-PortInUse {
    param([int]$Port)
    $connections = netstat -an | Select-String ":$Port"
    return $connections.Count -gt 0
}

Write-Host "Checking MySQL Status..." -ForegroundColor Yellow
Write-Host ""

# Check if MySQL process is running
if (Test-ProcessRunning "mysqld") {
    Write-Host "MySQL process is running" -ForegroundColor Green
} else {
    Write-Host "MySQL process is NOT running" -ForegroundColor Red
}

# Check if port 3306 is in use
if (Test-PortInUse 3306) {
    Write-Host "Port 3306 is in use" -ForegroundColor Green
} else {
    Write-Host "Port 3306 is NOT in use" -ForegroundColor Red
}

# Check XAMPP Control Panel
if (Test-ProcessRunning "xampp-control") {
    Write-Host "XAMPP Control Panel is running" -ForegroundColor Green
} else {
    Write-Host "XAMPP Control Panel is NOT running" -ForegroundColor Red
    Write-Host "Starting XAMPP Control Panel..." -ForegroundColor Yellow
    Start-Process "C:\xampp\xampp-control.exe"
    Start-Sleep 3
}

Write-Host ""
Write-Host "SOLUTIONS TO FIX MySQL ERROR:" -ForegroundColor Cyan
Write-Host ""

Write-Host "1. MANUAL START via XAMPP Control Panel:" -ForegroundColor White
Write-Host "   - Open XAMPP Control Panel (should be open now)" -ForegroundColor Gray
Write-Host "   - Find MySQL row" -ForegroundColor Gray
Write-Host "   - Click Start button next to MySQL" -ForegroundColor Gray
Write-Host "   - Wait for status to show Running" -ForegroundColor Gray
Write-Host ""

Write-Host "2. COMMAND LINE START (Run as Administrator):" -ForegroundColor White
Write-Host "   - Open PowerShell as Administrator" -ForegroundColor Gray
Write-Host "   - Run: net start mysql" -ForegroundColor Gray
Write-Host "   - Or: Start-Service -Name mysql" -ForegroundColor Gray
Write-Host ""

Write-Host "3. DIRECT MySQL START:" -ForegroundColor White
Write-Host "   - Open Command Prompt" -ForegroundColor Gray
Write-Host "   - Run: C:\xampp\mysql\bin\mysqld.exe --console" -ForegroundColor Gray
Write-Host ""

Write-Host "4. COMMON MySQL ERRORS AND FIXES:" -ForegroundColor White
Write-Host ""

Write-Host "   Error: Cannot connect to MySQL server" -ForegroundColor Red
Write-Host "   Fix: Start MySQL service (methods above)" -ForegroundColor Green
Write-Host ""

Write-Host "   Error: Access denied for user" -ForegroundColor Red
Write-Host "   Fix: Check username/password" -ForegroundColor Green
Write-Host "   Default XAMPP: user=root, password=(empty)" -ForegroundColor Green
Write-Host ""

Write-Host "   Error: Port 3306 already in use" -ForegroundColor Red
Write-Host "   Fix: Kill process using port 3306" -ForegroundColor Green
Write-Host "   Command: netstat -ano | findstr :3306" -ForegroundColor Green
Write-Host ""

Write-Host "   Error: MySQL service will not start" -ForegroundColor Red
Write-Host "   Fix: Check my.ini configuration file" -ForegroundColor Green
Write-Host "   Location: C:\xampp\mysql\bin\my.ini" -ForegroundColor Green
Write-Host ""

Write-Host "5. TEST MySQL CONNECTION:" -ForegroundColor White
Write-Host "   - After starting MySQL, test with:" -ForegroundColor Gray
Write-Host "   - C:\xampp\mysql\bin\mysql.exe -u root -p" -ForegroundColor Gray
Write-Host "   - Press Enter when asked for password (default is empty)" -ForegroundColor Gray
Write-Host ""

Write-Host "6. ACCESS phpMyAdmin:" -ForegroundColor White
Write-Host "   - Start Apache in XAMPP Control Panel" -ForegroundColor Gray
Write-Host "   - Open browser: http://localhost/phpmyadmin" -ForegroundColor Gray
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "QUICK FIX SUMMARY:" -ForegroundColor Yellow
Write-Host "1. Open XAMPP Control Panel" -ForegroundColor White
Write-Host "2. Click Start next to MySQL" -ForegroundColor White
Write-Host "3. Wait for Running status" -ForegroundColor White
Write-Host "4. Test connection" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan

# Try to start MySQL automatically
Write-Host ""
Write-Host "Attempting automatic MySQL start..." -ForegroundColor Yellow

try {
    # Try to start MySQL service
    Start-Service -Name "mysql" -ErrorAction Stop
    Write-Host "MySQL service started successfully!" -ForegroundColor Green
} catch {
    Write-Host "Could not start MySQL service automatically" -ForegroundColor Red
    Write-Host "Please use XAMPP Control Panel to start MySQL manually" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")