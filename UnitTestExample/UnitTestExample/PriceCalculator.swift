//
//  PriceCalculator.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation

class ProuductForTest {
    var name :String
    var cost : Int
    
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}

class PriceCalculator {
    static func calculateFinalPrice(for products: [ProuductForTest],
                                    applying coupon: Coupon?) -> Int {
        var finalPrice = products.reduce( 0) { price, product in
            return price + product.cost
        }

        if let coupon = coupon {
            let multiplier = coupon.discountPercentage / 100
            let discount = Double(finalPrice) * Double(multiplier)
            finalPrice -= Int(discount)
        }

        return finalPrice
    }
}
