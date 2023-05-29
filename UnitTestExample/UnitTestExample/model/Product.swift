//
//  Product.swift
//  UnitTestExample
//
//  Created by engin gülek on 27.05.2023.
//

import Foundation

struct Product  : Codable{
    var id:Int?
    var  title:String?
    var  price:String?
    var  description: String?
    var  category:String?
    var   image:String
    var   rating : Rating?
      
    
}

struct Rating : Codable {
   var rate:Double?
    var count : Int?
    
}
