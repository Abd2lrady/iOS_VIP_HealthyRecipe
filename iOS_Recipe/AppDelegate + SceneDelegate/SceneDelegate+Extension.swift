//
//  SceneDelegate+Extension.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit
import Kingfisher
extension SceneDelegate {
    func bootApp(scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        let view = SearchRecipeConfigurator.configurate()
        
        let navigator = UINavigationController(rootViewController: view)
        window.rootViewController = navigator
        self.window = window
        self.window?.makeKeyAndVisible()
        
        imageCacheConfig()
    }
    
    func imageCacheConfig() {
        let cache = ImageCache.default
        cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 10
        cache.diskStorage.config.sizeLimit = 1024 * 1024 * 100
    }

}
