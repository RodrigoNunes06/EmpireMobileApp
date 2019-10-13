//
//  TripCell.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class TripCell: UITableViewCell {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var pickUpLocationLabel: UILabel!
    @IBOutlet private var dropOffLocationLabel: UILabel!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var ratingView: RatingView!
    
    var viewModel: TripCellViewModelApi?
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: TripCellViewModelApi) {
        self.viewModel = viewModel
        ratingView.isHidden = true
        selectionStyle = .none
        setupRx()
    }
    
    static func preferredNibName() -> String {
        return String(describing: TripCell.self)
    }
    
    static func reuseIdentifier() -> String {
        return String(describing: TripCell.self)
    }
}

private extension TripCell {
    func setupRx() {
        guard let viewModel = viewModel else { return }
        
        viewModel.pilotName.subscribe(onNext: {[unowned self] name in
            self.userNameLabel.text = name.uppercased()
        }).disposed(by: disposeBag)
        
        viewModel.pilotImage.subscribe(onNext: {[unowned self] imageURLString in
            guard let imageURL = URL(string: imageURLString) else { return }
            
            self.userImageView.kf.setImage(with: imageURL)
        }).disposed(by: disposeBag)
        
        viewModel.pilotRating.subscribe(onNext: {[unowned self] rating in
            guard let rating = rating, rating > 0 else { return }
            self.setupPilotRating(rating: rating)
        }).disposed(by: disposeBag)
        
        viewModel.pickupLocation.subscribe(onNext: {[unowned self] pickUpLocation in
            self.pickUpLocationLabel.text = pickUpLocation
        }).disposed(by: disposeBag)
        
        viewModel.dropOffLocation.subscribe(onNext: {[unowned self] dropOffLocation in
            self.dropOffLocationLabel.text = dropOffLocation
        }).disposed(by: disposeBag)
    }
    
    func setupPilotRating(rating: Int) {
        ratingView.isHidden = false
        ratingView.setup(viewModel: viewModel!.getRatingViewModel())
        stackView.addArrangedSubview(ratingView)
    }
}
