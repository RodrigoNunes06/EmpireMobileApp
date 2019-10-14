//
//  RatingViewViewModel.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

enum RatingStarsStyle: Equatable {
    case big
    case small
}

struct RatingViewViewModel: Equatable {
    let rating: Int
    let style: RatingStarsStyle
}
