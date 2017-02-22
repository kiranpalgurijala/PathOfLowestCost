//
//  PhotonCodeKataTests.swift
//  PhotonCodeKataTests
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import XCTest
@testable import PhotonCodeKata

class PhotonCodeKataTests: XCTestCase {
    var lcPathFinder: LowCostPathFinder!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        lcPathFinder = LowCostPathFinder()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForEmptyInputReturnNil() {
        let (success, resistance, path) = lcPathFinder.findPath([])
        XCTAssertFalse(success)
        XCTAssertEqual(0, resistance)
        XCTAssertEqual([], path)
    }
    
    func testForSingleRowSingleColumnInput() {
        let (success, resistance, path) = lcPathFinder.findPath([[4]])
        XCTAssertTrue(success)
        XCTAssertEqual(4, resistance)
        XCTAssertEqual([1], path)
    }
    
    func testForSingleRowSingleColumnInput2() {
        let (success, resistance, path) = lcPathFinder.findPath([[8]])
        XCTAssertTrue(success)
        XCTAssertEqual(8, resistance)
        XCTAssertEqual([1], path)
    }
    
    func testForSingleRowMultipleColumnInput() {
        let (success, resistance, path) = lcPathFinder.findPath([[1,2,3,4]])
        XCTAssertTrue(success)
        XCTAssertEqual(10, resistance)
        XCTAssertEqual([1,1,1,1], path)
    }
    
    func testSampleOne() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,8,6,4]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(16, resistance)
        XCTAssertEqual([1,2,3,4,4,5], path)
    }

    func testSampleTwo() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,1,2,3]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(11, resistance)
        XCTAssertEqual([1,2,1,5,4,5], path)
    }
    
    func testSampleThree() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [19,10,19,10,19],
            [21,23,20,19,12],
            [20,12,20,11,10]
            ])
        XCTAssertFalse(success)
        XCTAssertEqual(48, resistance)
        XCTAssertEqual([1,1,1], path)
    }

    func testSampleStartMoreThan50() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [69,10,19,10,19],
            [51,23,20,19,12],
            [60,12,20,11,10]
            ])
        XCTAssertFalse(success)
        XCTAssertEqual(0, resistance)
        XCTAssertEqual([], path)
    }
    func testSampleOneValueMoreThan50() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [60,3,3,6],
            [6,3,7,9],
            [5,6,8,3]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(14, resistance)
        XCTAssertEqual([3,2,1,3], path)
    }
    func testSampleNegativeValues() {
        let (success, resistance, path) = lcPathFinder.findPath([
            [6,3,-5,9],
            [-5,2,4,10],
            [3,-2,6,10],
            [6,-1,-2,10]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(0, resistance)
        XCTAssertEqual([2,3,4,1], path)
    }
}
