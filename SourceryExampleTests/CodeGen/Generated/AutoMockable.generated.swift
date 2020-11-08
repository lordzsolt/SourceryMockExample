// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

















@testable import SourceryExample

class MockFriendListInteractor: FriendListInteractorProtocol {

    // MARK: - getFriends
    var getFriends_callsCount = 0
    var getFriends_called: Bool {
        return getFriends_callsCount > 0
    }
    var getFriends_receivedCallback: (FriendsCallback)?
    var getFriends_receivedInvocations: [(FriendsCallback)] = []
    var _getFriends: ((@escaping FriendsCallback) -> Void)?

    func getFriends(_ callback: @escaping FriendsCallback) {
        getFriends_callsCount += 1
        getFriends_receivedCallback = callback
        getFriends_receivedInvocations.append(callback)
        _getFriends?(callback)
    }

}
class MockFriendListView: FriendListViewProtocol {

    // MARK: - reloadList
    var reloadList_callsCount = 0
    var reloadList_called: Bool {
        return reloadList_callsCount > 0
    }
    var _reloadList: (() -> Void)?

    func reloadList() {
        reloadList_callsCount += 1
        _reloadList?()
    }

    // MARK: - showError
    var showError_callsCount = 0
    var showError_called: Bool {
        return showError_callsCount > 0
    }
    var showError_receivedMessage: String?
    var showError_receivedInvocations: [String] = []
    var _showError: ((String) -> Void)?

    func showError(_ message: String) {
        showError_callsCount += 1
        showError_receivedMessage = message
        showError_receivedInvocations.append(message)
        _showError?(message)
    }

    // MARK: - setLoading
    var setLoading_callsCount = 0
    var setLoading_called: Bool {
        return setLoading_callsCount > 0
    }
    var setLoading_receivedIsLoading: Bool?
    var setLoading_receivedInvocations: [Bool] = []
    var _setLoading: ((Bool) -> Void)?

    func setLoading(_ isLoading: Bool) {
        setLoading_callsCount += 1
        setLoading_receivedIsLoading = isLoading
        setLoading_receivedInvocations.append(isLoading)
        _setLoading?(isLoading)
    }

}
class MockFriendListWireframe: FriendListWireframeProtocol {

    // MARK: - showDetails
    var showDetailsFriend_callsCount = 0
    var showDetailsFriend_called: Bool {
        return showDetailsFriend_callsCount > 0
    }
    var showDetailsFriend_receivedFriend: Friend?
    var showDetailsFriend_receivedInvocations: [Friend] = []
    var _showDetailsFriend: ((Friend) -> Void)?

    func showDetails(friend: Friend) {
        showDetailsFriend_callsCount += 1
        showDetailsFriend_receivedFriend = friend
        showDetailsFriend_receivedInvocations.append(friend)
        _showDetailsFriend?(friend)
    }

}
