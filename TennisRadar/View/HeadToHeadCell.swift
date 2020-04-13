//
//  HeadToHeadCell.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/11/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class HeadToHeadCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var tourRound: UILabel!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var tourCity: UILabel!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var matchResults: UILabel!
    
    // MARK: - Cell Func
    override func awakeFromNib() {
        super.awakeFromNib()
    }
          
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func loadData(_ mResult: MatchResult) {
        let sportEvent = mResult.sportEvent
        clearValues()
        year.text = sportEvent.season?.year ?? " "
        tourRound.text = mResult.tourRound()
        tourName.text = mResult.tourName()
        
        if let venue = sportEvent.venue {
            tourCity.text = "\(venue.name)\(venue.cityName == nil ? "" : ", ")\(venue.cityName ?? "")"
        }
        winner.text = mResult.winnerName()
        matchResults.text = mResult.sportEventStatus.eventScores()
    }
    
    fileprivate func clearValues() {
        tourRound.text = ""
        tourName.text = ""
        winner.text = ""
        matchResults.text = ""
        year.text = ""
        tourCity.text = ""
    }
       
}
