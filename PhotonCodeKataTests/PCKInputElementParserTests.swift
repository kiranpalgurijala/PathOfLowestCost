//
//  PCKInputElementParserTests.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import XCTest
@testable import PhotonCodeKata
class PCKInputElementParserTests: XCTestCase {
    
    var ipElementParser: InputElementParser!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ipElementParser = InputElementParser()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyInput() {
        let inputX: Array<Array<Int>> = []
        let readX = ipElementParser.parse("")
        XCTAssertEqual(inputX.count, readX.count)
    }
    
    func testForNonNumericInput(){
        let readX = ipElementParser.parse("H")
        XCTAssertEqual(readX[0][0], 0)
    }
    
    func testSingleValue() {
        let readX = ipElementParser.parse("1")
        XCTAssertEqual(readX[0][0],1)
    }
    
    func testSingleRow() {
        let readX = ipElementParser.parse("1 2 3")
        XCTAssertEqual(readX[0][0], 1)
        XCTAssertEqual(readX[0][1], 2)
        XCTAssertEqual(readX[0][2], 3)
    }
    
    func testTwoRows() {
        let readX = ipElementParser.parse("1 2 3\n4 5 6")
        XCTAssertEqual(readX[0][0], 1)
        XCTAssertEqual(readX[0][1], 2)
        XCTAssertEqual(readX[0][2], 3)
        XCTAssertEqual(readX[1][0], 4)
        XCTAssertEqual(readX[1][1], 5)
        XCTAssertEqual(readX[1][2], 6)
    }
    
    func testThreeRows() {
        let readX = ipElementParser.parse("1 2 3\n4 5 6\n7 8 9")
        XCTAssertEqual(readX[0][0], 1)
        XCTAssertEqual(readX[0][1], 2)
        XCTAssertEqual(readX[0][2], 3)
        XCTAssertEqual(readX[1][0], 4)
        XCTAssertEqual(readX[1][1], 5)
        XCTAssertEqual(readX[1][2], 6)
        XCTAssertEqual(readX[2][0], 7)
        XCTAssertEqual(readX[2][1], 8)
        XCTAssertEqual(readX[2][2], 9)
    }
    
    func testSampleNegativeValues() {
        let readX = ipElementParser.parse("1 2 -3\n4 -5 6\n-7 8 9")
        XCTAssertEqual(readX[0][0], 1)
        XCTAssertEqual(readX[0][1], 2)
        XCTAssertEqual(readX[0][2], -3)
        XCTAssertEqual(readX[1][0], 4)
        XCTAssertEqual(readX[1][1], -5)
        XCTAssertEqual(readX[1][2], 6)
        XCTAssertEqual(readX[2][0], -7)
        XCTAssertEqual(readX[2][1], 8)
        XCTAssertEqual(readX[2][2], 9)
    }
}
