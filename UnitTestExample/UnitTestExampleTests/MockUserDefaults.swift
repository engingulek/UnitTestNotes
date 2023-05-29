//
//  MockUserDefaults.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation

class MockUserDefaults : UserDefaults {
    var gameStyleChanged = 0
    override func set(_ value:Int,forKey defaultName :String){
        if defaultName == "gameStyle"{
            gameStyleChanged += 1
        }
    }
}
