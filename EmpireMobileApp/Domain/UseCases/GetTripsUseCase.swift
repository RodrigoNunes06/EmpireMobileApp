//
//  GetTripsUseCase.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

typealias TripsUseCaseReponse = ([Trip]?, Error?) -> Void

//sourcery: AutoMockable
protocol GetTripsUseCaseApi {
    func execute(completion: @escaping TripsUseCaseReponse)
}

final class GetTripsUseCase: GetTripsUseCaseApi {
    private let repository: TripRepository
    
    init() {
        self.repository = TripRepositoryImpl()
    }
    
    func execute(completion: @escaping TripsUseCaseReponse) {
        repository.tripList { (tripList, error) in
            completion(tripList, error)
        }
    }
}
