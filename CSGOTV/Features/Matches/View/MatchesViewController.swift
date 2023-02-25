//
//  MatchesViewController.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class MatchesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MatchesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
}

extension MatchesViewController {
    private func setupUI() {
        navigationItem.title = "Matches"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.separatorStyle = .none
        tableView.register(
            UINib(nibName: MatchTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: MatchTableViewCell.identifier)
    }
    
    private func setupData() {
        viewModel.fetchMatches()
        viewModel.dataFound = { [weak self] in
            self?.refreshData()
        }
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MatchTableViewCell.identifier, for: indexPath) as? MatchTableViewCell {
            let match = viewModel.matches[indexPath.row]
            cell.binding(model: match)
            return cell
        }
        return UITableViewCell()
    }
}
