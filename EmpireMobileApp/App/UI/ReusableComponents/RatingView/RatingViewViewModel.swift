//
//  RatingViewViewModel.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

enum RatingStarsStyle {
    case big
    case small
}

struct RatingViewViewModel {
    let rating: Int
    let style: RatingStarsStyle
}
