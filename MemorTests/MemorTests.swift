//
//  MemorTests.swift
//  MemorTests
//
//  Created by Admin on 19.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import XCTest
@testable import Memor

class MemorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLevels() {
            var level = Level(val: 4)
            XCTAssertEqual(level.size, 3)
            XCTAssertEqual(level.askCount, 2)
            XCTAssertEqual(level.seconds, 3.0)
        
            level = Level(val: 100)
            XCTAssertEqual(level.size, 27)
            XCTAssertEqual(level.askCount, 26)
            XCTAssertEqual(level.seconds, 27.0)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
