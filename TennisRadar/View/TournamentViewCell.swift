//
//  TournamentViewCell.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/9/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class TournamentViewCell: UITableViewCell {
    
    @IBOutlet weak var markTournamentView: UIImageView!
    @IBOutlet weak var tournamentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
