//
//  FriendListInteractor.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import Foundation

protocol DetailsInteractorProtocol {
    func getDetails(of friend: Friend, _ callback: @escaping FriendDetailsCallback)
}

class DetailsInteractor: DetailsInteractorProtocol {
    private let friendsService: FriendsServiceProtocol

    init(friendsService: FriendsServiceProtocol) {
        self.friendsService = friendsService
    }

    func getDetails(of friend: Friend, _ callback: @escaping FriendDetailsCallback) {
        friendsService.getDetails(of: friend, callback)
    }
}
