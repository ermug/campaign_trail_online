@echo off
rem start-cts-main.cmd — helper to start a local server for the main CTS website
rem Place this file in the parent folder that contains the main CTS folder

setlocal enabledelayedexpansion

rem --- Configuration ---
set MAIN_FOLDER=campaign-trail-showcase.github.io-main
set PORT=8001

rem Determine script directory and change to main folder
pushd "%~dp0%MAIN_FOLDER%" 2>nul || (
  echo ERROR: Main folder "%MAIN_FOLDER%" not found in "%~dp0"
  echo Make sure this script is placed alongside the backups folder, or edit MAIN_FOLDER.
  pause
  exit /b 1
)

echo Starting Campaign Trail Showcase (main) from: %CD%
echo Opening browser at http://localhost:%PORT% ...

rem Open default browser first (may load before server; refresh if needed)
start "" "http://localhost:%PORT%"

rem Try Python (py -3, py, python) then fall back to npx http-server
echo Checking for Python...
where py >nul 2>nul
if %errorlevel%==0 (
  echo Using `py` to host files on port %PORT% ...
  echo.
  echo ============================================
  echo Server is running. To stop the server:
  echo   Option 1: Press Ctrl+C in this window
  echo   Option 2: Close this window
  echo ============================================
  echo.
  py -3 -m http.server %PORT%
  if errorlevel 1 (
    rem fallback to py -m http.server (some systems)
    py -m http.server %PORT%
  )
  goto :cleanup
)

where python >nul 2>nul
if %errorlevel%==0 (
  echo Using `python` to host files on port %PORT% ...
  echo.
  echo ============================================
  echo Server is running. To stop the server:
  echo   Option 1: Press Ctrl+C in this window
  echo   Option 2: Close this window
  echo ============================================
  echo.
  python -m http.server %PORT%
  goto :cleanup
)

rem If Python not found, try npx http-server (Node.js present)
where npx >nul 2>nul
if %errorlevel%==0 (
  echo Python not found; using npx http-server (requires Node.js) on port %PORT% ...
  echo.
  echo ============================================
  echo Server is running. To stop the server:
  echo   Option 1: Press Ctrl+C in this window
  echo   Option 2: Close this window
  echo ============================================
  echo.
  npx http-server -p %PORT%
  goto :cleanup
)

echo ERROR: No supported server runtime found.
echo Please install one of the following and re-run this script:
echo  - Python 3 (so `py -3 -m http.server` or `python -m http.server` works)
echo  - Node.js (so `npx http-server` is available)
echo OR run a server manually from the main CTS folder.
popd
pause
exit /b 1

:cleanup
echo.
echo Server stopped. Cleaning up...
popd
timeout /t 2 /nobreak
exit /b 0
