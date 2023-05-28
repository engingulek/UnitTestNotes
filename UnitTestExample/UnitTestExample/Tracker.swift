//
//  Tracker.swift
//  UnitTestExample
//
//  Created by engin gülek on 28.05.2023.
//

import Foundation
import UIKit

protocol SessionTracking {
    func startNewSession()
    func stopCurrentSession()
}

final class Tracker: SessionTracking {
    private var hasActiveSession: Bool = false

    func startNewSession() {
        hasActiveSession = true
    }

    func stopCurrentSession() {
        hasActiveSession = false
    }
}

final class SessionMonitor {

    private let tracker: SessionTracking

    init(tracker: SessionTracking) {
        self.tracker = tracker
        startObserving()
    }

    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(startSession), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(endSession), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }

    @objc private func startSession() {
        tracker.startNewSession()
    }

    @objc private func endSession() {
        tracker.stopCurrentSession()
    }
}

// Şimdiye kadar koddan bir şey değişmedi. Ancak, SessionMonitor'umuzdan giden istekleri yakalamak için kullanılabilecek Tracker örneğimizin sahte bir sürümünü enjekte etmek için kapıyı açtık.
// Başka bir deyişle, Tracker örneğinin bildirimlerin her biri için çağrıldığını doğrulayabiliriz.
