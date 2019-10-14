// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.3.4

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import Foundation
import RxSwift
@testable import EmpireMobileApp


// MARK: - GetTripUseCaseApi
open class GetTripUseCaseApiMock: GetTripUseCaseApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func execute(withId id: Int, completion: @escaping TripUseCaseResponse) {
        addInvocation(.m_execute__withId_idcompletion_completion(Parameter<Int>.value(`id`), Parameter<TripUseCaseResponse>.any))
		let perform = methodPerformValue(.m_execute__withId_idcompletion_completion(Parameter<Int>.value(`id`), Parameter<TripUseCaseResponse>.any)) as? (Int, @escaping TripUseCaseResponse) -> Void
		perform?(`id`, `completion`)
    }


    fileprivate enum MethodType {
        case m_execute__withId_idcompletion_completion(Parameter<Int>, Parameter<TripUseCaseResponse>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_execute__withId_idcompletion_completion(let lhsId, let lhsCompletion), .m_execute__withId_idcompletion_completion(let rhsId, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__withId_idcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(withId id: Parameter<Int>, completion: Parameter<TripUseCaseResponse>) -> Verify { return Verify(method: .m_execute__withId_idcompletion_completion(`id`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(withId id: Parameter<Int>, completion: Parameter<TripUseCaseResponse>, perform: @escaping (Int, @escaping TripUseCaseResponse) -> Void) -> Perform {
            return Perform(method: .m_execute__withId_idcompletion_completion(`id`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GetTripsUseCaseApi
open class GetTripsUseCaseApiMock: GetTripsUseCaseApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func execute(completion: @escaping TripsUseCaseReponse) {
        addInvocation(.m_execute__completion_completion(Parameter<TripsUseCaseReponse>.any))
		let perform = methodPerformValue(.m_execute__completion_completion(Parameter<TripsUseCaseReponse>.any)) as? (@escaping TripsUseCaseReponse) -> Void
		perform?(`completion`)
    }


    fileprivate enum MethodType {
        case m_execute__completion_completion(Parameter<TripsUseCaseReponse>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_execute__completion_completion(let lhsCompletion), .m_execute__completion_completion(let rhsCompletion)):
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__completion_completion(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(completion: Parameter<TripsUseCaseReponse>) -> Verify { return Verify(method: .m_execute__completion_completion(`completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(completion: Parameter<TripsUseCaseReponse>, perform: @escaping (@escaping TripsUseCaseReponse) -> Void) -> Perform {
            return Perform(method: .m_execute__completion_completion(`completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TripCoordinatorApi
open class TripCoordinatorApiMock: TripCoordinatorApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func showTripList() {
        addInvocation(.m_showTripList)
		let perform = methodPerformValue(.m_showTripList) as? () -> Void
		perform?()
    }

    open func showTripDetail(trip: Trip) {
        addInvocation(.m_showTripDetail__trip_trip(Parameter<Trip>.value(`trip`)))
		let perform = methodPerformValue(.m_showTripDetail__trip_trip(Parameter<Trip>.value(`trip`))) as? (Trip) -> Void
		perform?(`trip`)
    }

    open func start() {
        addInvocation(.m_start)
		let perform = methodPerformValue(.m_start) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_showTripList
        case m_showTripDetail__trip_trip(Parameter<Trip>)
        case m_start

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_showTripList, .m_showTripList):
                return true 
            case (.m_showTripDetail__trip_trip(let lhsTrip), .m_showTripDetail__trip_trip(let rhsTrip)):
                guard Parameter.compare(lhs: lhsTrip, rhs: rhsTrip, with: matcher) else { return false } 
                return true 
            case (.m_start, .m_start):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_showTripList: return 0
            case let .m_showTripDetail__trip_trip(p0): return p0.intValue
            case .m_start: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showTripList() -> Verify { return Verify(method: .m_showTripList)}
        public static func showTripDetail(trip: Parameter<Trip>) -> Verify { return Verify(method: .m_showTripDetail__trip_trip(`trip`))}
        public static func start() -> Verify { return Verify(method: .m_start)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showTripList(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showTripList, performs: perform)
        }
        public static func showTripDetail(trip: Parameter<Trip>, perform: @escaping (Trip) -> Void) -> Perform {
            return Perform(method: .m_showTripDetail__trip_trip(`trip`), performs: perform)
        }
        public static func start(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_start, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TripDetailViewModelApi
open class TripDetailViewModelApiMock: TripDetailViewModelApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var pilotName: Observable<String> {
		get {	invocations.append(.p_pilotName_get); return __p_pilotName ?? givenGetterValue(.p_pilotName_get, "TripDetailViewModelApiMock - stub value for pilotName was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pilotName = newValue }
	}
	private var __p_pilotName: (Observable<String>)?

    public var pilotAvatar: Observable<URL> {
		get {	invocations.append(.p_pilotAvatar_get); return __p_pilotAvatar ?? givenGetterValue(.p_pilotAvatar_get, "TripDetailViewModelApiMock - stub value for pilotAvatar was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pilotAvatar = newValue }
	}
	private var __p_pilotAvatar: (Observable<URL>)?

    public var pickupPlanetImageURL: Observable<URL> {
		get {	invocations.append(.p_pickupPlanetImageURL_get); return __p_pickupPlanetImageURL ?? givenGetterValue(.p_pickupPlanetImageURL_get, "TripDetailViewModelApiMock - stub value for pickupPlanetImageURL was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pickupPlanetImageURL = newValue }
	}
	private var __p_pickupPlanetImageURL: (Observable<URL>)?

    public var pickupPlanetName: Observable<String> {
		get {	invocations.append(.p_pickupPlanetName_get); return __p_pickupPlanetName ?? givenGetterValue(.p_pickupPlanetName_get, "TripDetailViewModelApiMock - stub value for pickupPlanetName was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pickupPlanetName = newValue }
	}
	private var __p_pickupPlanetName: (Observable<String>)?

    public var pickupPlanetTime: Observable<String> {
		get {	invocations.append(.p_pickupPlanetTime_get); return __p_pickupPlanetTime ?? givenGetterValue(.p_pickupPlanetTime_get, "TripDetailViewModelApiMock - stub value for pickupPlanetTime was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pickupPlanetTime = newValue }
	}
	private var __p_pickupPlanetTime: (Observable<String>)?

    public var dropOffPlanetImageURL: Observable<URL> {
		get {	invocations.append(.p_dropOffPlanetImageURL_get); return __p_dropOffPlanetImageURL ?? givenGetterValue(.p_dropOffPlanetImageURL_get, "TripDetailViewModelApiMock - stub value for dropOffPlanetImageURL was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dropOffPlanetImageURL = newValue }
	}
	private var __p_dropOffPlanetImageURL: (Observable<URL>)?

    public var dropOffPlanetName: Observable<String> {
		get {	invocations.append(.p_dropOffPlanetName_get); return __p_dropOffPlanetName ?? givenGetterValue(.p_dropOffPlanetName_get, "TripDetailViewModelApiMock - stub value for dropOffPlanetName was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dropOffPlanetName = newValue }
	}
	private var __p_dropOffPlanetName: (Observable<String>)?

    public var dropOffPlanetTime: Observable<String> {
		get {	invocations.append(.p_dropOffPlanetTime_get); return __p_dropOffPlanetTime ?? givenGetterValue(.p_dropOffPlanetTime_get, "TripDetailViewModelApiMock - stub value for dropOffPlanetTime was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dropOffPlanetTime = newValue }
	}
	private var __p_dropOffPlanetTime: (Observable<String>)?

    public var tripDistance: Observable<String> {
		get {	invocations.append(.p_tripDistance_get); return __p_tripDistance ?? givenGetterValue(.p_tripDistance_get, "TripDetailViewModelApiMock - stub value for tripDistance was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_tripDistance = newValue }
	}
	private var __p_tripDistance: (Observable<String>)?

    public var tripDuration: Observable<String> {
		get {	invocations.append(.p_tripDuration_get); return __p_tripDuration ?? givenGetterValue(.p_tripDuration_get, "TripDetailViewModelApiMock - stub value for tripDuration was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_tripDuration = newValue }
	}
	private var __p_tripDuration: (Observable<String>)?

    public var pilotRating: Observable<RatingViewViewModel> {
		get {	invocations.append(.p_pilotRating_get); return __p_pilotRating ?? givenGetterValue(.p_pilotRating_get, "TripDetailViewModelApiMock - stub value for pilotRating was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_pilotRating = newValue }
	}
	private var __p_pilotRating: (Observable<RatingViewViewModel>)?






    fileprivate enum MethodType {
        case p_pilotName_get
        case p_pilotAvatar_get
        case p_pickupPlanetImageURL_get
        case p_pickupPlanetName_get
        case p_pickupPlanetTime_get
        case p_dropOffPlanetImageURL_get
        case p_dropOffPlanetName_get
        case p_dropOffPlanetTime_get
        case p_tripDistance_get
        case p_tripDuration_get
        case p_pilotRating_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_pilotName_get,.p_pilotName_get): return true
            case (.p_pilotAvatar_get,.p_pilotAvatar_get): return true
            case (.p_pickupPlanetImageURL_get,.p_pickupPlanetImageURL_get): return true
            case (.p_pickupPlanetName_get,.p_pickupPlanetName_get): return true
            case (.p_pickupPlanetTime_get,.p_pickupPlanetTime_get): return true
            case (.p_dropOffPlanetImageURL_get,.p_dropOffPlanetImageURL_get): return true
            case (.p_dropOffPlanetName_get,.p_dropOffPlanetName_get): return true
            case (.p_dropOffPlanetTime_get,.p_dropOffPlanetTime_get): return true
            case (.p_tripDistance_get,.p_tripDistance_get): return true
            case (.p_tripDuration_get,.p_tripDuration_get): return true
            case (.p_pilotRating_get,.p_pilotRating_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_pilotName_get: return 0
            case .p_pilotAvatar_get: return 0
            case .p_pickupPlanetImageURL_get: return 0
            case .p_pickupPlanetName_get: return 0
            case .p_pickupPlanetTime_get: return 0
            case .p_dropOffPlanetImageURL_get: return 0
            case .p_dropOffPlanetName_get: return 0
            case .p_dropOffPlanetTime_get: return 0
            case .p_tripDistance_get: return 0
            case .p_tripDuration_get: return 0
            case .p_pilotRating_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func pilotName(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_pilotName_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func pilotAvatar(getter defaultValue: Observable<URL>...) -> PropertyStub {
            return Given(method: .p_pilotAvatar_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func pickupPlanetImageURL(getter defaultValue: Observable<URL>...) -> PropertyStub {
            return Given(method: .p_pickupPlanetImageURL_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func pickupPlanetName(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_pickupPlanetName_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func pickupPlanetTime(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_pickupPlanetTime_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func dropOffPlanetImageURL(getter defaultValue: Observable<URL>...) -> PropertyStub {
            return Given(method: .p_dropOffPlanetImageURL_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func dropOffPlanetName(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_dropOffPlanetName_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func dropOffPlanetTime(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_dropOffPlanetTime_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func tripDistance(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_tripDistance_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func tripDuration(getter defaultValue: Observable<String>...) -> PropertyStub {
            return Given(method: .p_tripDuration_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func pilotRating(getter defaultValue: Observable<RatingViewViewModel>...) -> PropertyStub {
            return Given(method: .p_pilotRating_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var pilotName: Verify { return Verify(method: .p_pilotName_get) }
        public static var pilotAvatar: Verify { return Verify(method: .p_pilotAvatar_get) }
        public static var pickupPlanetImageURL: Verify { return Verify(method: .p_pickupPlanetImageURL_get) }
        public static var pickupPlanetName: Verify { return Verify(method: .p_pickupPlanetName_get) }
        public static var pickupPlanetTime: Verify { return Verify(method: .p_pickupPlanetTime_get) }
        public static var dropOffPlanetImageURL: Verify { return Verify(method: .p_dropOffPlanetImageURL_get) }
        public static var dropOffPlanetName: Verify { return Verify(method: .p_dropOffPlanetName_get) }
        public static var dropOffPlanetTime: Verify { return Verify(method: .p_dropOffPlanetTime_get) }
        public static var tripDistance: Verify { return Verify(method: .p_tripDistance_get) }
        public static var tripDuration: Verify { return Verify(method: .p_tripDuration_get) }
        public static var pilotRating: Verify { return Verify(method: .p_pilotRating_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TripListViewModelApi
open class TripListViewModelApiMock: TripListViewModelApi, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var onError: Observable<Error> {
		get {	invocations.append(.p_onError_get); return __p_onError ?? givenGetterValue(.p_onError_get, "TripListViewModelApiMock - stub value for onError was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_onError = newValue }
	}
	private var __p_onError: (Observable<Error>)?

    public var reloadAction: Observable<Void> {
		get {	invocations.append(.p_reloadAction_get); return __p_reloadAction ?? givenGetterValue(.p_reloadAction_get, "TripListViewModelApiMock - stub value for reloadAction was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_reloadAction = newValue }
	}
	private var __p_reloadAction: (Observable<Void>)?

    public var showLoading: Observable<Bool> {
		get {	invocations.append(.p_showLoading_get); return __p_showLoading ?? givenGetterValue(.p_showLoading_get, "TripListViewModelApiMock - stub value for showLoading was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_showLoading = newValue }
	}
	private var __p_showLoading: (Observable<Bool>)?





    open func onViewDidLoad() {
        addInvocation(.m_onViewDidLoad)
		let perform = methodPerformValue(.m_onViewDidLoad) as? () -> Void
		perform?()
    }

    open func numberOfRows() -> Int {
        addInvocation(.m_numberOfRows)
		let perform = methodPerformValue(.m_numberOfRows) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_numberOfRows).casted()
		} catch {
			onFatalFailure("Stub return value not specified for numberOfRows(). Use given")
			Failure("Stub return value not specified for numberOfRows(). Use given")
		}
		return __value
    }

    open func cellViewModel(index: Int) -> TripCellViewModel {
        addInvocation(.m_cellViewModel__index_index(Parameter<Int>.value(`index`)))
		let perform = methodPerformValue(.m_cellViewModel__index_index(Parameter<Int>.value(`index`))) as? (Int) -> Void
		perform?(`index`)
		var __value: TripCellViewModel
		do {
		    __value = try methodReturnValue(.m_cellViewModel__index_index(Parameter<Int>.value(`index`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for cellViewModel(index: Int). Use given")
			Failure("Stub return value not specified for cellViewModel(index: Int). Use given")
		}
		return __value
    }

    open func cellIdentifier() -> String {
        addInvocation(.m_cellIdentifier)
		let perform = methodPerformValue(.m_cellIdentifier) as? () -> Void
		perform?()
		var __value: String
		do {
		    __value = try methodReturnValue(.m_cellIdentifier).casted()
		} catch {
			onFatalFailure("Stub return value not specified for cellIdentifier(). Use given")
			Failure("Stub return value not specified for cellIdentifier(). Use given")
		}
		return __value
    }

    open func onTapCell(index: Int) {
        addInvocation(.m_onTapCell__index_index(Parameter<Int>.value(`index`)))
		let perform = methodPerformValue(.m_onTapCell__index_index(Parameter<Int>.value(`index`))) as? (Int) -> Void
		perform?(`index`)
    }


    fileprivate enum MethodType {
        case m_onViewDidLoad
        case m_numberOfRows
        case m_cellViewModel__index_index(Parameter<Int>)
        case m_cellIdentifier
        case m_onTapCell__index_index(Parameter<Int>)
        case p_onError_get
        case p_reloadAction_get
        case p_showLoading_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_onViewDidLoad, .m_onViewDidLoad):
                return true 
            case (.m_numberOfRows, .m_numberOfRows):
                return true 
            case (.m_cellViewModel__index_index(let lhsIndex), .m_cellViewModel__index_index(let rhsIndex)):
                guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false } 
                return true 
            case (.m_cellIdentifier, .m_cellIdentifier):
                return true 
            case (.m_onTapCell__index_index(let lhsIndex), .m_onTapCell__index_index(let rhsIndex)):
                guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false } 
                return true 
            case (.p_onError_get,.p_onError_get): return true
            case (.p_reloadAction_get,.p_reloadAction_get): return true
            case (.p_showLoading_get,.p_showLoading_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_onViewDidLoad: return 0
            case .m_numberOfRows: return 0
            case let .m_cellViewModel__index_index(p0): return p0.intValue
            case .m_cellIdentifier: return 0
            case let .m_onTapCell__index_index(p0): return p0.intValue
            case .p_onError_get: return 0
            case .p_reloadAction_get: return 0
            case .p_showLoading_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func onError(getter defaultValue: Observable<Error>...) -> PropertyStub {
            return Given(method: .p_onError_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func reloadAction(getter defaultValue: Observable<Void>...) -> PropertyStub {
            return Given(method: .p_reloadAction_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func showLoading(getter defaultValue: Observable<Bool>...) -> PropertyStub {
            return Given(method: .p_showLoading_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func numberOfRows(willReturn: Int...) -> MethodStub {
            return Given(method: .m_numberOfRows, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func cellViewModel(index: Parameter<Int>, willReturn: TripCellViewModel...) -> MethodStub {
            return Given(method: .m_cellViewModel__index_index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func cellIdentifier(willReturn: String...) -> MethodStub {
            return Given(method: .m_cellIdentifier, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func numberOfRows(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_numberOfRows, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func cellViewModel(index: Parameter<Int>, willProduce: (Stubber<TripCellViewModel>) -> Void) -> MethodStub {
            let willReturn: [TripCellViewModel] = []
			let given: Given = { return Given(method: .m_cellViewModel__index_index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (TripCellViewModel).self)
			willProduce(stubber)
			return given
        }
        public static func cellIdentifier(willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_cellIdentifier, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func onViewDidLoad() -> Verify { return Verify(method: .m_onViewDidLoad)}
        public static func numberOfRows() -> Verify { return Verify(method: .m_numberOfRows)}
        public static func cellViewModel(index: Parameter<Int>) -> Verify { return Verify(method: .m_cellViewModel__index_index(`index`))}
        public static func cellIdentifier() -> Verify { return Verify(method: .m_cellIdentifier)}
        public static func onTapCell(index: Parameter<Int>) -> Verify { return Verify(method: .m_onTapCell__index_index(`index`))}
        public static var onError: Verify { return Verify(method: .p_onError_get) }
        public static var reloadAction: Verify { return Verify(method: .p_reloadAction_get) }
        public static var showLoading: Verify { return Verify(method: .p_showLoading_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func onViewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_onViewDidLoad, performs: perform)
        }
        public static func numberOfRows(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_numberOfRows, performs: perform)
        }
        public static func cellViewModel(index: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_cellViewModel__index_index(`index`), performs: perform)
        }
        public static func cellIdentifier(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_cellIdentifier, performs: perform)
        }
        public static func onTapCell(index: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_onTapCell__index_index(`index`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

