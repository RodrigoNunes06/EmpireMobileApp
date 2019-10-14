//
//  Trip.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct Trip: Equatable {
    let id: Int
    let pilot: Pilot
    let distance: Distance
    let duration: Int
    let pickUp: Location
    let dropOff: Location
    
    func getTripDuration() -> DateInterval {
        return DateInterval(start: pickUp.date, end: dropOff.date)
    }
}
