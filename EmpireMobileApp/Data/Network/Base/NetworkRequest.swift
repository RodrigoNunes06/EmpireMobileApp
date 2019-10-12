//
//  NetworkRequest.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 12/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequest {
    
    var baseUrl: String = Api.baseURL
    var path = ""
    var method: HTTPMethod = .get
    var headers: [String : String]?
    var parameters: [String : Any]?
    var url: URLConvertible {
        let fullUrl = baseUrl + path
        return fullUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? fullUrl
    }
    
    init() {}
    
    func encoding() -> ParameterEncoding {
        return JSONEncoding.default
    }
    
}
