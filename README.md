# EmpireMobileApp

A simple app that shows the last trips of stormtroopers and its details.

### Prerequisites

Having XCode 11.1 and Cocoapods.

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

### Comments
There are some compromises I had to do in order to go faster.
for example the Detail screen should be separated in more components as the constraints can get a bit messy.
Also the TripDetailViewModel could be improved by creating a model to pass to the view, so all those properties can be avoided.
