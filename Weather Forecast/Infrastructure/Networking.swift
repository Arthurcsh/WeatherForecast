//
//  Networking.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error
}

class Networking: NSObject {
  static let shared = Networking()
}

extension Networking {
    // request api for Networking
    func requestMetaService<T: Codable>(_ target: T.Type,url: String, handler: @escaping (Result<T>) -> Void )  {
        guard let url = URL(string: url) else {
            return handler(.error)
        }
        let urlRequest = URLRequest(url: url,
                                    cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
                                    timeoutInterval: TimeInterval.init(exactly: 10) ?? 0)
        URLSession.shared.dataTask(with: urlRequest) { (data, response,error) in
            guard let encoded = data else {
                return handler(.error)
            }
            do {
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode(T.self, from: encoded)
                handler(.success(parsedData))
            }catch let errorr {
                print(errorr)
                return handler(.error)
            }
            
        }.resume()
    }
}

