//
//  ElmTaslTests.swift
//  ElmTaslTests
//
//  Created by R on 28/04/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import XCTest
@testable import ElmTasl

class ElmTaslTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {

    }

    func testConverter() {
        
        XCTAssertEqual(BViewController().formated(string: "07:05:45 pm"), "19:05:45")
        XCTAssertEqual(BViewController().formated(string: "12:00:00AM"), "00:00:00")
        //if there no space befor am/pm
        XCTAssertEqual(BViewController().formated(string: "07:05:45pm"), "19:05:45")
        XCTAssertEqual(BViewController().formated(string: "12:00:00AM"), "00:00:00")


    }
    
    func testapi() {

        getApi().ApiData{data in
            XCTAssertNil(data)
            XCTAssertEqual(data[0].user.name, "Nicholas Kampouris")
            XCTAssertEqual(data[0].categories[0].title, "Nature")
            XCTAssertEqual(data[0].urls.regular, "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=1881cd689e10e5dca28839e68678f432")
        }

    }

    


    

}
