//
//  TestThree.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class TestThree: XCTestCase {
    var sut : ViewController!
    var mockUserDefaults : MockUserDefaults!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController() as? ViewController
        mockUserDefaults = MockUserDefaults(suiteName: "testing")
        sut.defautls = mockUserDefaults
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockUserDefaults = nil
        try super.tearDownWithError()
    }
    
    // Alınan documentte viewController içeriği bilinmediği için yorum satırı içerisinde yazıldı
    /*
     func testGameStyleCanBeChanged() {
       // given
       let segmentedControl = UISegmentedControl()

       // when
       XCTAssertEqual(
         mockUserDefaults.gameStyleChanged,
         0,
         "gameStyleChanged should be 0 before sendActions")
       segmentedControl.addTarget(
         sut,
         action: #selector(ViewController.chooseGameStyle(_:)),
         for: .valueChanged)
       segmentedControl.sendActions(for: .valueChanged)

       // then
       XCTAssertEqual(
         mockUserDefaults.gameStyleChanged,
         1,
         "gameStyle user default wasn't changed")
     }
     */

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
