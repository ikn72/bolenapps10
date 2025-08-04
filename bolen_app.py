#!/usr/bin/env python3
"""
Bolen Pisang - Aplikasi Desktop
Aplikasi untuk membuka website pembelajaran kuliner Bolen Pisang
"""

import tkinter as tk
from tkinter import messagebox
import webbrowser
import sys
import os
from PIL import Image, ImageTk
import requests
from io import BytesIO

class BolenApp:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("🍌 Bolen Pisang - Pembelajaran Kuliner")
        self.root.geometry("500x400")
        self.root.configure(bg='#2E8B57')  # Sea green background
        
        # Set window icon (if available)
        try:
            self.root.iconbitmap('images/home.png')
        except:
            pass
        
        self.setup_ui()
        
    def setup_ui(self):
        """Setup the user interface"""
        # Main frame
        main_frame = tk.Frame(self.root, bg='#2E8B57', padx=20, pady=20)
        main_frame.pack(expand=True, fill='both')
        
        # Title
        title_label = tk.Label(
            main_frame,
            text="🍌 Bolen Pisang",
            font=('Arial', 24, 'bold'),
            fg='white',
            bg='#2E8B57'
        )
        title_label.pack(pady=(0, 10))
        
        # Subtitle
        subtitle_label = tk.Label(
            main_frame,
            text="Pembelajaran Kuliner Tradisional Indonesia",
            font=('Arial', 12),
            fg='#F0F8FF',
            bg='#2E8B57'
        )
        subtitle_label.pack(pady=(0, 20))
        
        # Author info frame
        info_frame = tk.Frame(main_frame, bg='#228B22', relief='raised', bd=2)
        info_frame.pack(pady=10, padx=20, fill='x')
        
        info_title = tk.Label(
            info_frame,
            text="👩‍🎓 Informasi Pembuat",
            font=('Arial', 14, 'bold'),
            fg='white',
            bg='#228B22'
        )
        info_title.pack(pady=5)
        
        # Author details
        details = [
            ("Nama:", "Eka Tiara Lubis"),
            ("NIM:", "5213342010"),
            ("Program:", "Pembelajaran Kuliner UNIMED"),
            ("Fokus:", "Kue Tradisional Indonesia")
        ]
        
        for label, value in details:
            detail_frame = tk.Frame(info_frame, bg='#228B22')
            detail_frame.pack(fill='x', padx=10, pady=2)
            
            tk.Label(
                detail_frame,
                text=label,
                font=('Arial', 10, 'bold'),
                fg='#F0F8FF',
                bg='#228B22',
                anchor='w'
            ).pack(side='left')
            
            tk.Label(
                detail_frame,
                text=value,
                font=('Arial', 10),
                fg='white',
                bg='#228B22',
                anchor='w'
            ).pack(side='left', padx=(10, 0))
        
        # Buttons frame
        button_frame = tk.Frame(main_frame, bg='#2E8B57')
        button_frame.pack(pady=30)
        
        # Main button to open website
        open_button = tk.Button(
            button_frame,
            text="👨‍🍳 BUKA WEBSITE PEMBELAJARAN",
            font=('Arial', 14, 'bold'),
            fg='white',
            bg='#FF6347',
            activebackground='#FF4500',
            activeforeground='white',
            relief='raised',
            bd=3,
            padx=20,
            pady=10,
            command=self.open_website
        )
        open_button.pack(pady=5)
        
        # Secondary button for offline version
        offline_button = tk.Button(
            button_frame,
            text="📁 BUKA VERSI OFFLINE",
            font=('Arial', 12),
            fg='white',
            bg='#4682B4',
            activebackground='#4169E1',
            activeforeground='white',
            relief='raised',
            bd=2,
            padx=15,
            pady=8,
            command=self.open_offline
        )
        offline_button.pack(pady=5)
        
        # Exit button
        exit_button = tk.Button(
            button_frame,
            text="❌ KELUAR",
            font=('Arial', 10),
            fg='white',
            bg='#DC143C',
            activebackground='#B22222',
            activeforeground='white',
            relief='raised',
            bd=2,
            padx=15,
            pady=5,
            command=self.exit_app
        )
        exit_button.pack(pady=(15, 5))
        
        # Status label
        self.status_label = tk.Label(
            main_frame,
            text="Siap untuk memulai pembelajaran!",
            font=('Arial', 9),
            fg='#F0F8FF',
            bg='#2E8B57'
        )
        self.status_label.pack(side='bottom', pady=10)
        
    def open_website(self):
        """Open the published website"""
        url = "https://ikn72.github.io/bolenapps10/index.html"
        try:
            self.status_label.config(text="Membuka website pembelajaran...")
            self.root.update()
            webbrowser.open(url)
            self.status_label.config(text="Website berhasil dibuka di browser!")
            
            # Show success message
            messagebox.showinfo(
                "Berhasil", 
                "Website pembelajaran Bolen Pisang telah dibuka di browser Anda!\n\n"
                f"URL: {url}"
            )
        except Exception as e:
            self.status_label.config(text="Gagal membuka website!")
            messagebox.showerror(
                "Error", 
                f"Gagal membuka website:\n{str(e)}\n\n"
                "Pastikan Anda terhubung ke internet dan browser tersedia."
            )
    
    def open_offline(self):
        """Open the offline version if available"""
        offline_file = os.path.join(os.path.dirname(__file__), "index.html")
        if os.path.exists(offline_file):
            try:
                self.status_label.config(text="Membuka versi offline...")
                self.root.update()
                webbrowser.open(f"file://{os.path.abspath(offline_file)}")
                self.status_label.config(text="Versi offline berhasil dibuka!")
                messagebox.showinfo("Berhasil", "Versi offline telah dibuka di browser!")
            except Exception as e:
                self.status_label.config(text="Gagal membuka versi offline!")
                messagebox.showerror("Error", f"Gagal membuka versi offline:\n{str(e)}")
        else:
            messagebox.showwarning(
                "File Tidak Ditemukan", 
                "File index.html tidak ditemukan di folder aplikasi.\n\n"
                "Gunakan tombol 'BUKA WEBSITE PEMBELAJARAN' untuk mengakses versi online."
            )
    
    def exit_app(self):
        """Exit the application"""
        if messagebox.askquestion("Keluar", "Apakah Anda yakin ingin keluar?") == 'yes':
            self.root.quit()
            sys.exit()
    
    def run(self):
        """Run the application"""
        # Center the window
        self.root.update_idletasks()
        x = (self.root.winfo_screenwidth() // 2) - (self.root.winfo_width() // 2)
        y = (self.root.winfo_screenheight() // 2) - (self.root.winfo_height() // 2)
        self.root.geometry(f"+{x}+{y}")
        
        # Start the main loop
        self.root.mainloop()

def main():
    """Main function"""
    try:
        app = BolenApp()
        app.run()
    except Exception as e:
        print(f"Error starting application: {e}")
        messagebox.showerror("Error", f"Gagal memulai aplikasi:\n{str(e)}")

if __name__ == "__main__":
    main()