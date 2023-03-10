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
        setupBinding()

        let matchesViewController = MatchesViewController()
        matchesViewController.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: matchesViewController)
        self.navigationController.viewControllers = [matchesViewController]
    }
    
    private func setupBinding() {
        viewModel.matchesItemSelected.subscribe(to: self) { this, match in
            this.navigateToDetail(match: match)
        }
    }
    
    private func navigateToDetail(match: Match) {
        let matchDetails = MatchDetailsCoordinator(match: match)
        matchDetails.navigationController = navigationController
        start(coordinator: matchDetails)
    }
}
