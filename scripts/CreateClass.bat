@echo off
REM CreateClass.bat

set "scriptDir=%~dp0\.."

:processArg
if "%1" neq "" (
    set "className=%1"
    call :createClassFiles
) else (
    echo.
    echo Usage : CC.bat ^<name^>
    echo Creates a cpp and h file in the include and src dir for provided name.
    echo.
    echo Error : Please provide a class name.
)

exit /b

:createClassFiles
echo Creating files for class: %className%
if not exist "%scriptDir%\include" mkdir "%scriptDir%\include"
if not exist "%scriptDir%\src" mkdir "%scriptDir%\src"

echo. > "%scriptDir%\include\%className%.h"
echo #pragma once >> "%scriptDir%\include\%className%.h"
echo. >> "%scriptDir%\include\%className%.h"
echo class %className% { >> "%scriptDir%\include\%className%.h"
echo public: >> "%scriptDir%\include\%className%.h"
echo     %className%(); >> "%scriptDir%\include\%className%.h"
echo     ~%className%(); >> "%scriptDir%\include\%className%.h"
echo }; >> "%scriptDir%\include\%className%.h"

echo. > "%scriptDir%\src\%className%.cpp"
echo #include "%className%.h" >> "%scriptDir%\src\%className%.cpp"
echo. >> "%scriptDir%\src\%className%.cpp"
echo %className%::%className%() { >> "%scriptDir%\src\%className%.cpp"
echo     // Constructor implementation >> "%scriptDir%\src\%className%.cpp"
echo } >> "%scriptDir%\src\%className%.cpp"

echo %className%::~%className%() { >> "%scriptDir%\src\%className%.cpp"
echo     // Destructor implementation >> "%scriptDir%\src\%className%.cpp"
echo } >> "%scriptDir%\src\%className%.cpp"

echo Files created for class: %className%
exit /b