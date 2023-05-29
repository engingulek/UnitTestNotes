//
//  ViewController.swift
//  UnitTestExample
//
//  Created by engin gülek on 27.05.2023.
//

import UIKit

class ViewController: UIViewController {
    let input = "antoine"
    override func viewDidLoad() {
        super.viewDidLoad()
        print(input.upperCasedFirst())
        
        let ferrari = Car(type: .Sport, transmissionMode: .Drive)
        ferrari.start(minutes: 120)
        print(ferrari.miles)
    }


}

