//
//  Item.swift
//  UnitTestExample
//
//  Created by engin gülek on 30.05.2023.
//

import Foundation

class Item:Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return true
    }
    
    let id : String
    let name : String
    let kind : Kind
    
    init(id: String, name: String, kind: Kind) {
        self.id = id
        self.name = name
        self.kind = kind
    }
}


extension Item.Kind: CaseIterable {}

extension Item {
    static func stub(ofKind kind: Kind, id: String) -> Item {
        return Item(id: id, name: "\(kind)-\(id)", kind: kind)
    }
}
extension Item {
    enum Kind {
        case book
        case magazine
        case newspaper
    }
}
