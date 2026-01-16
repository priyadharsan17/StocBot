@echo off
REM Creates a virtual environment, ensures pyside6 is in requirements.txt,
REM installs from requirements.txt and freezes pinned versions.

if "%~1"=="" (
  set "VENV_DIR=venv"
) else (
  set "VENV_DIR=%~1"
)

python -m venv "%VENV_DIR%"
if errorlevel 1 (
  echo Failed to create virtual environment. Ensure Python is installed and on PATH.
  exit /b 1
)

call "%VENV_DIR%\Scripts\activate.bat"
if errorlevel 1 (
  echo Failed to activate virtual environment.
  exit /b 1
)

python -m pip install --upgrade pip
if errorlevel 1 (
  echo Failed to upgrade pip.
  exit /b 1
)

REM Ensure requirements.txt exists and contains pyside6
if not exist requirements.txt (
  echo pyside6>requirements.txt
) else (
  findstr /R /C:"^pyside6" requirements.txt >nul 2>&1
  if errorlevel 1 (
    echo pyside6>>requirements.txt
  )
)

pip install -r requirements.txt
if errorlevel 1 (
  echo Failed to install packages from requirements.txt
  exit /b 1
)

pip freeze > requirements.txt
if errorlevel 1 (
  echo Failed to write requirements.txt.
  exit /b 1
)

echo Installed packages and updated requirements.txt
exit /b 0
