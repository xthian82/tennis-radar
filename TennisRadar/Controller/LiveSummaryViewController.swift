//
//  LiveSummaryViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class LiveSummaryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //getTournaments()
        //getOngoingTournaments()
        //getTournamentSummary()
        //getTournamentSchedule()
        //getTournamentResults()
        //getTournamentInfo()
        //getResults()
        //getSchedule("2016-07-06")
        //getSchedule("live")
        //getLiveSummary()
        // getMatchProbability()
        //getMatchSummary()
        //getMatchTimeline()
        //getPlayerProfile("sr:competitor:14342")
        //getPlayerRankings()
        //getPlayerHeadToHead(from: "sr:competitor:18111", vs: "sr:competitor:15126")
    }
    
    // MARK: - test funcs
    func getTournaments() {
        print("=================> getTournaments")
        TennisApi.getTournaments { response in
            guard let tournaments: Tournaments = response else {
                print("no tours...")
                return
            }
            print("generatedAt = \(tournaments.generatedAt)")
            print("schema = \(tournaments.schema)")
            print("total = \(tournaments.tournaments.count)")
            if tournaments.tournaments.count > 0 {
                print (print("first is = \(tournaments.tournaments[0])"))
            }
        }
    }
        
    func getTournamentSummary() {
        print("=================> getTournamentSummary")
        TennisApi.getTournamentSummary("sr:tournament:2553") { response in
            guard let tourSummary: TournamentSummary = response else {
                print("no tours...")
                return
            }

            print("summary = \(tourSummary)")
        }
    }
    
    func getTournamentSchedule() {
        print("=================> getTournamentSchedule")
        TennisApi.getTournamentSchedule("sr:tournament:2555") { response in
            guard let tourSummary: TournamentSchedule = response else {
                print("no tours...")
                return
            }

            print("schedule = \(tourSummary)")
        }
    }

    func getTournamentResults() {
        print("=================> getTournamentResults")
        TennisApi.getTournamentResults("sr:tournament:2555") { response in
            guard let toursResults: TournamentResults = response else {
                print("no tours...")
                return
            }

            print("tournament = \(toursResults.tournament)")
    
            print("total = \(toursResults.results.count)")
            if toursResults.results.count > 0 {
                print("first is = \(toursResults.results[0])")
            }
        }
    }
    
    func getTournamentInfo() {
        print("=================> getTournamentInfo")
        TennisApi.getTournamentInfo("sr:tournament:2555") { response in
            guard let tourInfo: TournamentInfo = response else {
                print("no tours...")
                return
            }

        
            print("tournament = \(tourInfo.tournament)")
            print("Cover info  = \(tourInfo.coverageInfo)")
            print("tour Info = \(tourInfo.info)")
            if tourInfo.competitors.count > 0 {
                print("first is = \(tourInfo.competitors[0])")
            }
        }
    }
    
    func getResults() {
        print("=================> getResults")
        TennisApi.getResults(ofDate: "2016-07-06") { response in
            guard let results: TournamentResults = response else {
                print("no tours...")
                return
            }

        
            print("tournament = \(results.tournament)")
            if results.results.count > 0 {
                print("first result is = \(results.results[0])")
            }
        }
    }
    
    func getSchedule(_ of: String) {
        print("=================> getSchedule of \(of)")
        TennisApi.getSchedule(ofDate: of) { response in
            guard let results: TournamentSchedule = response else {
                print("no tours...")
                return
            }

        
            print("tournament = \(results.tournament)")
            if results.sportEvents.count > 0 {
                print("first schedule is = \(results.sportEvents[0])")
            }
        }
    }
    
    func getLiveSummary() {
           print("=================> getLiveSummary ")
           TennisApi.getLiveSummary() { response in
               guard let results: TournamentSummary = response else {
                   print("no tours...")
                   return
               }

           
               print("tournament = \(results.tournament)")
            if results.summaries.count > 0 {
                   print("first summary is = \(results.summaries[0])")
               }
           }
       }
    
    func getMatchProbability() {
        print("=================> getMatchProbability ")
        TennisApi.getMatchProbabilities("sr:match:21493533") { response in
            guard let results: MatchProbability = response else {
                print("no prob...")
                return
            }

            print(results)
        }
    }
    
    func getMatchSummary() {
        print("=================> getMatchSummary ")
        TennisApi.getMatchSummary("sr:match:21493533") { response in
            guard let results: MatchResult = response else {
                print("no prob...")
                return
            }

            print(results)
        }
    }
    
    func getMatchTimeline() {
        print("=================> getMatchTimeline ")
        TennisApi.getMatchTimeline("sr:match:21493533") { response in
            guard let results: MatchResult = response else {
                print("no prob...")
                return
            }

            print(results)
        }
    }
    
    func getPlayerProfile(_ idPlayer: String) {
        print("=================> getPlayerProfile \(idPlayer) ")
        TennisApi.getPlayerProfile(idPlayer) { response in
            guard let results: PlayerProfile = response else {
                print("no profile...")
                return
            }

            print(results)
        }
    }
    
    func getPlayerRankings() {
        print("=================> getPlayerRankings ")
        TennisApi.getPlayerRankings() { response in
            guard let results: PlayerRankings = response else {
                print("no profile...")
                return
            }

            print("All ranks = \(results.rankings.count)")
            print("First is = \(results.rankings[1].playerRankings[0])")
        }
    }
    
    func getPlayerHeadToHead(from: String, vs: String) {
          print("=================> getPlayerHeadToHead \(from) vs \(vs) ")
        TennisApi.getHeadToHead(from, versus: vs) { response in
              guard let results: HeadToHead = response else {
                  print("no profile...")
                  return
              }

              print("head to head = \(results)")
          }
      }
}

