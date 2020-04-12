//
//  MatchResult.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

public struct MatchResult: Codable {

    let sportEvent: SportEvent
    let sportEventConditions: SportEventConditions?
    let sportEventStatus: SportEventStatus
    let coverageInfo: CoverageInfo?
    let timeline: [Timeline]?
    let statistics: MatchStatistics?
    
    enum CodingKeys: String, CodingKey {
        case sportEvent = "sport_event"
        case sportEventConditions = "sport_event_conditions"
        case sportEventStatus = "sport_event_status"
        case coverageInfo = "coverage_info"
        case timeline
        case statistics
    }
    
    func winnerName() -> String {
        let homeIsTheWinner = (sportEventStatus.homeScore ?? 0) > (sportEventStatus.awayScore ?? 0)
        
        if let competitors = sportEvent.competitors {
            for competitor in competitors {
                if let qual = competitor.qualifier {
                    if qual == Constants.homePlayer {
                        if homeIsTheWinner {
                            return competitor.name ?? ""
                        }
                    } else {
                        if !homeIsTheWinner {
                            return competitor.name ?? ""
                        }
                    }
                }
            }
        }
        
        return ""
    }
    
    func tourName() -> String {
        guard let tournamentRound = sportEvent.tournamentRound else {
            return ""
        }

        if let longName = tournamentRound.groupLongName {
            if let endOfSentence = longName.firstIndex(of: ",") {
                //var chars = longName[...endOfSentence]
                return String(longName[...endOfSentence])
            } else {
                return longName
            }
        }
        
        return ""
    }
    
    func tourRound() -> String {
        guard let tournamentRound = sportEvent.tournamentRound else {
            return ""
        }
        
        if let tourName = tournamentRound.name {
            return TournamentManager.shared.eventStagesType[tourName] ?? ""
        } else if tournamentRound.type == "group" {
            return "RR"
        }
        
        return ""
    }
    
    func tourRoundFull() -> String {
        guard let tournamentRound = sportEvent.tournamentRound else {
            return ""
        }
        
        if let tourName = tournamentRound.name {
            return tourName
        } else if tournamentRound.type == "group" {
            return "Round Robin"
        }
        
        return ""
    }
    
    func venueFullName() -> String {
        return sportEvent.venue?.fullName() ?? ""
    }
    
    func scoreResults() -> String {
        return sportEventStatus.eventScores()
    }
    
    func homeStatistics() -> MatchStat? {
        return playerStatistics(Constants.homePlayer)
    }
    
    func awayStatistics() -> MatchStat? {
        return playerStatistics(Constants.awayPlayer)
    }
    
    fileprivate func playerStatistics(_ qualifier: String) -> MatchStat? {
        if let stat = statistics {
            return stat.teams.first(where: { ms -> Bool in ms.qualifier == qualifier })
        }
        
        return nil
    }
}

