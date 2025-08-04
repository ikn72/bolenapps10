# 🍌 Bolen Pisang - Desktop Application

Aplikasi desktop untuk mengakses website pembelajaran kuliner Bolen Pisang yang telah dipublish di GitHub Pages.

## 📋 Deskripsi

Aplikasi ini dibuat untuk memudahkan akses ke website pembelajaran kuliner Bolen Pisang yang dapat diakses di:
**https://ikn72.github.io/bolenapps10/index.html**

## 🚀 Cara Menggunakan (Pilih salah satu)

### ✅ Opsi 1: Langsung Pakai (Paling Mudah)
1. **Double-click** file `BolenPisang.bat` - Akan langsung membuka website
2. **Double-click** file `launcher.html` - Membuka launcher di browser
3. **Right-click** file `BolenPisang.ps1` → Run with PowerShell

### 🔧 Opsi 2: Membuat Executable (.exe) - Butuh Python

### Opsi 1: Versi Lengkap (dengan fitur tambahan)
1. Pastikan Python sudah terinstall di komputer Anda
2. Buka Command Prompt atau PowerShell di folder ini
3. Jalankan: `build_exe.bat`
4. Tunggu proses selesai
5. File executable akan tersedia di folder `dist/BolenPisang.exe`

### Opsi 2: Versi Simple (lebih ringan)
1. Pastikan Python sudah terinstall di komputer Anda
2. Buka Command Prompt atau PowerShell di folder ini
3. Jalankan: `build_simple.bat`
4. Tunggu proses selesai
5. File executable akan tersedia di folder `dist/BolenPisang.exe`

## 📁 File yang Dibuat

- `bolen_app.py` - Aplikasi versi lengkap dengan fitur tambahan
- `bolen_simple.py` - Aplikasi versi sederhana (direkomendasikan)
- `requirements.txt` - Daftar dependencies untuk versi lengkap
- `build_exe.bat` - Script untuk build versi lengkap
- `build_simple.bat` - Script untuk build versi sederhana
- `README_APP.md` - File dokumentasi ini

## ✨ Fitur Aplikasi

- **Buka Website Online**: Membuka website pembelajaran di browser
- **Versi Offline**: Membuka file HTML lokal jika tersedia
- **Interface User-Friendly**: Tampilan yang mudah digunakan
- **Informasi Pembuat**: Menampilkan informasi lengkap pembuat

## 🎯 Cara Menggunakan

1. Jalankan file `BolenPisang.exe` yang telah dibuat
2. Klik tombol "👨‍🍳 MULAI PEMBELAJARAN" untuk membuka website
3. Website akan terbuka di browser default Anda
4. Mulai belajar membuat Bolen Pisang!

## 📝 Informasi Pembuat

- **Nama**: Eka Tiara Lubis
- **NIM**: 5213342010
- **Program**: Pembelajaran Kuliner UNIMED
- **Fokus**: Kue Tradisional Indonesia

## 🔧 Troubleshooting

### Jika build gagal:
1. Pastikan Python terinstall dengan benar
2. Pastikan pip tersedia
3. Coba install PyInstaller manual: `pip install pyinstaller`
4. Jalankan ulang script build

### Jika aplikasi tidak bisa membuka website:
1. Pastikan koneksi internet tersedia
2. Pastikan browser default tersedia
3. Coba akses website manual di browser

## 📞 Support

Jika mengalami masalah, pastikan:
- Python versi 3.7 atau lebih baru terinstall
- Koneksi internet stabil
- Browser default tersedia di sistem

---

**Website**: https://ikn72.github.io/bolenapps10/index.html
**Dibuat dengan**: Python + Tkinter + PyInstaller