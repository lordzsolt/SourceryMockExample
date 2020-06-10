//
//  FriendListPresenter.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import Foundation

protocol FriendListPresenterProtocol {
    var friends: [Friend] { get }

    func onViewDidLoad()
    func refresh()
    func didSelectItem(at index: Int)
}

class FriendListPresenter: FriendListPresenterProtocol {
    private unowned let view: FriendListViewProtocol
    private let interactor: FriendListInteractorProtocol
    private let wireframe: FriendListWireframeProtocol

    var friends: [Friend] = []

    init(view: FriendListViewProtocol, interactor: FriendListInteractorProtocol, wireframe: FriendListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }

    func onViewDidLoad() {
        getFriends()
    }

    func refresh() {
        getFriends()
    }

    func didSelectItem(at index: Int) {
        wireframe.showDetails(friend: friends[index])
    }

    private func getFriends() {
        self.view.setLoading(true)

        interactor.getFriends { [weak self] result in
            self?.view.setLoading(false)
            switch result {
            case .success(let friends):
                self?.friends = friends
                self?.view.reloadList()
            case .failure(let error):
                self?.view.showError(error.message)
            }
        }
    }
}

