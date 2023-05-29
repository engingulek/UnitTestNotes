//
//  Coupon.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation

class Coupon {
    let code : String
    let discountPercentage: Int
    
    init(code: String, discountPercentage: Int) {
        self.code = code
        self.discountPercentage = discountPercentage
    }
}
