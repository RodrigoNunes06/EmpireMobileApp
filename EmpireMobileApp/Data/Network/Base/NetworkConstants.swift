//
//  NetworkConstants.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 12/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct Api {
    static let baseURL = "https://starwars.kapten.com/"
    
    static let headerAuthorizationKey = "Authorization"
    static let headerContentTypeKey = "Content-Type"
    static let headerAcceptTypeKey = "Accept"
    static let headerBearerKey = "Bearer"
    static let headerContentTypeValue = "application/json"
    static let headerAcceptedLanguage = "Accept-Language"
    
    static let pathTrips = "/trips"
    static let pathTrip = "/trip/%@"
}
