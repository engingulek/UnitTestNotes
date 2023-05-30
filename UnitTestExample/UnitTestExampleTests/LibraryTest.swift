//
//  LibraryTest.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 30.05.2023.
//

import XCTest
@testable import UnitTestExample
final class LibraryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testQueryingBooksByAuthor(){
        var library = [Book]()
        let books = makeBooks(withAuthor: "Engin Gülek", count: 3)
        library = books
        let booksByAuthor = library.contains { $0.author == "Engin Gülek"}
        XCTAssertTrue(booksByAuthor )
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


extension LibraryTest {
    func makeBooks(withAuthor  author : String,
                   count:Int)->[Book]{
        return (0..<count).map { index in
            Book(id: index,
                 name: "Book\(index)",
                 genres: [],
                 author: author,
                 chapters: [])
        }
    }
}
