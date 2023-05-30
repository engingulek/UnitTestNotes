//
//  Book.swift
//  UnitTestExample
//
//  Created by engin gülek on 30.05.2023.
//

import Foundation

struct Book: Codable{
  
    
    let id: Int
    var name: String
    var genres: [String]
    var author: String
    var chapters: [String]
}
