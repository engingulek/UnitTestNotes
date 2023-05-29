//
//  NetworkSessionMock.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation
@testable import UnitTestExample


class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?

    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}
