//
//  Trip.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct Trip {
    let id: Int
    let pilot: Pilot
    let distance: Distance
    let duration: Int
    let pickUp: Location
    let dropOff: Location
}
