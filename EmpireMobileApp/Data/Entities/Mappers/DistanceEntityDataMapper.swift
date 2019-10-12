//
//  DistanceEntityDataMapper.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct DistanceEntityDataMapper {
    
    static func transform(entity: DistanceEntity) -> Distance {
        return Distance(value: entity.value, unit: entity.unit)
    }
    
}
