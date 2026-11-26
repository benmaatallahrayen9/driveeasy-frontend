@echo off
setlocal
cd /d "%~dp0"
set "NODE_VERSION=22.22.3"
set "NODE_HOME=%~dp0.runtime\node-v%NODE_VERSION%-win-x64"
set "NODE_ZIP=%TEMP%\driveeasy-node-v%NODE_VERSION%-win-x64.zip"
if not exist "%NODE_HOME%\node.exe" (
  if not exist "%~dp0.runtime" mkdir "%~dp0.runtime"
  echo Downloading portable Node.js %NODE_VERSION% locally...
  curl.exe -fL --retry 2 -o "%NODE_ZIP%" "https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-win-x64.zip"
  if errorlevel 1 goto :node_download_failed
  powershell.exe -NoProfile -Command "Expand-Archive -LiteralPath '%NODE_ZIP%' -DestinationPath '%~dp0.runtime' -Force"
  if errorlevel 1 goto :node_extract_failed
  del "%NODE_ZIP%" >nul 2>nul
)
set "PATH=%NODE_HOME%;%PATH%"
set "npm_config_cache=%~dp0.npm-cache"
node --version
if errorlevel 1 goto :node_missing
curl.exe -fsS --max-time 2 http://localhost:4200/ >nul 2>nul
if not errorlevel 1 (
  echo Angular is already running.
  echo Local: http://localhost:4200/
  goto :end
)
if not exist "node_modules\@angular\cli\bin\ng.js" (
  echo Installing Angular dependencies...
  npm install
  if errorlevel 1 goto :install_failed
)
npm start
goto :end
:node_missing
echo Could not start Node.js. Close this window and try again.
exit /b 1
:node_download_failed
echo Node.js download failed. Check your internet connection and try again.
exit /b 1
:node_extract_failed
echo Node.js extraction failed. Remove frontend\.runtime and try again.
exit /b 1
:install_failed
echo npm install failed. Check your network connection and npm output above.
exit /b 1
:end
endlocal
