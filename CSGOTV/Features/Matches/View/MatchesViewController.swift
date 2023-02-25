//
//  MatchesViewController.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class MatchesViewController: UIViewController {
    
    var viewModel: MatchesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MatchesViewController {
    private func setupUI() {
        navigationItem.title = "Matches"
        navigationController?.navigationBar.barTintColor = .white
    }
}
