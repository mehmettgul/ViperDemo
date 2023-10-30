//
//  SceneDelegate.swift
//  ViperDemo
//
//  Created by Mehmet Gül on 30.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let routerInstance = CryptoRouter.startExecution()
        let initialViewController = routerInstance.entryPoint
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = initialViewController
        self.window = window
        window.makeKeyAndVisible()
    }


}

