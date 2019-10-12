//
//  NetworkProxy.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 12/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

class NetworkProxy {
    func process<T: Codable>( networkRequest: NetworkRequest, completion: @escaping(T?, Error?) -> Void) {
        Network.shared.requestObject(networkRequest: networkRequest) { (object: T?, error) in
            if let error = error {
                 completion(nil, error)
            } else if let object = object {
                 completion(object, nil)
            }
        }
    }
    
    func processArray<T: Codable>( networkRequest: NetworkRequest, completion: @escaping([T]?, Error?) -> Void) {
        Network.shared.requestArray(networkRequest: networkRequest) { (objectArray: [T]?, error) in
            if let error = error {
                completion(nil, error)
            } else if let objectArray = objectArray {
                completion(objectArray, nil)
            }
        }
    }
}
