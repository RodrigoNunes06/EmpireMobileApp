//
//  GetTripUseCase.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class GetTripUseCase: BaseUseCase<TripRepository> {
    init() {
        super.init(repository: TripRepositoryImpl())
    }
    
    func execute(withId id: Int, completion: @escaping(Trip?, Error?) -> Void) {
        repository.trip(withId: id) { (trip, error) in
            completion(trip, error)
        }
    }
}
