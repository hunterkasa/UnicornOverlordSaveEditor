@echo off
cd /d "%~dp0"

if not exist "publish\UnicornOverlord.exe" (
    echo First-time setup: Building Save Editor...
    dotnet publish UnicornOverlord\UnicornOverlord.csproj -c Release -o .\publish
    if errorlevel 1 (
        echo [ERROR] Build failed. Please ensure .NET 9 SDK is installed.
        pause
        exit /b 1
    )
)

cd publish
start "" "UnicornOverlord.exe"
