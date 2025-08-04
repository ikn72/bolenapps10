@echo off
echo ========================================
echo   Bolen Pisang - Build Simple Executable
echo ========================================
echo.

echo Installing PyInstaller...
pip install pyinstaller

echo.
echo Building executable...
pyinstaller --onefile --windowed --name "BolenPisang" bolen_simple.py

echo.
echo Build complete!
echo.
echo Executable file created: dist\BolenPisang.exe
echo.
echo You can now run the .exe file to launch the application!
echo.
pause