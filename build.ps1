# Bolen Pisang Interactive - Build Script
# PowerShell version for better Windows compatibility

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Bolen Pisang Interactive - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version 2>$null
    if ($nodeVersion) {
        Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
    } else {
        throw "Node.js not found"
    }
} catch {
    Write-Host "✗ ERROR: Node.js tidak ditemukan!" -ForegroundColor Red
    Write-Host "Silakan install Node.js dari https://nodejs.org/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Install dependencies
Write-Host "Installing dependencies..." -ForegroundColor Yellow
try {
    npm install
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Dependencies installed successfully!" -ForegroundColor Green
    } else {
        throw "npm install failed"
    }
} catch {
    Write-Host "✗ ERROR: Gagal menginstall dependencies!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Build the application
Write-Host "Building executable..." -ForegroundColor Yellow
try {
    npm run build-win
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Build completed successfully!" -ForegroundColor Green
    } else {
        throw "npm run build-win failed"
    }
} catch {
    Write-Host "✗ ERROR: Gagal membuild aplikasi!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " BUILD BERHASIL!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "File executable tersedia di folder 'dist\'" -ForegroundColor Cyan
Write-Host "- Installer: " -NoNewline -ForegroundColor White
Write-Host "dist\Bolen Pisang Interactive Setup 1.0.0.exe" -ForegroundColor Yellow
Write-Host "- Portable: " -NoNewline -ForegroundColor White
Write-Host "dist\win-unpacked\Bolen Pisang Interactive.exe" -ForegroundColor Yellow
Write-Host ""

# Ask if user wants to open the dist folder
$openFolder = Read-Host "Buka folder dist? (y/n)"
if ($openFolder -eq "y" -or $openFolder -eq "Y") {
    if (Test-Path "dist") {
        Start-Process "dist"
    } else {
        Write-Host "Folder dist tidak ditemukan." -ForegroundColor Red
    }
}

Read-Host "Press Enter to exit"