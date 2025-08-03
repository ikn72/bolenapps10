# Bolen Pisang Interactive - Desktop App

Media pembelajaran interaktif tentang pembuatan Bolen Pisang yang dikemas dalam aplikasi desktop menggunakan Electron.

## Cara Membuat File Executable (.exe)

### Prasyarat
1. Install Node.js dari https://nodejs.org/ (versi LTS)
2. Pastikan npm sudah terinstall (biasanya sudah include dengan Node.js)

### Langkah-langkah Build

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Test Aplikasi (Opsional)**
   ```bash
   npm start
   ```

3. **Build File Executable**
   ```bash
   npm run build-win
   ```

4. **File .exe akan tersedia di folder `dist/`**

### Struktur File Output
Setelah build berhasil, Anda akan mendapatkan:
- `dist/Bolen Pisang Interactive Setup 1.0.0.exe` - Installer
- `dist/win-unpacked/` - Folder aplikasi yang bisa dijalankan langsung

### Catatan Penting
- File executable akan berukuran sekitar 150-200 MB karena menyertakan runtime Electron
- Aplikasi akan berjalan seperti aplikasi desktop native
- Semua file media dan konten web akan dikemas dalam aplikasi

### Troubleshooting
- Jika ada error saat build, pastikan semua dependencies sudah terinstall
- Untuk Windows, mungkin perlu menjalankan command prompt sebagai Administrator
- Pastikan tidak ada antivirus yang memblokir proses build

## Fitur Aplikasi Desktop
- Menu bar dengan opsi Reload, Developer Tools, Zoom, dan Fullscreen
- Shortcut keyboard (F11 untuk fullscreen, F12 untuk developer tools)
- Window yang bisa di-resize dengan ukuran minimum 800x600
- Auto-focus dan optimasi untuk pengalaman desktop

## Teknologi
- Electron (Framework desktop)
- HTML5, CSS3, JavaScript
- Lectora Inspire (Content authoring)