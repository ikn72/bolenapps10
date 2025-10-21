#!/usr/bin/env python3
"""
Script untuk test koneksi MySQL
Jalankan script ini untuk mengecek koneksi ke MySQL
"""

import sys

def test_mysql_connection():
    """Test koneksi ke MySQL database"""
    
    # Check if mysql-connector-python is installed
    try:
        import mysql.connector
        print("✅ mysql-connector-python sudah terinstall")
    except ImportError:
        print("❌ mysql-connector-python belum terinstall")
        print("Install dengan: pip install mysql-connector-python")
        return False
    
    # Test connection parameters
    config = {
        'host': 'localhost',
        'port': 3306,
        'user': 'root',
        'password': '',  # Ganti dengan password MySQL Anda
        'database': 'test'  # Ganti dengan nama database Anda
    }
    
    try:
        # Attempt connection
        print(f"🔄 Mencoba koneksi ke MySQL...")
        print(f"   Host: {config['host']}")
        print(f"   Port: {config['port']}")
        print(f"   User: {config['user']}")
        
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            print("✅ Koneksi MySQL berhasil!")
            
            # Get server info
            cursor = connection.cursor()
            cursor.execute("SELECT VERSION()")
            version = cursor.fetchone()
            print(f"   MySQL Version: {version[0]}")
            
            cursor.close()
            connection.close()
            print("✅ Koneksi ditutup dengan baik")
            return True
            
    except mysql.connector.Error as e:
        print(f"❌ Error koneksi MySQL: {e}")
        print("\n🔧 Solusi yang bisa dicoba:")
        print("1. Pastikan MySQL service berjalan")
        print("2. Periksa username dan password")
        print("3. Periksa nama host dan port")
        print("4. Pastikan database exists")
        return False
    
    except Exception as e:
        print(f"❌ Error umum: {e}")
        return False

def install_mysql_connector():
    """Install mysql-connector-python"""
    import subprocess
    
    try:
        print("🔄 Installing mysql-connector-python...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "mysql-connector-python"])
        print("✅ mysql-connector-python berhasil diinstall")
        return True
    except subprocess.CalledProcessError as e:
        print(f"❌ Gagal install mysql-connector-python: {e}")
        return False

if __name__ == "__main__":
    print("=" * 50)
    print("🔍 MySQL Connection Test")
    print("=" * 50)
    
    # Try to install mysql-connector if not available
    try:
        import mysql.connector
    except ImportError:
        print("📦 mysql-connector-python tidak ditemukan")
        if input("Install mysql-connector-python? (y/n): ").lower() == 'y':
            if not install_mysql_connector():
                sys.exit(1)
        else:
            print("❌ Tidak bisa test tanpa mysql-connector-python")
            sys.exit(1)
    
    # Run connection test
    success = test_mysql_connection()
    
    print("\n" + "=" * 50)
    if success:
        print("🎉 Test koneksi MySQL BERHASIL!")
    else:
        print("💥 Test koneksi MySQL GAGAL!")
        print("\n📋 Checklist troubleshooting:")
        print("□ MySQL Server terinstall?")
        print("□ MySQL Service berjalan?")
        print("□ Username/password benar?")
        print("□ Port 3306 terbuka?")
        print("□ Database exists?")
    print("=" * 50)