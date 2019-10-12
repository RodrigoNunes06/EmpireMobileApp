//
//  TripRepository.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

protocol TripRepository {
    func tripList(completion: @escaping([Trip]?, Error?) -> Void)
    func trip(withId id: Int, completion: @escaping(Trip?, Error?) -> Void)
}
