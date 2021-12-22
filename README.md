# SpecFlow_Example

This Specflow example shows the following Gherkin features:

- Background
- Given, When, Then, And
- Scenario and Scenario Outline + Examples
- tags

"SpecFlow" documentation is available on: https://docs.specflow.org/projects/specflow/en/latest/index.html

## Feature files

### CheckLocation.feature
This feature contains Gherkin Scenarios and Scenario Outlines and is compatible with other test frameworks that implement the Gherkin syntax.
For example Cucumber and Behave. See https://github.com/Gerard-A/Behave_example for a Python Behave project, that uses the same feature file.

### BackgroundExample.feature
This feature contains an example of a feature that uses a Background.
The Background contains common steps that will be executed before every Scenario


## Test execution

Prerequisites: 
- 

To run the tests execute commands:  
- `runTest.bat`  to run all tests
- `runSmokeTest.bat` to run all test cases that are tagged with '@SmokeTest'
- `runNightTest.bat` to run all test cases that are tagged with '@NightTest'
