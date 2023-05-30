//
//  RecommendedItems.swift
//  UnitTestExample
//
//  Created by engin gülek on 30.05.2023.
//

import Foundation

// Kullanıcının newspaper seçtiğinde hiç bir şekilde önerilenlerde bir verinin gösterilmediği ortay çıktı.
// Bu hatanın aşağıdaki koddan kaynaklı olduğu anlaşıldı

struct RecommendedItems {
    var books = [Item]()
    var magazines = [Item]()
    var newspapers = [Item]()

    /*func items(ofKind kind: Item.Kind) -> [Item] {
        if kind == .book {
            return books
        } else {
            return magazines
        }
    }*/
    func items(ofKind kind: Item.Kind) -> [Item] {
        switch kind {
        case .book: return books
        case .magazine: return magazines
        case .newspaper: return newspapers
        }
    }
}

// elbette bunu kod üzerinden düzelte biliriz. Ancak ileride işlerin devam etmesi için buraya test eklemek adına iyi bir fırsat
// -> RecommendedItemsTests
