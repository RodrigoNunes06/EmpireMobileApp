//
//  TripEntityDataMapper.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct TripEntityDataMapper {
    static func transform(entity: TripEntity) -> Trip {
        let pilot = PilotEntityDataMapper.transform(entity: entity.pilot)
        let distance = DistanceEntityDataMapper.transform(entity: entity.distance)
        let pickUp = LocationEntityDataMapper.transform(entity: entity.pickUp)
        let dropOff = LocationEntityDataMapper.transform(entity: entity.dropOff)
        return Trip(id: entity.id,
                    pilot: pilot,
                    distance: distance,
                    duration: entity.duration,
                    pickUp: pickUp,
                    dropOff: dropOff)
    }
}
