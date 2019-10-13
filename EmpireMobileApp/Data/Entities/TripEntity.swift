//
//  TripEntity.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct TripEntity: Decodable {
    let id: Int
    let pilot: PilotEntity
    let distance: DistanceEntity
    let duration: Int
    let pickUp: LocationEntity
    let dropOff: LocationEntity
}
