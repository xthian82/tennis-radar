//
//  Constants.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/10/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class Constants {
    
    // fonts
    static let fontBold = UIFont(name: "Futura-Bold", size: 13.0)
    static let fontMedium = UIFont(name: "Futura-Medium", size: 13.0)
    
    static let bestOfFive = "bo5"
    static let maxRankPlayers = 150
    static let wtaRanking = "wtaRank"
    static let atpRanking = "atpRank"
    
    // dates
    static let MMMMyyyyFormat = "MMMM yyyy"
    static let yyyyMMddFormat = "yyyy-MM-dd"
    
    // segues
    static let showCalendarSegue = "showCalendar"
    static let showTournamentInfoSegue = "showTournamentInfo"
    static let showPlayerInfoSegue = "playerInfo"
    
    // cell Ids
    static let liveResultViewCellId = "resultViewCell"
    static let ongoingTourCellId = "ongoingCell"
    static let rankingCellId = "rankingCell"
    static let playerStatCellId = "playerStatCell"
}
