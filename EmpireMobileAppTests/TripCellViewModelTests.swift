//
//  TripCellViewModelTests.swift
//  EmpireMobileAppTests
//
//  Created by Rodrigo Nunes on 10/14/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest

@testable import EmpireMobileApp

class TripCellViewModelTests: XCTestCase {

    var viewModel: TripCellViewModelApi!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    let pilot = Pilot(name: "Skywalker", avatar: "avatar", rating: 5)
    let pickupLocation = "Naboo"
    let dropOffLocation = "Coruscant"
    
    override func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        viewModel = TripCellViewModel(pilot: pilot,
                                      pickupLocation: pickupLocation,
                                      dropOffLocation: dropOffLocation)
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
        
        let expectedEvent = Recorded.next(0, pilot.name)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPilotImage() {
        let observer = scheduler.createObserver(String.self)
        viewModel.pilotImage
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, pilot.avatar)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPilotRating() {
        let observer = scheduler.createObserver(RatingViewViewModel.self)
        viewModel.pilotRating
            .asDriver(onErrorJustReturn: RatingViewViewModel(rating: 0, style: .big))
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedViewModel = RatingViewViewModel(rating: pilot.rating,
                                                    style: .small)
        
        let expectedEvent = Recorded.next(0, expectedViewModel)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testPickupLocation() {
        let observer = scheduler.createObserver(String.self)
        viewModel.pickupLocation
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, pickupLocation)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
    
    func testDropOffLocation() {
        let observer = scheduler.createObserver(String.self)
        viewModel.dropOffLocation
            .asDriver(onErrorJustReturn: "Error")
            .drive(observer)
            .disposed(by: disposeBag)
        scheduler.start()
        
        let expectedEvent = Recorded.next(0, dropOffLocation)
        XCTAssertEqual(observer.events.first!, expectedEvent)
    }
}

