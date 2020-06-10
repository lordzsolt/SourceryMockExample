//
//  SceneDelegate.swift
//  SourceryExample
//
//  Created by Zsolt Kovacs on 03.06.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var root: RootWireframe?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            return
        }

        root = RootWireframe.create(with: scene)
    }
}
