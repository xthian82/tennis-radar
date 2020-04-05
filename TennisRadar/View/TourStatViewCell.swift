//
//  TourStatViewCell.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 4/5/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

@IBDesignable class TourStatViewCell: UITableViewCell {

    // MARK: - Props
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var toursPlayedLabel: UILabel!
    @IBOutlet weak var toursWonLabel: UILabel!
    @IBOutlet weak var matchesPlayedLabel: UILabel!
    @IBOutlet weak var matchesWonLabel: UILabel!
    @IBOutlet weak var tourStatLabel: UILabel!
    @IBOutlet weak var matchesStatLabel: UILabel!
    
    // MARK: - Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
