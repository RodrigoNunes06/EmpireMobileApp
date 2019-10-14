//
//  TripDetailViewModelTests.swift
//  EmpireMobileAppTests
//
//  Created by Rodrigo Nunes on 10/14/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxCocoa

@testable import EmpireMobileApp

class TripDetailViewModelTests: XCTestCase {
    
    var scheduler: TestScheduler!
    var viewModel: TripDetailViewModelApi!
    var trip: Trip!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        trip = createTrip()
        viewModel = TripDetailViewModel(trip: trip)
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPilotName() {
        let observer = scheduler.createObserver(String.self)
        viewModel.pilotName
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, trip.pilot.name)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPilotAvatar() {
        let observer = scheduler.createObserver(URL.self)
        viewModel.pilotAvatar
            .asDriver(onErrorJustReturn: URL(string: "www.google.com")!)
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, URL(string: trip.pilot.avatar)!)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPickupPlanetImageURL() {
        let observer = scheduler.createObserver(URL.self)
        viewModel.pickupPlanetImageURL
            .asDriver(onErrorJustReturn: URL(string: "www.google.com")!)
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, URL(string: trip.pickUp.picture)!)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPickUpPlanetName() {
        let observer = scheduler.createObserver(String.self)
        viewModel.pickupPlanetName
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, trip.pickUp.name)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPickupPlanetTime() {
        let observer = scheduler.createObserver(String.self)
        viewModel.pickupPlanetTime
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        //Time is localized so is one more hour than backend time
        let expectedTimeString = "3:12 PM"
        let expectedEvent = Recorded.next(0, expectedTimeString)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testDropOffPlanetImageURL() {
        let observer = scheduler.createObserver(URL.self)
        viewModel.dropOffPlanetImageURL
            .asDriver(onErrorJustReturn: URL(string: "www.google.com")!)
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, URL(string: trip.dropOff.picture)!)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testDropOffPlanetName() {
        let observer = scheduler.createObserver(String.self)
        viewModel.dropOffPlanetName
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, trip.dropOff.name)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testDropOffPlanetTime() {
        let observer = scheduler.createObserver(String.self)
        viewModel.dropOffPlanetTime
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        //Time is localized so is one more hour than backend time
        let expectedTimeString = "8:35 PM"
        let expectedEvent = Recorded.next(0, expectedTimeString)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testTripDistance() {
        let observer = scheduler.createObserver(String.self)
        viewModel.tripDistance
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedDistanceString = "10,000 KM"
        let expectedEvent = Recorded.next(0, expectedDistanceString)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testTripDuration() {
        let observer = scheduler.createObserver(String.self)
        viewModel.tripDuration
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        //Time is localized so is one more hour than backend time
        let expectedTimeString = "5:23:0"
        let expectedEvent = Recorded.next(0, expectedTimeString)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPilotRating() {
        let observer = scheduler.createObserver(RatingViewViewModel.self)
        viewModel.pilotRating
            .asDriver(onErrorJustReturn: RatingViewViewModel(rating: -1, style: .small))
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedViewModel = RatingViewViewModel(rating: 5, style: .big)
        let expectedEvent = Recorded.next(0, expectedViewModel)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
}

private extension TripDetailViewModelTests {
    func createDateFromString(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)
        return date!
    }
    
    func createTrip() -> Trip {
        let trip = Trip(id: 1,
                        pilot: Pilot(name: "Pete", avatar: "avatar", rating: 5),
                        distance: Distance(value: 10000, unit: "km"),
                        duration: 100000,
                        pickUp: Location(name: "Naboo",
                                         picture: "picture",
                                         date: createDateFromString(string: "2017-12-09T14:12:51Z")),
                        dropOff: Location(name: "Coruscant",
                                          picture: "picture",
                                          date: createDateFromString(string: "2017-12-09T19:35:51Z")))
        return trip
    }
}
