@echo off
setlocal

set "run_analyzer=true"
set "run_tests=true"

:loop
if "%~1"=="" goto endloop
if /I "%~1"=="-tests" (
    set "run_analyzer=false"
    shift
    goto loop
)
if /I "%~1"=="-metrics" (
    set "run_tests=false"
    shift
    goto loop
)
echo Unknown flag: %1
echo Usage: run_analysis_and_tests.bat [-tests] [-metrics]
exit /b 1

:endloop
if "%run_analyzer%"=="true" (
    echo Running dart_code_metrics...
    dart run dart_code_metrics:metrics check-unused-files lib
    dart run dart_code_metrics:metrics check-unused-code lib lib/src lib/main.dart
)
if "%run_tests%"=="true" (
    echo Running tests...
    flutter test
)