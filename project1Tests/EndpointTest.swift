//
//  EndpointTest.swift
//  project1Tests
//
//  Created by Michał Kaliniak on 11/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import XCTest
@testable import project1

class EndpointTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let output = Github.read.pathWithInfo("weirdString")
        XCTAssertEqual(output, "https://weirdString.tumblr.com/api/read/json", "Endpoint return wrong url string")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
