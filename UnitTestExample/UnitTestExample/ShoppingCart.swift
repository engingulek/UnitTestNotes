//
//  ShoppingCart.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation
protocol CheckoutPageOpener {
    func openCheckoutPage(forProducts products: [ProuductForTest],
                          finalPrice: Int)
}

class ShoppingCart {
 

    private var products = [ProuductForTest]()
    private var coupon: Coupon?
    
    private let checkoutPageOpener : CheckoutPageOpener
    init(checkoutPageOpener: CheckoutPageOpener) {
 
        self.checkoutPageOpener = checkoutPageOpener
    }

    func add(_ product: ProuductForTest) {
        products.append(product)
    }

    func apply(_ coupon: Coupon) {
        self.coupon = coupon
    }

    func startCheckout() {
        var finalPrice = products.reduce(0) { price, product in
            return price + product.cost
        }
        
        checkoutPageOpener.openCheckoutPage(forProducts: products, finalPrice: finalPrice)

        if let coupon = coupon {
            let multiplier = coupon.discountPercentage / 100
            let discount = Double(finalPrice) * Double(multiplier)
            finalPrice -= Int(discount)
        }

       
    }
}
