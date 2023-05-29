//
//  CarTest.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class CarTest: XCTestCase {

    var ferrari:Car!
      var jeep:Car!
      var honda:Car!
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        ferrari = Car(type: .Sport, transmissionMode: .Drive)
         jeep = Car(type: .OffRoad, transmissionMode: .Drive)
         honda = Car(type: .Economy, transmissionMode: .Park)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        ferrari = nil
         jeep = nil
         honda = nil
    }
    
    func testSportFasterThanJeep(){
        let minutes = 60
          //1 start ferrari
          ferrari.start(minutes: minutes)
          //2 start jeep
          jeep.start(minutes: minutes)
          //Test it
          XCTAssertTrue(ferrari.miles > jeep.miles)
    }

   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
