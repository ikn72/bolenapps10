#!/usr/bin/env python3
"""
Bolen Pisang - Simple Desktop App
Aplikasi sederhana untuk membuka website pembelajaran kuliner Bolen Pisang
"""

import tkinter as tk
from tkinter import messagebox
import webbrowser
import sys
import os

class SimpleBolenApp:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("🍌 Bolen Pisang - Pembelajaran Kuliner")
        self.root.geometry("450x350")
        self.root.configure(bg='#2E8B57')
        self.root.resizable(False, False)
        
        self.setup_ui()
        
    def setup_ui(self):
        """Setup the user interface"""
        # Main frame
        main_frame = tk.Frame(self.root, bg='#2E8B57', padx=30, pady=20)
        main_frame.pack(expand=True, fill='both')
        
        # Title
        title_label = tk.Label(
            main_frame,
            text="🍌 Bolen Pisang",
            font=('Arial', 20, 'bold'),
            fg='white',
            bg='#2E8B57'
        )
        title_label.pack(pady=(0, 5))
        
        # Subtitle
        subtitle_label = tk.Label(
            main_frame,
            text="Pembelajaran Kuliner Tradisional Indonesia",
            font=('Arial', 11),
            fg='#F0F8FF',
            bg='#2E8B57'
        )
        subtitle_label.pack(pady=(0, 20))
        
        # Info box
        info_frame = tk.Frame(main_frame, bg='#228B22', relief='solid', bd=1)
        info_frame.pack(pady=10, fill='x')
        
        tk.Label(
            info_frame,
            text="👩‍🎓 Eka Tiara Lubis - 5213342010",
            font=('Arial', 12, 'bold'),
            fg='white',
            bg='#228B22',
            pady=8
        ).pack()
        
        tk.Label(
            info_frame,
            text="Pembelajaran Kuliner UNIMED",
            font=('Arial', 10),
            fg='#F0F8FF',
            bg='#228B22',
            pady=(0, 8)
        ).pack()
        
        # Main button
        open_button = tk.Button(
            main_frame,
            text="👨‍🍳 MULAI PEMBELAJARAN",
            font=('Arial', 14, 'bold'),
            fg='white',
            bg='#FF6347',
            activebackground='#FF4500',
            activeforeground='white',
            relief='raised',
            bd=3,
            padx=20,
            pady=12,
            command=self.open_website,
            cursor='hand2'
        )
        open_button.pack(pady=20)
        
        # Secondary buttons frame
        button_frame = tk.Frame(main_frame, bg='#2E8B57')
        button_frame.pack(pady=10)
        
        # Offline button
        offline_button = tk.Button(
            button_frame,
            text="📁 Versi Offline",
            font=('Arial', 10),
            fg='white',
            bg='#4682B4',
            activebackground='#4169E1',
            activeforeground='white',
            relief='raised',
            bd=2,
            padx=15,
            pady=6,
            command=self.open_offline,
            cursor='hand2'
        )
        offline_button.pack(side='left', padx=5)
        
        # Exit button
        exit_button = tk.Button(
            button_frame,
            text="❌ Keluar",
            font=('Arial', 10),
            fg='white',
            bg='#DC143C',
            activebackground='#B22222',
            activeforeground='white',
            relief='raised',
            bd=2,
            padx=15,
            pady=6,
            command=self.exit_app,
            cursor='hand2'
        )
        exit_button.pack(side='right', padx=5)
        
        # Status
        self.status_label = tk.Label(
            main_frame,
            text="Klik tombol di atas untuk memulai!",
            font=('Arial', 9),
            fg='#F0F8FF',
            bg='#2E8B57'
        )
        self.status_label.pack(side='bottom', pady=(20, 0))
        
    def open_website(self):
        """Open the published website"""
        url = "https://ikn72.github.io/bolenapps10/index.html"
        try:
            self.status_label.config(text="Membuka website...")
            self.root.update()
            webbrowser.open(url)
            self.status_label.config(text="Website berhasil dibuka!")
            
            messagebox.showinfo(
                "Berhasil", 
                "Website pembelajaran telah dibuka di browser!\n\n"
                "Selamat belajar membuat Bolen Pisang! 🍌"
            )
        except Exception as e:
            self.status_label.config(text="Gagal membuka website!")
            messagebox.showerror(
                "Error", 
                f"Tidak dapat membuka website:\n{str(e)}\n\n"
                "Pastikan koneksi internet tersedia."
            )
    
    def open_offline(self):
        """Open offline version"""
        offline_file = os.path.join(os.path.dirname(__file__), "index.html")
        if os.path.exists(offline_file):
            try:
                webbrowser.open(f"file://{os.path.abspath(offline_file)}")
                messagebox.showinfo("Berhasil", "Versi offline dibuka!")
            except Exception as e:
                messagebox.showerror("Error", f"Gagal membuka offline:\n{str(e)}")
        else:
            messagebox.showinfo(
                "Info", 
                "File offline tidak tersedia.\n"
                "Gunakan tombol 'MULAI PEMBELAJARAN' untuk versi online."
            )
    
    def exit_app(self):
        """Exit application"""
        self.root.quit()
    
    def run(self):
        """Run the application"""
        # Center window
        self.root.update_idletasks()
        x = (self.root.winfo_screenwidth() // 2) - (self.root.winfo_width() // 2)
        y = (self.root.winfo_screenheight() // 2) - (self.root.winfo_height() // 2)
        self.root.geometry(f"+{x}+{y}")
        
        self.root.mainloop()

if __name__ == "__main__":
    app = SimpleBolenApp()
    app.run()