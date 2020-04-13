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
    static let homePlayer = "home"
    static let awayPlayer = "away"
    
    // stats
    static let name = "Name"
    static let doubleFaults = "DoubleFaults"
    static let aces = "Aces"
    static let firstServePoints = "FirstServePoints"
    static let secondServicePoints = "SecondServicePoints"
    static let breakPoints = "BreakPoints"
    static let firstServe = "FirstServe"
    static let secondServe = "SecondServe"
    static let tiebreak = "Tiebreak"
    static let serviceGames = "ServiceGames"
    static let receiverPoints = "ReceiverPoints"
    static let servicePoints = "ServicePoints"
    
    // dates
    static let MMMMyyyyFormat = "MMMM yyyy"
    static let yyyyMMddFormat = "yyyy-MM-dd"
    static let timezoneDateISO = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
    
    // segues
    static let showCalendarSegue = "showCalendar"
    static let showTournamentInfoSegue = "showTournamentInfo"
    static let showPlayerInfoSegue = "playerInfo"
    static let showMatchDetailsSegue = "matchDetailsInfo"
    
    // cell Ids
    static let liveResultViewCellId = "resultViewCell"
    static let ongoingTourCellId = "ongoingCell"
    static let rankingCellId = "rankingCell"
    static let playerStatCellId = "playerStatCell"
    static let headToHeadCellId = "headToHeadCell"
}
