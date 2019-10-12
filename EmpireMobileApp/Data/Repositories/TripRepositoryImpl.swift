//
//  TripRepositoryImpl.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

class TripRepositoryImpl: TripRepository {
    private var restAPI = AppService()
    
    func tripList(completion: @escaping ([Trip]?, Error?) -> Void) {
        restAPI.requestTripList { (tripEntityList, error) in
            if let error = error {
                completion(nil, error)
            } else {
                let tripList = tripEntityList?.map {
                    return TripEntityDataMapper.transform(entity: $0)
                }
                completion(tripList, nil)
            }
        }
    }
    
    func trip(withId id: Int, completion: @escaping (Trip?, Error?) -> Void) {
        restAPI.requestTrip(withId: id) { (tripEntity, error) in
            if let error = error {
                completion(nil, error)
            } else {
                let trip = TripEntityDataMapper.transform(entity: tripEntity)
                completion(trip, nil)
            }
        }
    }
}
