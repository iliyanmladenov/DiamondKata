//
//  DiamondKataTests.swift
//  DiamondKataTests
//
//  Created by Iliyan Mladenov on 13.10.22.
//

import XCTest
@testable import DiamondKata

class DiamondKataTests: XCTestCase {

    let diamond = DiamondKataViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhiteSpacingWithSingleRow() throws {
        diamond.diamondKata = "A"
        let result = diamond.makeDiamondKata()
        let expectation = " A "
        XCTAssertEqual(result[0], expectation, "Expected \(expectation), received: \(result[0])")
    }

    func testWhiteSpacingWithTwoRows() throws {
        diamond.diamondKata = "B"
        let result = diamond.makeDiamondKata()
        let expectation = " _  A  _ "
        XCTAssertEqual(result[0], expectation, "Expected \(expectation), received: \(result[0])")
    }

    func testWhiteSpacingWithWithThreeRows() throws {
        diamond.diamondKata = "C"
        let result = diamond.makeDiamondKata()
        let expectation = " _  _  A  _  _ "
        XCTAssertEqual(result[0], expectation, "Expected \(expectation), received: \(result[0])")
    }

    func testWhiteSpacingWithWithTenRows() throws {
        diamond.diamondKata = "J"
        let result = diamond.makeDiamondKata()
        let expectation = " _  _  _  _  _  _  _  _  _  A  _  _  _  _  _  _  _  _  _ "

        XCTAssertEqual(result[0], expectation, "Expected \(expectation), received: \(result[0])")
    }

    func testDiamondKataWithOneRows() throws {
        diamond.diamondKata = "A"
        let result = diamond.makeDiamondKata()

        XCTAssertEqual(result[0], " A ", "Expected ' A ', received: \(result[0])")
    }

    func testDiamondKataWithTwoRows() throws {
        diamond.diamondKata = "B"
        let result = diamond.makeDiamondKata()

        XCTAssertEqual(result[0], " _  A  _ ", "Expected ' _  A  _ ', received: \(result[0])")
        XCTAssertEqual(result[1], " B  _  B ", "Expected ' B  _  B ', received: \(result[1])")
        XCTAssertEqual(result[2], " _  A  _ ", "Expected ' _  A  _ ', received: \(result[2])")
    }

    func testDiamondKataWithThreeRows() throws {
        diamond.diamondKata = "C"
        let result = diamond.makeDiamondKata()

        XCTAssertEqual(result[0], " _  _  A  _  _ ", "Expected ' _ _  A  _ _ ', received: \(result[0])")
        XCTAssertEqual(result[1], " _  B  _  B  _ ", "Expected ' _  B  _  B  _ ', received: \(result[1])")
        XCTAssertEqual(result[2], " C  _  _  _  C ", "Expected ' C  _  _  _  C ', received: \(result[2])")
        XCTAssertEqual(result[3], " _  B  _  B  _ ", "Expected ' _  B  _  B  _ ', received: \(result[3])")
        XCTAssertEqual(result[4], " _  _  A  _  _ ", "Expected ' _ _  A  _ _ ', received: \(result[4])")
    }

    func testDiamondKataWithSixRows() throws {
        diamond.diamondKata = "F"
        let result = diamond.makeDiamondKata()

        XCTAssertEqual(result[0], " _  _  _  _  _  A  _  _  _  _  _ ", "Expected ' _  _  _  _  _  A  _  _  _  _  _ ', received: \(result[0])")
        XCTAssertEqual(result[1], " _  _  _  _  B  _  B  _  _  _  _ ", "Expected ' _  _  _  _  B  _  B  _  _  _  _ ', received: \(result[1])")
        XCTAssertEqual(result[2], " _  _  _  C  _  _  _  C  _  _  _ ", "Expected ' _  _  _  C  _  _  _  C  _  _  _ ', received: \(result[2])")
        XCTAssertEqual(result[3], " _  _  D  _  _  _  _  _  D  _  _ ", "Expected ' _  _  D  _  _  _  _  _  D  _  _ ', received: \(result[3])")
        XCTAssertEqual(result[4], " _  E  _  _  _  _  _  _  _  E  _ ", "Expected ' _  E  _  _  _  _  _  _  _  E  _ ', received: \(result[4])")
        XCTAssertEqual(result[5], " F  _  _  _  _  _  _  _  _  _  F ", "Expected ' F  _  _  _  _  _  _  _  _  _  F ', received: \(result[5])")
        XCTAssertEqual(result[6], " _  E  _  _  _  _  _  _  _  E  _ ", "Expected ' _  E  _  _  _  _  _  _  _  E  _ ', received: \(result[6])")
        XCTAssertEqual(result[7], " _  _  D  _  _  _  _  _  D  _  _ ", "Expected ' _  _  D  _  _  _  _  _  D  _  _ ', received: \(result[7])")
        XCTAssertEqual(result[8], " _  _  _  C  _  _  _  C  _  _  _ ", "Expected ' _  _  _  C  _  _  _  C  _  _  _ ', received: \(result[8])")
        XCTAssertEqual(result[9], " _  _  _  _  B  _  B  _  _  _  _ ", "Expected ' _  _  _  _  B  _  B  _  _  _  _ ', received: \(result[9])")
        XCTAssertEqual(result[10], " _  _  _  _  _  A  _  _  _  _  _ ", "Expected ' _  _  _  _  _  A  _  _  _  _  _ ', received: \(result[10])")
    }

    func testDiamondKataWithSymbol() throws {
        diamond.diamondKata = "$"
        let result = diamond.makeDiamondKata()

        XCTAssert(result.isEmpty, "Expected 'true', received: \(result.isEmpty)")
    }

    func testDiamondKataWithDigit() throws {
        diamond.diamondKata = "2"
        let result = diamond.makeDiamondKata()

        XCTAssert(result.isEmpty, "Expected 'true', received: \(result.isEmpty)")
    }

    func testDiamondKataWithSeveralLetters() throws {
        diamond.diamondKata = "AB"
        let result = diamond.makeDiamondKata()

        XCTAssert(result.isEmpty, "Expected 'true', received: \(result.isEmpty)")
    }

    func testDiamondKataWithMixedInput() throws {
        diamond.diamondKata = "A#4."
        let result = diamond.makeDiamondKata()

        XCTAssert(result.isEmpty, "Expected 'true', received: \(result.isEmpty)")
    }

    func testContentPreview() throws {
        let result = ContentView_Previews.previews is DiamondKataView
        XCTAssert(result, "Expected 'true', received: \(result)")
    }
}
