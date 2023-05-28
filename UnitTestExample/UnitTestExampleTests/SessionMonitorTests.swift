//
//  File.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 28.05.2023.
//

import Foundation

import XCTest
@testable import UnitTestExample

final class SessionMoniotrTests : XCTestCase {
    private var monitor : SessionMonitor!
    
    func testSessionRound() {
         let tracker = MockedTracker()
         monitor = SessionMonitor(tracker: tracker)

         XCTAssertFalse(tracker.hasActiveSession)

         NotificationCenter.default.post(name: UIApplication.willEnterForegroundNotification, object: nil)
         XCTAssertTrue(tracker.hasActiveSession)

         NotificationCenter.default.post(name: UIApplication.didEnterBackgroundNotification, object: nil)
         XCTAssertFalse(tracker.hasActiveSession)
     }
    
    // Bu işlem gerçekleştirildiğinde gerçel Tracker ' ı test etmemekteyiz.
 
}
