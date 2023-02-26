//
//  PlayersRowTableViewCell.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 26/02/23.
//

import UIKit

class PlayersRowTableViewCell: UITableViewCell {
    static let identifier = "PlayersRowTableViewCell"

    @IBOutlet weak var team1View: UIView!
    @IBOutlet weak var team2View: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        team1View.layer.cornerRadius = 16
        team1View.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        team2View.layer.cornerRadius = 16
        team2View.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }   
}
