# EmpireMobileApp

A simple app that shows the last trips of stormtroopers and its details.

### Prerequisites

Having XCode 11.1 and cocoapods.

### Installing

Install pods using the following command

```
pod install
```

## Tests

Unit tests for viewModels. Didn't test the coordinator as it's implementation is simple. It only acts as a bridge for navigation.

Basic view navigation was tested using UITests.
Missing tests for Data layer as didn't have time to implement it.

All interfaces are mocked using SwiftyMocky.

### Architechture

For this project I used a simple MVVM + Coordinator architecture as I think is simple and flexible and separates responsibilities correctly.


