//
//  EmpireMobileAppUITests.swift
//  EmpireMobileAppUITests
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest

class EmpireMobileAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNavigationTitleExists() {
        app.launch()
        XCTAssertTrue(app.navigationBars.staticTexts["LAST TRIPS"].exists)
    }
    
    func testWhenTappingOnCellNavigatesToDetail() {
        app.launch()
        app.tables.cells.firstMatch.tap()
        XCTAssertTrue(app.staticTexts["Departure"].exists)
        XCTAssertTrue(app.staticTexts["Arrival"].exists)
        XCTAssertTrue(app.staticTexts["Trip Distance"].exists)
        XCTAssertTrue(app.staticTexts["Trip Duration"].exists)
        XCTAssertTrue(app.staticTexts["Pilot Rating"].exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
