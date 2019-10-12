//
//  PilotEntityDataMapper.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct PilotEntityDataMapper {
    static func transform(entity: PilotEntity) -> Pilot {
        let avatarUrlString = Api.baseURL + entity.avatar
        return Pilot(name: entity.name,
                     avatar: avatarUrlString,
                     rating: entity.rating)
    }
}
