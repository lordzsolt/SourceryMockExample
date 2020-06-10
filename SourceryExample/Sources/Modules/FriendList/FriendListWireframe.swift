//
//  FriendListWireframe.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

protocol FriendListWireframeProtocol {
    func showDetails(friend: Friend)
}

class FriendListWireframe: FriendListWireframeProtocol {
    private unowned let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showDetails(friend: Friend) {
        let viewController = DetailsAssembler.build(friend: friend)
        navigationController.pushViewController(viewController, animated: true)
    }
}
