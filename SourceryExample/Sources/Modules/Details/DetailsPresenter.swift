//
//  FriendListPresenter.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

protocol DetailsPresenterProtocol {
    var title: String { get }
    var backgroundColor: UIColor { get }
    func onViewDidLoad()
}

class DetailsPresenter: DetailsPresenterProtocol {
    private unowned let view: DetailsViewProtocol
    private let interactor: DetailsInteractorProtocol

    private let friend: Friend
    private var friendDetails: FriendDetails?

    init(view: DetailsViewProtocol, interactor: DetailsInteractorProtocol, friend: Friend) {
        self.view = view
        self.interactor = interactor
        self.friend = friend
    }

    var title: String {
        guard let friendDetails = self.friendDetails else {
            return friend.name
        }
        return "\(friend.name) - \(friendDetails.age)"
    }

    var backgroundColor: UIColor {
        guard let friendDetails = self.friendDetails else {
            return .white
        }
        return friendDetails.favoriteColor
    }

    func onViewDidLoad() {
        view.setLoading(true)
        interactor.getDetails(of: friend) { [weak self] result in
            self?.view.setLoading(false)
            switch result {
            case .success(let details):
                self?.friendDetails = details
                self?.view.reload()
            case .failure(let error):
                self?.view.showError(error.message)
            }
        }
    }
}

