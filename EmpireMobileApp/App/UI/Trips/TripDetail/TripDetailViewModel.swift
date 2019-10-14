//
//  TripDetailViewModel.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol TripDetailViewModelApi {
    var pilotName: Observable<String> {get}
    var pilotAvatar: Observable<URL> { get }
    var pickupPlanetImageURL: Observable<URL> { get }
    var pickupPlanetName: Observable<String> { get }
    var pickupPlanetTime: Observable<String> { get }
    var dropOffPlanetImageURL: Observable<URL> { get }
    var dropOffPlanetName: Observable<String> { get }
    var dropOffPlanetTime: Observable<String> { get }
    var tripDistance: Observable<String> { get }
    var tripDuration: Observable<String> { get }
    var pilotRating: Observable<RatingViewViewModel> { get }
}

class TripDetailViewModel {
    private let trip: Trip!
    
    init(trip: Trip) {
        self.trip = trip
    }
}

extension TripDetailViewModel: TripDetailViewModelApi {
    var pilotAvatar: Observable<URL> {
        return Observable.just(trip.pilot.avatar).map { (urlString) -> URL in
            guard let url = URL(string: urlString) else {
                return URL(string: "https://images.ctfassets.net/bl73eiperqoo/5j48PEcu5AmGRewyTRL8uN/5ec4f14a8775f1701a31ed49de0dc2ff/OG_porg.png")!
            }
            return url
        }
    }
    
    var pilotName: Observable<String> {
        return Observable.just(trip.pilot.name)
    }
    
    var pickupPlanetImageURL: Observable<URL> {
        return Observable.just(trip.pickUp.picture).map { (urlString) -> URL in
            guard let url = URL(string: urlString) else {
                return URL(string: "https://66.media.tumblr.com/358dfd0733668010d9cad0ac6c2c0578/tumblr_pc50ffy6zo1vs5f7yo1_1280.png")!
            }
            return url
        }
    }
    
    var pickupPlanetName: Observable<String> {
        return Observable.just(trip.pickUp.name)
    }
    
    var pickupPlanetTime: Observable<String> {
        return Observable.just(trip.pickUp.date)
            .map {[unowned self] (date) -> String in
                self.transformDateToDateString(date: date)
        }
    }
    
    var dropOffPlanetImageURL: Observable<URL> {
        return Observable.just(trip.dropOff.picture).map { (urlString) -> URL in
            guard let url = URL(string: urlString) else {
                return URL(string: "https://66.media.tumblr.com/358dfd0733668010d9cad0ac6c2c0578/tumblr_pc50ffy6zo1vs5f7yo1_1280.png")!
            }
            return url
        }
    }
    
    var dropOffPlanetName: Observable<String> {
        return Observable.just(trip.dropOff.name)
    }
    
    var dropOffPlanetTime: Observable<String> {
        return Observable.just(trip.dropOff.date)
            .map {[unowned self] (date) -> String in
                self.transformDateToDateString(date: date)
        }
    }
    
    var tripDistance: Observable<String> {
        return Observable.just(trip.distance)
            .map {[unowned self] (distance) -> String in
                self.formatDistance(distance: distance)
        }
    }
    
    var tripDuration: Observable<String> {
        return Observable.just(trip.getTripDuration())
            .map {[unowned self] dateInterval -> String in
            self.transformTimeIntervalToString(dateInterval: dateInterval)
        }
    }
    
    var pilotRating: Observable<RatingViewViewModel> {
        return Observable.just(trip.pilot.rating)
            .map { rating -> RatingViewViewModel in
            return RatingViewViewModel(rating: rating, style: .big)
        }
    }
}

private extension TripDetailViewModel {
    func transformDateToDateString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    func transformTimeIntervalToString(dateInterval: DateInterval) -> String {
        let time = Int(dateInterval.duration)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = time / 3600
        return "\(hours):\(minutes):\(seconds)"
    }
    
    func formatDistance(distance: Distance) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        let distanceString = formatter.string(for: distance.value)!
        let unit = distance.unit.uppercased()
        return "\(distanceString) \(unit)"
    }
}
