//
//  PCKMatrixTests.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import XCTest
@testable import PhotonCodeKata

class PCKMatrixTests: XCTestCase {
    let m = Matrix([[1,2,3],[4,5,6],[7,8,9]])
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRowColumnCount() {
        let readX = Matrix([[1,2,3],[4,5,6]])
        XCTAssertEqual(2, readX.rows)
        XCTAssertEqual(3, readX.columns)
    }
    
    func testInitAndGetValid() {
        XCTAssertEqual(1, m.get((1,1)))
        XCTAssertEqual(2, m.get((1,2)))
        XCTAssertEqual(3, m.get((1,3)))
        XCTAssertEqual(4, m.get((2,1)))
        XCTAssertEqual(5, m.get((2,2)))
        XCTAssertEqual(6, m.get((2,3)))
        XCTAssertEqual(7, m.get((3,1)))
        XCTAssertEqual(8, m.get((3,2)))
        XCTAssertEqual(9, m.get((3,3)))
    }

    
}
