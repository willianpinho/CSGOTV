//
//  MatchDetailsViewController.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 26/02/23.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    var viewModel: MatchDetailsViewModel!
    var match: Match?
    @IBOutlet weak var team1ImageView: UIImageView!
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2ImageView: UIImageView!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(nibName: PlayersRowTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: PlayersRowTableViewCell.identifier)
        setupUI()
        setupData()
    }
}

extension MatchDetailsViewController {
    private func setupUI() {
        
        navigationController?.navigationBar.tintColor = UIColor.white
        guard let leagueName = match?.league?.name, let serieName = match?.serie?.name else { return }
        navigationItem.title = "\(leagueName) - \(serieName)"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let backImage = UIImage(named: "ic-arrow-left")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.backItem?.title = ""
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 55
        tableView.separatorStyle = .none
    }
    
    private func setupData() {
        team1ImageView.load(fromUrl: match?.opponents?.first?.opponent?.image_url ?? "")
        team1Label.text = match?.opponents?.first?.opponent?.name
        
        team2ImageView.load(fromUrl: match?.opponents?.last?.opponent?.image_url ?? "")
        team2Label.text = match?.opponents?.last?.opponent?.name
        
        guard let currentDate = match?.begin_at else { return }
        timeLabel.text = Date.formatDate(date: currentDate)
    }
}

extension MatchDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PlayersRowTableViewCell.identifier, for: indexPath) as? PlayersRowTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
