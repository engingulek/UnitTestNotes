//
//  MockedTracker.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 28.05.2023.
//

import Foundation
@testable import UnitTestExample
// Bir sınıfın Mock edilmiş bir versiyonundan yararlanmak
final class MockedTracker : SessionTracking {
    // Özelliğimize, yalnızca kendi sınıfımızdan yazmayı mümkün kılan private(set) ekledik. Testimizi yazmak için yeterli olan sınıfın dışından dahili okuma erişimine izin verir
    private(set) var hasActiveSession : Bool = false
    func startNewSession() {
        hasActiveSession = true
    }
    
    func stopCurrentSession() {
        hasActiveSession = false
    }
    
    
}
