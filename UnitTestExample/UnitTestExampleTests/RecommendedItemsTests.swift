//
//  RecommendedItemsTests.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 30.05.2023.
//

import XCTest
@testable import UnitTestExample
final class RecommendedItemsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRecommendedNewspapers(){
        let item = Item(id: "nytimes",
                        name: "The New Yor Times",
                        kind: .newspaper)
        
        
        let recommended = RecommendedItems(newspapers: [item])
        
        XCTAssertEqual(
                   recommended.items(ofKind: .newspaper),
                   [item])
    }
    
    
    func testItemsForAllKinds(){
        let book = Item.stub(ofKind: .book, id: "book")
               let magazine = Item.stub(ofKind: .magazine, id: "magazine")
               let newspaper = Item.stub(ofKind: .newspaper, id: "newspaper")
        
        let recommended = RecommendedItems(
                  books: [book],
                  magazines: [magazine],
                  newspapers: [newspaper]
              )
        
        for kind in Item.Kind.allCases {
                  let items = recommended.items(ofKind: kind)

                  switch kind {
                  case .book:
                      XCTAssertEqual(items, [book])
                  case .magazine:
                      XCTAssertEqual(items, [magazine])
                  case .newspaper:
                      XCTAssertEqual(items, [newspaper])
                  }
              }
    }

  
   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
