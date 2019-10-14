//
//  TripDetailViewController.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class TripDetailViewController: UIViewController {
    @IBOutlet private var pickUpPlanetImageView: UIImageView!
    @IBOutlet private var dropOffPlanetImageView: UIImageView!
    @IBOutlet private var tripInformationView: UIView!
    @IBOutlet private var pilotImageView: UIImageView!
    @IBOutlet private var pilotNameLabel: UILabel!
    @IBOutlet private var departureLocationLabel: UILabel!
    @IBOutlet private var departureTimeLabel: UILabel!
    @IBOutlet private var arrivalLocationLabel: UILabel!
    @IBOutlet private var arrivalTimeLabel: UILabel!
    @IBOutlet private var tripDistanceLabel: UILabel!
    @IBOutlet private var tripDurationLabel: UILabel!
    @IBOutlet private var ratingView: RatingView!
    
    private let viewModel: TripDetailViewModelApi
    private let disposeBag = DisposeBag()
    
    init(viewModel: TripDetailViewModelApi) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTripInformationView()
        setupRx()
    }
}

private extension TripDetailViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setupTripInformationView() {
        let blurEffect: UIBlurEffect
        blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tripInformationView.addSubview(blurEffectView)
        tripInformationView.sendSubviewToBack(blurEffectView)
        tripInformationView.layer.cornerRadius = 15
    }
    
    func setupRx() {
        setupPickupPlanetRx()
        setupDropOffPlanetRx()
        setupPilotRx()
        setupRatingRx()
        setupTripRx()
    }
    
    func setupPickupPlanetRx() {
        viewModel.pickupPlanetName.subscribe(onNext: {[unowned self] planetName in
            self.departureLocationLabel.text = planetName
        }).disposed(by: disposeBag)
        
        viewModel.pickupPlanetTime.subscribe(onNext: {[unowned self] timeString in
            self.departureTimeLabel.text = timeString
        }).disposed(by: disposeBag)
        
        viewModel.pickupPlanetImageURL.subscribe(onNext: {[unowned self] url in
            self.pickUpPlanetImageView.kf.setImage(with: url)
        }).disposed(by: disposeBag)
    }
    
    func setupDropOffPlanetRx() {
        viewModel.dropOffPlanetName.subscribe(onNext: {[unowned self] planetName in
            self.arrivalLocationLabel.text = planetName
        }).disposed(by: disposeBag)
        
        viewModel.dropOffPlanetTime.subscribe(onNext: {[unowned self] timeString in
            self.arrivalTimeLabel.text = timeString
        }).disposed(by: disposeBag)
        
        viewModel.dropOffPlanetImageURL.subscribe(onNext: {[unowned self] url in
            self.dropOffPlanetImageView.kf.setImage(with: url)
        }).disposed(by: disposeBag)
    }
    
    func setupPilotRx() {
        viewModel.pilotName.subscribe(onNext: {[unowned self] pilotName in
            self.pilotNameLabel.text = pilotName
        }).disposed(by: disposeBag)
        
        viewModel.pilotAvatar.subscribe(onNext: {[unowned self] url in
            self.pilotImageView.kf.setImage(with: url)
        }).disposed(by: disposeBag)
    }
    
    func setupRatingRx() {
        viewModel.pilotRating.subscribe(onNext: {[unowned self] ratingViewModel in
            self.ratingView.setup(viewModel: ratingViewModel)
        }).disposed(by: disposeBag)
    }
    
    func setupTripRx() {
        viewModel.tripDistance.subscribe(onNext: {[unowned self] distance in
            self.tripDistanceLabel.text = distance
        }).disposed(by: disposeBag)
        
        viewModel.tripDuration.subscribe(onNext: {[unowned self] duration in
            self.tripDurationLabel.text = duration
        }).disposed(by: disposeBag)
    }
}
