//
//  TripListViewModelTests.swift
//  EmpireMobileAppTests
//
//  Created by Rodrigo Nunes on 10/14/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest
import SwiftyMocky
import RxSwift
import RxCocoa
import RxTest

@testable import EmpireMobileApp

class TripListViewModelTests: XCTestCase {
    var scheduler: TestScheduler!
    var viewModel: TripListViewModelApi!
    var coordinatorMock: TripCoordinatorApiMock!
    var getTripsUseCaseMock: GetTripsUseCaseApiMock!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
        coordinatorMock = TripCoordinatorApiMock(sequencing: .lastWrittenResolvedFirst,
                                                 stubbing: .wrap)
        getTripsUseCaseMock = GetTripsUseCaseApiMock(sequencing: .lastWrittenResolvedFirst,
                                                     stubbing: .wrap)
        viewModel = TripListViewModel(coordinator: coordinatorMock,
                                      getTripsUseCase: getTripsUseCaseMock)
        performGetTripsMock()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOnError() {
        let error = NSError(domain: "Server Error", code: 500, userInfo: nil)
        var errorSent = false
        
        Perform(getTripsUseCaseMock, .execute(completion: .any,
                                              perform: { (completion) in
                                                completion(nil, error)
        }))
        
        viewModel.onError.subscribe(onNext: { _ in
            errorSent = true
        }).disposed(by: disposeBag)
        
        viewModel.onViewDidLoad()
        
        XCTAssertTrue(errorSent)
    }
    
    func testReloadAction() {
        var reloadCalled = false
        
        viewModel.reloadAction.subscribe(onNext: {
            reloadCalled = true
        }).disposed(by: disposeBag)
        
        viewModel.onViewDidLoad()
       
        XCTAssertTrue(reloadCalled)
    }
    
    func testShowLoading() {
        let observer = scheduler.createObserver(Bool.self)
        
        viewModel.showLoading
            .asDriver(onErrorJustReturn: false)
            .drive(observer)
            .disposed(by: disposeBag)
        
        scheduler.start()
        viewModel.onViewDidLoad()
        
        let expectedEvents = [Recorded.next(0, true), Recorded.next(0, false)]
        XCTAssertEqual(observer.events, expectedEvents)
    }
    
    func testOnViewDidLoadGetTripsIsCalled() {
        viewModel.onViewDidLoad()
        Verify(getTripsUseCaseMock, .execute(completion: .any))
    }
    
    func testNumberOfRows() {
        let trips = performGetTripsMock()
        viewModel.onViewDidLoad()
        let rows = viewModel.numberOfRows()
        XCTAssertEqual(rows, trips.count)
    }
    
    func testCellViewModelForIndex() {
        let trips = performGetTripsMock()
        let trip = trips.first!
        let expectedViewModel = TripCellViewModel(pilot: trip.pilot,
                                                  pickupLocation: trip.pickUp.name,
                                                  dropOffLocation: trip.dropOff.name)
        viewModel.onViewDidLoad()
        let cellViewModel = viewModel.cellViewModel(index: 0)
        XCTAssertEqual(expectedViewModel, cellViewModel)
    }
    
    func testCellIdentifier() {
        let expectedIdentifier = String(describing: TripCell.self)
        XCTAssertEqual(expectedIdentifier, viewModel.cellIdentifier())
    }
    
    func testOnTapCell() {
        let trips = performGetTripsMock()
        viewModel.onViewDidLoad()
        viewModel.onTapCell(index: 0)
        Verify(coordinatorMock, .showTripDetail(trip: .value(trips[0])))
    }
}

private extension TripListViewModelTests {
    func createDateFromString(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)
        return date!
    }
    
    func createTrip() -> Trip {
        let trip = Trip(id: 1,
                        pilot: Pilot(name: "Porg", avatar: "avatar", rating: 3),
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
    
    @discardableResult
    func performGetTripsMock() -> [Trip] {
        let trips = [createTrip()]
        Perform(getTripsUseCaseMock, .execute(completion: .any,
                                              perform: { (completion) in
                                                completion(trips, nil)
        }))
        return trips
    }
}
