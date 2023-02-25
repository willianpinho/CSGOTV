//
//  AppCoordinator.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    private unowned var sceneDelegate: SceneDelegate
    
    init(_ window: UIWindow, sceneDelegate: SceneDelegate) {
        self.window = window
        self.sceneDelegate = sceneDelegate
    }
    
    override func start() {
        let matches = MatchesCoordinator()
        self.start(coordinator: matches)
        
        window.rootViewController = matches.navigationController
        window.makeKeyAndVisible()
    }
}
