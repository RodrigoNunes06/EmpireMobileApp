//
//  BaseUseCase.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

class BaseUseCase<T> {
    let repository: T
    
    init(repository: T) {
        self.repository = repository
    }
}
