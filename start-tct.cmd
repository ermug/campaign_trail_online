@echo off
rem start-tct.cmd — simple helper to start a local server for the offline TCT site
rem Place this file in the parent folder that contains the offline site folder

setlocal enabledelayedexpansion

rem --- Configuration ---
set OFFLINE_FOLDER=campaign-trail-showcase.github.io-offline
set PORT=8000

rem Determine script directory and change to offline folder
pushd "%~dp0%OFFLINE_FOLDER%" 2>nul || (
  echo ERROR: Offline folder "%OFFLINE_FOLDER%" not found in "%~dp0"
  echo Make sure this script is placed alongside the offline folder, or edit OFFLINE_FOLDER.
  pause
  exit /b 1
)

echo Starting Campaign Trail (offline) from: %CD%
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
echo OR run a server manually from the offline site folder.
popd
pause
exit /b 1

:cleanup
echo.
echo Server stopped. Cleaning up...
popd
timeout /t 2 /nobreak
exit /b 0
