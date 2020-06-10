//
//  FriendsService.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

typealias FriendsCallback = (Result<[Friend], ApiError>) -> Void
typealias FriendDetailsCallback = (Result<FriendDetails, ApiError>) -> Void

protocol FriendsServiceProtocol {
    func getFriends(_ callback: @escaping FriendsCallback)
    func getDetails(of friend: Friend, _ callback: @escaping FriendDetailsCallback)
}

class FriendsService: FriendsServiceProtocol {
    func getFriends(_ callback: @escaping FriendsCallback) {
        // .asyncAfter is used just to simulate some asynchronous API call. Here, you would perform a network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let names = [
                "James Smith",
                "Michael Smith",
                "Robert Smith",
                "Maria Garcia",
                "David Smith",
                "Maria Rodriguez",
                "Mary Smith",
                "Maria Hernandez",
            ]
            let friends = names.map(Friend.init)
            callback(.success(friends))
        }
    }

    func getDetails(of friend: Friend, _ callback: @escaping FriendDetailsCallback) {
        // .asyncAfter is used just to simulate some asynchronous API call. Here, you would perform a network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let details = FriendDetails(
                name: friend.name,
                age: Int.random(in: 1...100),
                favoriteColor: UIColor.random)
            callback(.success(details))
        }
    }
}
