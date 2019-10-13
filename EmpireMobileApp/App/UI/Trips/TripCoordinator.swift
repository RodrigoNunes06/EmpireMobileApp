//
//  TripCoordinator.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import UIKit

protocol TripCoordinatorApi {
    func createTripList() -> UIViewController
    func showTripDetail()
}

class TripCoordinator {
    private let navigationController: UINavigationController!
    
    init() {
        self.navigationController = UINavigationController()
    }
}

extension TripCoordinator: TripCoordinatorApi {
    func createTripList() -> UIViewController {
        let getTripsUseCase = GetTripsUseCase()
        let tripListViewModel = TripListViewModel(coordinator: self,
                                                  getTripsUseCase: getTripsUseCase)
        let tripListViewController = TripListViewController(viewModel: tripListViewModel)
        return tripListViewController
    }
    
    func showTripDetail() {
        
    }
}
