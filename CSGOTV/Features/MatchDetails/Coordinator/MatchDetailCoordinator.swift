//
//  MatchDetailCoordinator.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 26/02/23.
//

import Foundation

import UIKit

class MatchDetailsCoordinator: BaseCoordinator {
    private var match: Match?
    private var viewModel: MatchDetailsViewModel = MatchDetailsViewModel(webservice: WebService())
    
    init(match: Match) {
        self.match = match
    }
    
    override func start() {
        let matchDetailsViewController = MatchDetailsViewController()
        matchDetailsViewController.viewModel = viewModel
        matchDetailsViewController.match = match
        self.navigationController.pushViewController(matchDetailsViewController, animated: true)
    }
}
