//
//  Extension.swift
//  UnitTestExample
//
//  Created by engin gülek on 27.05.2023.
//

import Foundation

extension String {
    func upperCasedFirst() -> String {
        let firstCharacter = prefix(1).capitalized
                let remainingCharacters = dropFirst().lowercased()
                return firstCharacter + remainingCharacters

    }
    
}
