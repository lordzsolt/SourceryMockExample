//
//  RootWireframe.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 03.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//


import UIKit

public class RootWireframe {
	private let window: UIWindow
	private let navigationController: UINavigationController

	private init(scene: UIWindowScene) {
		self.window = UIWindow(windowScene: scene)
		self.navigationController = UINavigationController()

		let view = FriendListAssembler.build(navigationController: navigationController)
		navigationController.setViewControllers([view], animated: false)

		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}

	public static func create(with scene: UIWindowScene) -> RootWireframe {
		return RootWireframe(scene: scene)
	}
}
