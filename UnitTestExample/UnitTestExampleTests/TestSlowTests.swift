//
//  TestSlowTests.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class TestSlowTests: XCTestCase {

    var sut : URLSession!
    let networkMonitor = NetworkMonitor.shared
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
    
       let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)!
        let promise = expectation(description: "Status code: 200")
        let dataTask = sut.dataTask(with: url){_,response,error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                     return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                }else{
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
    
    
    func testApiCallCompletes() throws {
        try XCTSkipUnless(networkMonitor.isConnected,"Network connectivitu needed for this test")
        let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode : Int?
        var responseError : Error?
        
        let dataTask = sut.dataTask(with: url){_,response,error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
         XCTAssertEqual(statusCode, 200)
        
    }
    // Ancak internet bağlantısı olmadığı zaman yukarıdaki test çalıştırısaydı ne olacaktı. 200 kodunu vermeyecekti.
    // Bu durumlar için XCTSkip  bulunmaktadır.

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
