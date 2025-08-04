# Bolen Pisang - PowerShell Launcher
# Pembelajaran Kuliner Tradisional Indonesia

# Set console properties
$Host.UI.RawUI.WindowTitle = "Bolen Pisang - Pembelajaran Kuliner"

# Clear screen and show header
Clear-Host
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "    🍌 BOLEN PISANG 🍌" -ForegroundColor Yellow
Write-Host "    Pembelajaran Kuliner Tradisional" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "👩‍🎓 Pembuat: Eka Tiara Lubis" -ForegroundColor Cyan
Write-Host "📚 NIM: 5213342010" -ForegroundColor Cyan
Write-Host "🏫 Program: Pembelajaran Kuliner UNIMED" -ForegroundColor Cyan
Write-Host "🎯 Fokus: Kue Tradisional Indonesia" -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Website URL
$websiteUrl = "https://ikn72.github.io/bolenapps10/index.html"

Write-Host "Membuka website pembelajaran..." -ForegroundColor Yellow
Write-Host ""

try {
    # Open website in default browser
    Start-Process $websiteUrl
    
    Write-Host "✅ Website berhasil dibuka di browser!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 URL: $websiteUrl" -ForegroundColor White
    Write-Host ""
    Write-Host "Selamat belajar membuat Bolen Pisang! 🍌" -ForegroundColor Yellow
    
} catch {
    Write-Host "❌ Gagal membuka website!" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Silakan buka manual di browser:" -ForegroundColor Yellow
    Write-Host "$websiteUrl" -ForegroundColor White
}

Write-Host ""
Write-Host "Tekan Enter untuk keluar..." -ForegroundColor Gray
Read-Host