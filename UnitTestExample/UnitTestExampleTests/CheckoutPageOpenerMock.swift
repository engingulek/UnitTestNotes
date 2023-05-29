//
//  CheckoutPageOpenerMock.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation
@testable import UnitTestExample
class CheckoutPageOpenerMock: CheckoutPageOpener {
    private(set) var products: [ProuductForTest]?
    private(set) var finalPrice: Int?

    func openCheckoutPage(forProducts products: [ProuductForTest], finalPrice: Int) {
        self.products = products
        self.finalPrice = finalPrice
    }
}
