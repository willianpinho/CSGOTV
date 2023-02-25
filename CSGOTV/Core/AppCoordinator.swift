//
//  AppCoordinator.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let matches = MatchesCoordinator()
        self.start(coordinator: matches)
        
        window.rootViewController = matches.navigationController
        window.makeKeyAndVisible()
    }
}
