//
//  GetTripUseCase.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

typealias TripUseCaseResponse = (Trip?, Error?) -> Void

//sourcery: AutoMockable
protocol GetTripUseCaseApi {
    func execute(withId id: Int, completion: @escaping TripUseCaseResponse)
}

final class GetTripUseCase: GetTripUseCaseApi {
    private let repository: TripRepository
    
    init() {
        self.repository = TripRepositoryImpl()
    }
    
    func execute(withId id: Int, completion: @escaping TripUseCaseResponse) {
        repository.trip(withId: id) { (trip, error) in
            completion(trip, error)
        }
    }
}
