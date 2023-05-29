//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by engin gülek on 27.05.2023.
//

import XCTest

final class UnitTestExampleUITests: XCTestCase {
    var app : XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        
    }

    
    func testGameStyleSwitch() throws {
        let app = XCUIApplication()
        let slideButton = app.segmentedControls.buttons["Slide"]
        let typeButton = app.segmentedControls.buttons["Type"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]
        let typeLabel = app.staticTexts["Guess where the slider is: "]
        
        if slideButton.isSelected {
          XCTAssertTrue(slideLabel.exists)
          XCTAssertFalse(typeLabel.exists)

          typeButton.tap()
          XCTAssertTrue(typeLabel.exists)
          XCTAssertFalse(slideLabel.exists)
        } else if typeButton.isSelected {
          XCTAssertTrue(typeLabel.exists)
          XCTAssertFalse(slideLabel.exists)

          slideButton.tap()
          XCTAssertTrue(slideLabel.exists)
          XCTAssertFalse(typeLabel.exists)
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
