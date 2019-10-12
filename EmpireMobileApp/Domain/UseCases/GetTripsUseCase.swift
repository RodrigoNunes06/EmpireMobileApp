//
//  GetTripsUseCase.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class GetTripsUseCase: BaseUseCase<TripRepository> {
    init() {
        super.init(repository: TripRepositoryImpl())
    }
    
    func execute(completion: @escaping([Trip]?, Error?) -> Void) {
        repository.tripList { (tripList, error) in
            completion(tripList, error)
        }
    }
}
