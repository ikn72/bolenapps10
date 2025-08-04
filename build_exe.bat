@echo off
echo ========================================
echo   Bolen Pisang - Build Executable
echo ========================================
echo.

echo Installing required packages...
pip install -r requirements.txt

echo.
echo Building executable...
pyinstaller --onefile --windowed --name "BolenPisang" --icon=images/home.png bolen_app.py

echo.
echo Build complete!
echo Executable file location: dist/BolenPisang.exe
echo.
pause