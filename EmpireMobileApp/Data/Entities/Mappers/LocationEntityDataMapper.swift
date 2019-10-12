//
//  LocationEntityDataMapper.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct LocationEntityDataMapper {
    
    static func transform(entity: LocationEntity) -> Location {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: entity.date) ?? Date()
        let pictureUrlString = Api.baseURL + entity.picture
        return Location(name: entity.name,
                        picture: pictureUrlString,
                        date: date)
    }
    
}
