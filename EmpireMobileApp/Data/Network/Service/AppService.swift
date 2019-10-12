//
//  AppService.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 12/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class AppService: NetworkProxy {
    func requestTripList(completion: @escaping([TripEntity]?, Error?) -> Void) {
        let serviceRequest = NetworkRequest()
        serviceRequest.path = Api.pathTrips
        serviceRequest.method = .get
        
        processArray(networkRequest: serviceRequest) { (trips, error) in
            completion(trips, error)
        }
    }
    
    func requestTrip(withId id: Int, completion: @escaping(TripEntity?, Error?) -> Void) {
        let serviceRequest = NetworkRequest()
        serviceRequest.path = String(format: Api.pathTrip, id)
        serviceRequest.method = .get
        
        process(networkRequest: serviceRequest) { (trip, error) in
            completion(trip, error)
        }
    }
}
