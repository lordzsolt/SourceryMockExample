//
//  FriendListAssembler.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

enum FriendListAssembler {
    static func build(navigationController: UINavigationController) -> UIViewController {
        let view = FriendListView()
        let interactor = FriendListInteractor(friendsService: FriendsService())
        let wireframe = FriendListWireframe(navigationController: navigationController)
        let presenter = FriendListPresenter(view: view, interactor: interactor, wireframe: wireframe)
        view.presenter = presenter
        return view
    }
}
