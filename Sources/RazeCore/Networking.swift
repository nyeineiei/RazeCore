//
//  Networking.swift
//  RazeCore
//
//  Created by Nyein Ei Ei Tun on 23/7/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data,error)
        }
        task.resume()
    }
    
}

extension RazeCore {
    public class Networking {
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            internal var session: NetworkSession = URLSession.shared
            
            public init() {}
            
            
            /// Call to the live internet to retrieve data from specific location
            /// - Parameters:
            ///   - url: The location you wish to fetcht the data from
            ///   - completionHandler: Return the result which signifies the status of the request
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                session.get(from: url) { (data, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
            }
            
            public enum NetworkResult<Value> {
                case success(Value)
                case failure(Error?)
            }
        }
    }
}
