@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

git branch --show-current
set GITBRANCH=
for /f %%I in ('git branch --show-current 2^> NUL') do set GITBRANCH=%%I
set "BRANCH=%GITBRANCH:/=_%"

@REM Build and run test
dotnet test -s .\SpecFlow_Example.runsettings
@REM Generate LivingDoc output
livingdoc test-assembly bin\Debug\netcoreapp3.1\SpecFlow_Example.dll -t bin\Debug\netcoreapp3.1\TestExecution.json --output test_results\SpecFlow_Example_LivingDoc_Test_Report__%BRANCH%%mydate%%mytime%.html
