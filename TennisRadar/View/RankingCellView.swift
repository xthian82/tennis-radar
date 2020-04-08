//
//  RankingCellView.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 3/30/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

@IBDesignable class RankingCellView: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
