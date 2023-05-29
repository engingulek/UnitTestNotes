//
//  TestTwo.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class TestTwo: XCTestCase {
    var sut : ViewController!
    override func setUpWithError() throws {
      try  super.setUpWithError()
        sut  = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

  
    func testScoreIsComoutedWhenGuessIsHigherThanTarget(){
        
        let guess = sut.targetValue -  5
        sut.check(guess: guess)
        XCTAssertEqual(sut.scoreRounded, 105,"Score computed from guess is wrong")
        
    }
   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
