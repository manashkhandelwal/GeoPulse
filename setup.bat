@echo off
REM GeoPulse Setup Script for Windows
REM This script helps automate the initial setup of the GeoPulse project

echo ================================================
echo    GeoPulse Project Setup (Windows)
echo ================================================
echo.

REM Check if Python is installed
echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH.
    echo Please install Python 3.11.9 or higher from https://www.python.org/downloads/
    pause
    exit /b 1
)
python --version
echo [OK] Python found
echo.

REM Check if Node.js is installed
echo Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH.
    echo Please install Node.js 18 or higher from https://nodejs.org/
    pause
    exit /b 1
)
node --version
echo [OK] Node.js found
echo.

REM Check if npm is installed
echo Checking npm installation...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] npm is not installed or not in PATH.
    pause
    exit /b 1
)
npm --version
echo [OK] npm found
echo.

REM Confirm before proceeding
echo This script will set up the GeoPulse project on your system.
echo.
set /p CONTINUE="Do you want to continue with the setup? (Y/N): "
if /i not "%CONTINUE%"=="Y" (
    echo Setup cancelled.
    pause
    exit /b 0
)

REM Setup Backend
echo.
echo ================================================
echo Setting up Backend...
echo ================================================
cd backend

echo Creating Python virtual environment...
python -m venv venv
if %errorlevel% neq 0 (
    echo [ERROR] Failed to create virtual environment
    pause
    exit /b 1
)
echo [OK] Virtual environment created

echo Activating virtual environment...
call venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo [ERROR] Failed to activate virtual environment
    pause
    exit /b 1
)
echo [OK] Virtual environment activated

echo Installing Python dependencies (this may take a few minutes)...
echo Upgrading pip...
python -m pip install --upgrade pip >nul 2>&1
echo Installing packages from requirements.txt...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install Python dependencies
    pause
    exit /b 1
)
echo [OK] Python dependencies installed

REM Check if .env exists
if not exist .env (
    echo Creating .env file from template...
    copy .env.example .env >nul
    echo [OK] .env file created
    echo.
    echo IMPORTANT: Please edit backend\.env with your actual credentials!
    echo.
) else (
    echo .env file already exists
)

echo Verifying PyTorch installation...
python -c "import torch; print('PyTorch version:', torch.__version__)"
if %errorlevel% neq 0 (
    echo [WARNING] PyTorch verification failed, but continuing...
) else (
    echo [OK] PyTorch verified
)

cd ..

REM Setup Frontend
echo.
echo ================================================
echo Setting up Frontend...
echo ================================================
cd frontend

echo Installing npm dependencies (this may take a few minutes)...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install npm dependencies
    pause
    exit /b 1
)
echo [OK] npm dependencies installed

cd ..

REM Setup complete
echo.
echo ================================================
echo [SUCCESS] Setup completed successfully!
echo ================================================
echo.
echo Next steps:
echo   1. Edit backend\.env with your credentials
echo   2. Start the frontend: cd frontend ^&^& npm run dev
echo   3. Open http://localhost:3000 in your browser
echo.
echo For more information, see SETUP.md
echo.
pause
