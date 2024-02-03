//
//  SceneDelegate.swift
//  Movies
//
//  Created by Nikita Melnikov on 02.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = UINavigationController(rootViewController: AnimationVC())
        window?.makeKeyAndVisible()
    }
}
