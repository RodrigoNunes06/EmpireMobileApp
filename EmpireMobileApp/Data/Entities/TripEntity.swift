//
//  TripEntity.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct TripEntity: Codable {
    let id: Int
    let pilot: PilotEntity
    let ditance: DistanceEntity
    let duration: Int
    let pickUp: LocationEntity
    let dropOff: LocationEntity
}
