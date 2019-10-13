//
//  TripListViewModel.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TripListViewModelApi {
    var onError: Observable<Error> { get }
    var reloadAction: Observable<Void> { get }
    func onViewDidLoad()
    func numberOfRows() -> Int
    func cellViewModel(index: Int) -> TripCellViewModel
    func cellIdentifier() -> String
}

class TripListViewModel {
    private let getTripsUseCase: GetTripsUseCase!
    private let coordinator: TripCoordinatorApi!
    private var trips: [Trip] = []
    private var reload = PublishSubject<Void>()
    private var error = PublishSubject<Error>()
    
    init(coordinator: TripCoordinatorApi, getTripsUseCase: GetTripsUseCase) {
        self.getTripsUseCase = getTripsUseCase
        self.coordinator = coordinator
    }
}

extension TripListViewModel: TripListViewModelApi {
    var onError: Observable<Error> {
        return error.asObservable()
    }
    
    var reloadAction: Observable<Void> {
        return reload.asObservable()
    }
    
    func onViewDidLoad() {
        getTripsUseCase.execute {[weak self] (tripList, error) in
            guard let self = self else { return }
            if let error = error {
                self.error.onNext(error)
            } else if let tripList = tripList {
                self.trips = tripList
            }
            self.reload.onNext(())
        }
    }
    
    func numberOfRows() -> Int {
        return trips.count
    }
    
    func cellViewModel(index: Int) -> TripCellViewModel {
        let trip = trips[index]
        return TripCellViewModel(pilot: trip.pilot, pickupLocation: trip.pickUp.name, dropOffLocation: trip.dropOff.name)
    }
    
    func cellIdentifier() -> String {
        TripCell.reuseIdentifier()
    }
}
