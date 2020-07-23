//
//  Networking.swift
//  RazeCore
//
//  Created by Nyein Ei Ei Tun on 23/7/20.
//

import Foundation

extension RazeCore {
    public class Networking {
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
          private let session = URLSession.shared
          
          public init() {}
          
          public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
            let task = session.dataTask(with: url) { data, response, error in
              let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
              completionHandler(result)
            }
            task.resume()
          }
          
          public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
          }
        }
    }
}
