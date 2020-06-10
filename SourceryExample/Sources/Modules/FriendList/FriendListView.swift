//
//  FriendListView.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit
import Toast_Swift

protocol FriendListViewProtocol: AnyObject {
    func reloadList()
    func showError(_ message: String)
    func setLoading(_ isLoading: Bool)
}

class FriendListView: UIViewController {
    var presenter: FriendListPresenterProtocol!

    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        title = "Friends"
        setupTableView()
        presenter.onViewDidLoad()
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc
    func pullToRefresh() {
        presenter.refresh()
    }
}

extension FriendListView: FriendListViewProtocol {
    func reloadList() {
        tableView.reloadData()
    }

    func showError(_ message: String) {
        view.makeToast(message)
    }

    func setLoading(_ isLoading: Bool) {
        if isLoading {
            refreshControl.beginRefreshing()
        } else {
            refreshControl.endRefreshing()
        }
    }
}

extension FriendListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(for: indexPath) as UITableViewCell
        cell.textLabel?.text = presenter.friends[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
