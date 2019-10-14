//
//  TripCoordinator.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import UIKit


//sourcery: AutoMockable
protocol TripCoordinatorApi {
    func showTripList()
    func showTripDetail(trip: Trip)
    func start()
}

class TripCoordinator {
    private let navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension TripCoordinator: TripCoordinatorApi {
    func start() {
        showTripList()
    }
    
    func showTripList()  {
        let getTripsUseCase = GetTripsUseCase()
        let tripListVM = TripListViewModel(coordinator: self,
                                           getTripsUseCase: getTripsUseCase)
        let tripListVC = TripListViewController(viewModel: tripListVM)
        navigationController.pushViewController(tripListVC, animated: true)
    }
    
    func showTripDetail(trip: Trip) {
        let tripDetailVM = TripDetailViewModel(trip: trip)
        let tripDetailVC = TripDetailViewController(viewModel: tripDetailVM)
        navigationController.pushViewController(tripDetailVC, animated: true)
    }
}
