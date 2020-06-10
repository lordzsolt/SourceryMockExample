// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
















import RxSwift
import RxCocoa
@testable import ConfTracker

class MockCoreDataService: CoreDataServiceProtocol {
    var _conferences: Observable<[ManagedConference]>!
    var conferences: Observable<[ManagedConference]> {
        return _conferences
    }

    // MARK: - saveConference
    var saveConference_callsCount = 0
    var saveConference_called: Bool {
        return saveConference_callsCount > 0
    }
    var saveConference_returnValue: Observable<Void>!
    var _saveConference: ((Conference) -> Observable<Void>)?

    func saveConference(_ conference: Conference) -> Observable<Void> {
        saveConference_callsCount += 1
        return _saveConference.map { $0(conference) } ?? saveConference_returnValue
    }

}

class MockDetailInteractor: DetailInteractorProtocol {

    // MARK: - save
    var saveConference_callsCount = 0
    var saveConference_called: Bool {
        return saveConference_callsCount > 0
    }
    var saveConference_returnValue: Observable<Void>!
    var _saveConference: ((Conference) -> Observable<Void>)?

    func save(conference: Conference) -> Observable<Void> {
        saveConference_callsCount += 1
        return _saveConference.map { $0(conference) } ?? saveConference_returnValue
    }

}

class MockDetailPresenter: DetailPresenterProtocol {
    var _title: String!
    var title: String {
        return _title
    }
    var _isEditing: Driver<Bool>!
    var isEditing: Driver<Bool> {
        return _isEditing
    }
    var _cells: Driver<[DetailCellPresenter]>!
    var cells: Driver<[DetailCellPresenter]> {
        return _cells
    }
    var _requestResize: Signal<Void>!
    var requestResize: Signal<Void> {
        return _requestResize
    }
    var _leftButtonTapped: PublishRelay<Void>!
    var leftButtonTapped: PublishRelay<Void> {
        return _leftButtonTapped
    }
    var _rightButtonTapped: PublishRelay<Void>!
    var rightButtonTapped: PublishRelay<Void> {
        return _rightButtonTapped
    }

}

class MockDetailWireframe: DetailWireframeProtocol {

    // MARK: - close
    var close_callsCount = 0
    var close_called: Bool {
        return close_callsCount > 0
    }
    var _close: (() -> Void)?

    func close() {
        close_callsCount += 1
        _close?()
    }

}

class MockFeedInteractor: FeedInteractorProtocol {
    var _conferences: Observable<[ManagedConference]>!
    var conferences: Observable<[ManagedConference]> {
        return _conferences
    }

}

class MockFeedPresenter: FeedPresenterProtocol {
    var _conferences: Driver<[ManagedConference]>!
    var conferences: Driver<[ManagedConference]> {
        return _conferences
    }
    var _add: PublishSubject<Void>!
    var add: PublishSubject<Void> {
        return _add
    }
    var _select: PublishSubject<ManagedConference>!
    var select: PublishSubject<ManagedConference> {
        return _select
    }

}

class MockFeedWireframe: FeedWireframeProtocol {
    var _addNewConference: PublishSubject<Void>!
    var addNewConference: PublishSubject<Void> {
        return _addNewConference
    }
    var _viewConference: PublishSubject<ManagedConference>!
    var viewConference: PublishSubject<ManagedConference> {
        return _viewConference
    }

}

