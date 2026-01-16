# StocBot

## Virtual environment setup

To create a Windows virtual environment, install packages and ensure `pyside6` is present in `requirements.txt`, run the provided script from the repository root:

```bat
create_venv_and_install_requirements.bat
```

You can optionally provide a venv directory name:

```bat
create_venv_and_install_requirements.bat myenv
```

What the script does:
- Creates a virtual environment (default `venv` or the name you pass)
- Activates the venv and upgrades `pip`
- Ensures `pyside6` is present in `requirements.txt` (creates the file if missing)
- Installs packages from `requirements.txt`
- Freezes installed package versions back to `requirements.txt`

Notes:
- Run the script in PowerShell or Command Prompt from the repository root on Windows.
- Ensure `python` is on your PATH.
# StocBot