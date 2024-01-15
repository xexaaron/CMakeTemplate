@echo off

set "scriptDir=%~dp0"

set "projName=CMakeTemplate"


REM Set default build configuration to Release
set "buildConfig=Release"

if "%~1" == "-r" (
    set "buildConfig=Release"
) else if "%~1" == "-d" (
    set "buildConfig=Debug"
) else (
    echo.
    echo Usage : Build.bat ^< -r ^| -d ^> 
    echo Error : Specify build type 
    exit
) 

echo.
echo Building Executable: %projName% [%buildConfig%]
echo.

cmake -S . -B build -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=%buildConfig%
cmake --build build --config %buildConfig%

REM Determine post-build state
if %errorlevel% equ 0 (
    echo.
    echo Build successful
    move /Y "%scriptDir%\..\build\%buildConfig%\%projName%.exe" "%scriptDir%\.." >nul
) else (
    echo Build failed!
    exit /b %errorlevel%
)