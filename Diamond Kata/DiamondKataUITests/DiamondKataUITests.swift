//
//  DiamondKataUITests.swift
//  DiamondKataUITests
//
//  Created by Iliyan Mladenov on 13.10.22.
//

import XCTest

class DiamondKataUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateUIKataWithOneRow() throws {
        let textField = app.textFields["Please input character"]
        textField.tap()
        textField.typeText("A")
        app.buttons["Make diamond kata"].tap()

        XCTAssertEqual(app.staticTexts.firstMatch.label, " A ")
    }

    func testCreateUIKataWithTwoRows() throws {
        let textField = app.textFields["Please input character"]
        textField.tap()
        textField.typeText("B")
        app.buttons["Make diamond kata"].tap()

        let expectation = " _  A  _ \n B  _  B \n _  A  _ \n"
        XCTAssertEqual(app.staticTexts.firstMatch.label, expectation)
    }

    func testCreateUIKataWithThreeRows() throws {
        let textField = app.textFields["Please input character"]
        textField.tap()
        textField.typeText("C")
        app.buttons["Make diamond kata"].tap()

        let expectation = " _  _  A  _  _ \n _  B  _  B  _ \n C  _  _  _  C \n _  B  _  B  _ \n _  _  A  _  _ \n"
        XCTAssertEqual(app.staticTexts.firstMatch.label, expectation)
    }
}
