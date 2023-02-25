//
//  MatchesCoodinator.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class MatchesCoordinator: BaseCoordinator {
    private var viewModel: MatchesViewModel = MatchesViewModel(webservice: WebService())
    
    override func start() {
        let matchesViewController = MatchesViewController()
        matchesViewController.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: matchesViewController)
        self.navigationController.viewControllers = [matchesViewController]
    }
}
