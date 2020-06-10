//
//  FriendListView.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 04.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func reload()
    func showError(_ message: String)
    func setLoading(_ isLoading: Bool)
}

class DetailsView: UIViewController {
    var presenter: DetailsPresenterProtocol!

    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        reload()
        presenter.onViewDidLoad()
    }
}

extension DetailsView: DetailsViewProtocol {
    func reload() {
        title = presenter.title
        view.backgroundColor = presenter.backgroundColor
    }

    func showError(_ message: String) {
        view.makeToast(message)
    }

    func setLoading(_ isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
