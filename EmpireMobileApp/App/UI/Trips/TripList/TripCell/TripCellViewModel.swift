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
    var pilotRating: Observable<Int?> { get }
    var pickupLocation: Observable<String> { get }
    var dropOffLocation: Observable<String> { get }
    
    func getRatingViewModel() -> RatingViewViewModel
}

class TripCellViewModel: TripCellViewModelApi {
    private let pilotRatingValue: Int
    
    var pilotName: Observable<String>
    var pilotImage: Observable<String>
    var pilotRating: Observable<Int?>
    var pickupLocation: Observable<String>
    var dropOffLocation: Observable<String>
    
    required init(pilot: Pilot,
                  pickupLocation: String,
                  dropOffLocation: String) {
        self.pilotName = Observable.just(pilot.name)
        self.pilotImage = Observable.just(pilot.avatar)
        self.pilotRating = Observable.just(pilot.rating)
        self.pickupLocation = Observable.just(pickupLocation)
        self.dropOffLocation = Observable.just(dropOffLocation)
        self.pilotRatingValue = pilot.rating
    }
    
    func getRatingViewModel() -> RatingViewViewModel {
        return RatingViewViewModel(rating: pilotRatingValue, style: .small)
    }
}
