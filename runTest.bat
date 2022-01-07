@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

@REM Prepare environment
dotnet new tool-manifest --force
dotnet tool install --local SpecFlow.Plus.LivingDoc.CLI --version 3.9.57

@REM Build and run test
dotnet test -s .\SpecFlow_Example.runsettings

@REM Generate LivingDoc output
dotnet livingdoc test-assembly bin\Debug\netcoreapp3.1\SpecFlow_Example.dll -t bin\Debug\netcoreapp3.1\TestExecution.json --output test_results\SpecFlow_Example_LivingDoc_Test_Report%mydate%%mytime%.html
