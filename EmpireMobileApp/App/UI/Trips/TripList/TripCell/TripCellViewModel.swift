//
//  TripCellViewModel.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import RxSwift

protocol TripCellViewModelApi {
    var pilotName: Observable<String> { get }
    var pilotImage: Observable<String> { get }
    var pilotRating: Observable<RatingViewViewModel> { get }
    var pickupLocation: Observable<String> { get }
    var dropOffLocation: Observable<String> { get }
}

struct TripCellViewModel: Equatable {
    private let pilot: Pilot
    private let departureLocation: String
    private let destinationLocation: String
    
    init(pilot: Pilot,
         pickupLocation: String,
         dropOffLocation: String) {
        self.pilot = pilot
        self.departureLocation = pickupLocation
        self.destinationLocation = dropOffLocation
    }
    
    private func getRatingViewModel() -> RatingViewViewModel {
        return RatingViewViewModel(rating: pilot.rating, style: .small)
    }
}

extension TripCellViewModel: TripCellViewModelApi {
    var pilotName: Observable<String> {
        return Observable.just(pilot.name)
    }
    
    var pilotImage: Observable<String> {
        return Observable.just(pilot.avatar)
    }
    
    var pilotRating: Observable<RatingViewViewModel> {
        return Observable.just(getRatingViewModel())
    }
    
    var pickupLocation: Observable<String> {
        return Observable.just(departureLocation)
    }
    
    var dropOffLocation: Observable<String> {
        return Observable.just(destinationLocation)
    }
}
