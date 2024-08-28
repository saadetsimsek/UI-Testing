//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Saadet Şimşek on 26/08/2024.
//

import XCTest

final class TestingUITests: XCTestCase {

    override func setUpWithError() throws {
  
        continueAfterFailure = false

    }


    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let title = app.staticTexts["Log in"]
        XCTAssertTrue(title.exists)
        
        let usernameField = app.textFields["Username"]
        XCTAssertTrue(usernameField.exists)
        
        usernameField.tap()
        usernameField.typeText("Saadet")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        let button = app.buttons["Continue"]
        XCTAssertTrue(button.exists)
        button.tap()
       // app.buttons["Continue"].tap()
        
        let accountLabel = app.staticTexts["Welcome Saadet"]
        XCTAssertTrue(accountLabel.exists)
        
        
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
