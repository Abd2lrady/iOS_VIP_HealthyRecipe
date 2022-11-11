//
//  SceneDelegate+Extension.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit

extension SceneDelegate {
    func bootApp(scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        let view = ViewController()
        let navigator = UINavigationController(rootViewController: view)

        window.rootViewController = navigator
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}
