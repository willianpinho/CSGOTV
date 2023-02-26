//
//  MatchTableViewCell.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    static let identifier = "MatchTableViewCell"
    
    @IBOutlet weak var matchView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var team1ImageView: UIImageView!
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2ImageView: UIImageView!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        matchView.layer.cornerRadius = 16
        statusView.layer.cornerRadius = 16
        statusView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        
        circleImageView(image: team1ImageView)
        circleImageView(image: team2ImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func binding(model: Match) {
        team1ImageView.load(fromUrl: model.opponents?.first?.opponent?.image_url ?? "")
        team1Label.text = model.opponents?.first?.opponent?.name
        
        team2ImageView.load(fromUrl: model.opponents?.last?.opponent?.image_url ?? "")
        team2Label.text = model.opponents?.last?.opponent?.name
        
        leagueImageView.load(fromUrl: model.league?.image_url ?? "")
        guard let leagueName = model.league?.name, let serieName = model.serie?.name else { return }
        leagueLabel.text = "\(leagueName) - \(serieName)"
        
        if model.status == Status.Running {
            statusLabel.text = "Agora"
            statusView.backgroundColor = UIColor(red: 0.957, green: 0.165, blue: 0.208, alpha: 1)
        } else {
            guard let currentDate = model.begin_at else { return }
            statusLabel.text = Date.formatDate(date: currentDate)
            statusView.backgroundColor = UIColor(red: 0.979, green: 0.979, blue: 0.979, alpha: 0.2)
        }
    }
    
    func circleImageView(image: UIImageView) {
        image.layer.cornerRadius = image.frame.height/2
        image.layer.masksToBounds = false
        image.clipsToBounds = true
    }    
}
