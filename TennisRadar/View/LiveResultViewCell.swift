//
//  LiveResultViewCell.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/9/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

@IBDesignable class LiveResultViewCell: UITableViewCell {
    
    // MARK: - Match Data
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var stageMatch: UILabel!
    @IBOutlet weak var matchStatus: UILabel!
    @IBOutlet weak var fourthSetHeader: UILabel!
    @IBOutlet weak var fifthSetHeader: UILabel!
    
    // MARK: - Home Data
    @IBOutlet weak var homeSeed: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeCoutryCode: UIImageView!
    @IBOutlet weak var homePartCountryCode: UIImageView!
    
    @IBOutlet weak var homeCurrent: UILabel!
    @IBOutlet weak var homeFirstSet: UILabel!
    @IBOutlet weak var homeSecondSet: UILabel!
    @IBOutlet weak var homeThirdSet: UILabel!
    @IBOutlet weak var homeFourthSet: UILabel!
    @IBOutlet weak var homeFifthSet: UILabel!
    
    // MARK: - Away Data
    @IBOutlet weak var awaySeed: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayCountryCode: UIImageView!
    @IBOutlet weak var awayPartCountryCode: UIImageView!
    
    @IBOutlet weak var awayCurrent: UILabel!
    @IBOutlet weak var awayFirstSet: UILabel!
    @IBOutlet weak var awaySecondSet: UILabel!
    @IBOutlet weak var awayThirdSet: UILabel!
    @IBOutlet weak var awayFourthSet: UILabel!
    @IBOutlet weak var awayFifthSet: UILabel!
    
    // MARK: - Utility
    static let seed = "seed"
    static let name = "name"
    static let flag = "countryCode"
    static let curr = "current"
    static let first = "fst"
    static let scnd = "snd"
    static let thrd = "trd"
    static let frth = "fth"
    static let ffth = "fif"
    
    // MARK: - Cell Func
    override func awakeFromNib() {
        super.awakeFromNib()
    }
       
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Helper Methods
    func getAway() -> [String: UILabel] {
        return [LiveResultViewCell.first:awayFirstSet, LiveResultViewCell.scnd:awaySecondSet,
                LiveResultViewCell.thrd:awayThirdSet, LiveResultViewCell.frth:awayFourthSet,
                LiveResultViewCell.ffth:awayFifthSet]
    }
    
    func getHome() -> [String: UILabel] {
        return [LiveResultViewCell.first:homeFirstSet, LiveResultViewCell.scnd:homeSecondSet,
                LiveResultViewCell.thrd:homeThirdSet, LiveResultViewCell.frth:homeFourthSet,
                LiveResultViewCell.ffth:homeFifthSet]
    }
    
    func loadResult(_ matchResult: MatchResult) {
        clearLabels()
        let sportEvent = matchResult.sportEvent
        let sportEventStatus = matchResult.sportEventStatus
        let awayScore = sportEventStatus.awayScore ?? -1
        let homeScore = sportEventStatus.homeScore ?? -1
        
        venueName.text = sportEvent.venue?.name ?? ""
        if let roundName = sportEvent.tournamentRound?.name {
            stageMatch.text = roundName.capitalized
        }
        matchStatus.text = ""
        if let status = sportEventStatus.matchStatus {
            matchStatus.text = TournamentManager.shared.eventStatusType[status] ?? ""
        }
        
        // current Score
        if awayScore >= 0 {
            awayCurrent.text = "\(awayScore)"
        }
        if homeScore >= 0 {
            homeCurrent.text = "\(homeScore)"
        }
        
        setTypeFont(isAwayHigher: awayScore > homeScore, away: awayCurrent, home: homeCurrent)
        
        // players data
        if let competitors = sportEvent.competitors {
            for competitor in competitors {
                let seed = competitor.seed != nil ? "\(competitor.seed!)" : " "
                let name = competitor.name ?? ""
                var countryFlag: UIImage? = nil
                var countryPartFlag: UIImage? = nil
                showDoublePartnerFlag(false)
                showSeed(true)
                if let contryCode = competitor.countryCode {
                    countryFlag = UIImage(named: contryCode)
                } else if let players = competitor.players {
                    showDoublePartnerFlag(true)
                    showSeed(false)
                    if let firstCountry = players[0].countryCode, let secCountry = players[1].countryCode {
                        countryFlag = UIImage(named: firstCountry)
                        countryPartFlag = UIImage(named: secCountry)
                    }
                }
                setMainInfo(competitor.qualifier, name, seed, countryFlag, countryPartFlag)
            }
        }
        
        // match results
        if let periodScores = sportEventStatus.periodScores {
            let homeScores = getHome()
            let awayScores = getAway()
            for periodScore in periodScores {
                guard let keySet = getKeyBySet(periodScore.number) else { continue }
                guard let aScore = periodScore.awayScore else { continue }
                guard let hScore = periodScore.homeScore else { continue }
                
                if homeScores.keys.contains(keySet), awayScores.keys.contains(keySet) {
                    homeScores[keySet]?.text = "\(hScore)"
                    awayScores[keySet]?.text = "\(aScore)"
                    
                    setTypeFont(isAwayHigher: aScore > hScore, away: awayScores[keySet]!, home: homeScores[keySet]!)
                }
            }
        }
        
        // hide 4th and 5th sets headers if neccesary
        if let sportEventConditions = matchResult.sportEventConditions {
            showSets(isFiveSetMatch: sportEventConditions.matchMode == Constants.bestOfFive)
        }
    }
    
    // MARK: - Helper
    fileprivate func setMainInfo(_ qualifier: String?, _ name: String, _ seed: String, _ countryFlag: UIImage?, _ countryPartFalg: UIImage?) {
        if Constants.homePlayer == qualifier {
            homeSeed.text = seed
            homeName.text = name
            homeCoutryCode.image = countryFlag
            homePartCountryCode.image = countryPartFalg
        } else {
            awaySeed.text = seed
            awayName.text = name
            awayCountryCode.image = countryFlag
            awayPartCountryCode.image = countryPartFalg
        }
    }
    
    fileprivate func getKeyBySet(_ number: Int?) -> String? {
        switch number {
        case 1:
            return LiveResultViewCell.first
        case 2:
            return LiveResultViewCell.scnd
        case 3:
            return LiveResultViewCell.thrd
        case 4:
            return LiveResultViewCell.frth
        case 5:
            return LiveResultViewCell.ffth
        default:
            return nil
        }
    }
    
    fileprivate func showDoublePartnerFlag(_ show: Bool) {
        homePartCountryCode.isHidden = !show
        awayPartCountryCode.isHidden = !show
    }
    
    fileprivate func showSeed(_ show: Bool) {
        homeSeed.isHidden = !show
        awaySeed.isHidden = !show
    }
    
    fileprivate func showSets(isFiveSetMatch: Bool) {
        fourthSetHeader.isHidden = !isFiveSetMatch
        fifthSetHeader.isHidden = !isFiveSetMatch
        homeFourthSet.isHidden = !isFiveSetMatch
        homeFifthSet.isHidden = !isFiveSetMatch
        awayFourthSet.isHidden = !isFiveSetMatch
        awayFifthSet.isHidden = !isFiveSetMatch
    }
    
    private func clearLabels() {
        venueName.text = ""
        stageMatch.text = ""
        matchStatus.text = ""
        fourthSetHeader.text = ""
        fifthSetHeader.text = ""
        
        
        // MARK: - Home Data
        homeSeed.text = ""
        homeName.text = ""
        homeCoutryCode.image = nil
        homePartCountryCode.image = nil
        homeCurrent.text = ""
        homeFirstSet.text = ""
        homeSecondSet.text = ""
        homeThirdSet.text = ""
        homeFourthSet.text = ""
        homeFifthSet.text = ""
        
        // MARK: - Away Data
        awaySeed.text = ""
        awayName.text = ""
        awayCountryCode.image = nil
        awayPartCountryCode.image = nil
        awayCurrent.text = ""
        awayFirstSet.text = ""
        awaySecondSet.text = ""
        awayThirdSet.text = ""
        awayFourthSet.text = ""
        awayFifthSet.text = ""
    }
    
    fileprivate func setTypeFont(isAwayHigher: Bool, away: UILabel, home: UILabel) {
        away.font = isAwayHigher ? Constants.fontBold : Constants.fontMedium
        home.font = isAwayHigher ? Constants.fontMedium : Constants.fontBold
    }
}
