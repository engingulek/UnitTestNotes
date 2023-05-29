//
//  NetworkSession.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation

protocol NetworkSession {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void)
}


extension URLSession : NetworkSession {
    func loadData(from url: URL,
                      completionHandler: @escaping (Data?, Error?) -> Void) {
            let task = dataTask(with: url) { (data, _, error) in
                completionHandler(data, error)
            }

            task.resume()
        }
}

// NetworkResult içeriği bilinmemektedir

class NetworkManager {
    private let session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func loadData(from url: URL,
                  completionHandler: @escaping (String) -> Void) {
        session.loadData(from: url) { data, error in
            let result = "Success" 
            completionHandler(result)
        }
    }
}
