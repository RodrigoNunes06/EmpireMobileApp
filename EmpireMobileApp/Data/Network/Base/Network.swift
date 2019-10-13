//
//  Network.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 12/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import Alamofire

final class Network: SessionManager {
    static let shared = Network()
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        super.init(configuration: configuration)
    }
    
    private func setupHeaders(request: NetworkRequest) -> [String : String] {
        var headers = request.headers ?? [:]
        
        headers[Api.headerContentTypeKey] = Api.headerContentTypeValue
        headers[Api.headerAcceptedLanguage] = Locale.current.languageCode!
        
        return headers
    }
    
    func requestObject<T: Decodable>(networkRequest: NetworkRequest, completion:@escaping((T?, Error?) -> Void)) {
        let headers = setupHeaders(request: networkRequest)
        
        Alamofire.request(networkRequest.url,
                          method: networkRequest.method,
                          parameters: networkRequest.parameters,
                          encoding: networkRequest.encoding(),
                          headers: headers)
            .validate()
            .responseJSON { (response) in
                if let error = response.error {
                    completion(nil, error)
                } else {
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let parsedObject = try? decoder.decode(T.self, from: data)
                        completion(parsedObject, nil)
                    }
                }
        }
    }
    
    func requestArray<T: Decodable>(networkRequest: NetworkRequest, completion:@escaping(([T]?, Error?) -> Void)) {
        let headers = setupHeaders(request: networkRequest)
        
        Alamofire.request(networkRequest.url,
                          method: networkRequest.method,
                          parameters: networkRequest.parameters,
                          encoding: networkRequest.encoding(),
                          headers: headers)
            .validate()
            .responseJSON { (dataResponse) in
                if let error = dataResponse.error {
                    completion(nil, error)
                } else {
                    if let data = dataResponse.data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let parsedObject = try? decoder.decode([T].self, from: data)
                        completion(parsedObject, nil)
                    }
                }
        }
    }
}


