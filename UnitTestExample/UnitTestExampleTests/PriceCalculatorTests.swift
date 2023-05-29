//
//  PriceCalculatorTests.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class PriceCalculatorTests: XCTestCase {
    var products : [ProuductForTest]!
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        products = nil
        try super.tearDownWithError()
    }
    
    func testCalculatingFinalPriceWithoutCoupon(){
        products = [
        ProuductForTest(name: "A", cost: 30),
        ProuductForTest(name: "B", cost: 80)
        ]
        let price = PriceCalculator.calculateFinalPrice(for: products, applying: nil)
        
        XCTAssertEqual(price, 110)
    }
    

    func testCalculatingFinalPriceWithCoupon() {
             products = [
                ProuductForTest(name: "A", cost: 30),
                ProuductForTest(name: "B", cost: 80)
            ]

            let coupon = Coupon(
                code: "swiftbysundell",
                discountPercentage: 30
            )

            let price = PriceCalculator.calculateFinalPrice(
                for: products,
                applying: coupon
            )

            XCTAssertEqual(price, 77)
        }
    
    func testStartingCheckoutOpensCheckoutPage() {
          // Given
          let opener = CheckoutPageOpenerMock()
        let cart = ShoppingCart(checkoutPageOpener: opener)
          let product = ProuductForTest(name: "Product", cost: 50)
          let coupon = Coupon(code: "Coupon", discountPercentage: 20)

          // When
          cart.add(product)
          cart.apply(coupon)
          cart.startCheckout()

          // Then
          //XCTAssertEqual(opener.products, [product],"")
          XCTAssertEqual(opener.finalPrice, 50)
      }
    


   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
