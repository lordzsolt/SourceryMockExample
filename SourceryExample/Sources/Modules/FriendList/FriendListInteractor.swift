//
//  FriendListInteractor.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import Foundation

protocol FriendListInteractorProtocol {
    func getFriends(_ callback: @escaping FriendsCallback)
}

class FriendListInteractor: FriendListInteractorProtocol {
    private let friendsService: FriendsServiceProtocol

    init(friendsService: FriendsServiceProtocol) {
        self.friendsService = friendsService
    }

    func getFriends(_ callback: @escaping FriendsCallback) {
        friendsService.getFriends(callback)
    }
}
