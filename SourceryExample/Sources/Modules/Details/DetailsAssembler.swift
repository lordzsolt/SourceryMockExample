//
//  FriendListAssembler.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

enum DetailsAssembler {
    static func build(friend: Friend) -> UIViewController {
        let view = DetailsView()
        let interactor = DetailsInteractor(friendsService: FriendsService())
        let presenter = DetailsPresenter(view: view, interactor: interactor, friend: friend)
        view.presenter = presenter
        return view
    }
}
