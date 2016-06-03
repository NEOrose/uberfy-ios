//
//  UberfyCoreLibraryTests.swift
//  UberfyCoreLibraryTests
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import XCTest
@testable import UberfyCoreLibrary

class UberfyCoreLibraryTests: XCTestCase {
    
    private var _productRepository : ProductRepository!
    private var startLocation, endLocation : Location!
    
    override func setUp() {
        super.setUp()
        _productRepository = ProductRepositoryImpl()
        startLocation = Location(latitude: -22.951243, longitude: -43.180933)
        endLocation = Location(latitude: -22.901496, longitude: -43.288348)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let readyExpectation = expectationWithDescription("ready")
        _productRepository.getEstimateFromLocation(startLocation,
                                                   endLocation: endLocation) { uberProducts in
                                                    print(uberProducts)
                                                    readyExpectation.fulfill()
        }
        
        // Loop until the expectation is fulfilled
        waitForExpectationsWithTimeout(10, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
