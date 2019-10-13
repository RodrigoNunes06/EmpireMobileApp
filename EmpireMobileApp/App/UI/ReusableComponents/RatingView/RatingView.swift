//
//  RatingView.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit

class RatingView: NibView {

    @IBOutlet private var firstStarImageView: UIImageView!
    @IBOutlet private var secondStarImageView: UIImageView!
    @IBOutlet private var thirdStarImageView: UIImageView!
    @IBOutlet private var fourthStarImageView: UIImageView!
    @IBOutlet private var fifthStarImageView: UIImageView!
    
    private let maxRating = 5
    private var filledStarImage: UIImage?
    private var emptyStarImage: UIImage?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(viewModel: RatingViewViewModel) {
        setStarImageStyle(style: viewModel.style)
        setupStarRating(rating: viewModel.rating)
    }
    
}

private extension RatingView {
    func setStarImageStyle(style: RatingStarsStyle) {
        switch style {
        case .big:
            filledStarImage = UIImage(named: "BigFilledStar")!
            emptyStarImage = UIImage(named: "BigEmptyStar")!
        case .small:
            filledStarImage = UIImage(named: "SmallFilledStar")!
            emptyStarImage = UIImage(named: "SmallEmptyStar")!
        }
    }
    
    func getStarImage(starNumber: Int, forRating rating: Int) -> UIImage? {
        if rating >= starNumber {
            return filledStarImage
        } else {
            return emptyStarImage
        }
    }
    
    func setupStarRating(rating: Int) {
        let starImageViews = [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView, fifthStarImageView].enumerated()
        
        for (index, imageView) in starImageViews {
            imageView?.image = getStarImage(starNumber: index + 1, forRating: rating)
        }
    }
    
}
