//
//  ViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // getTournaments()
        // getOngoingTournaments
        //getTournamentSummary()
        getTournamentSchedule()
        getTournamentResults()
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
        
    func getOngoingTournaments() {
        print("=================> getOngoingTournaments")
        TennisApi.getOngoingTournaments { response in
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
        TennisApi.getTournamentSchedule("sr:tournament:2553") { response in
            guard let tourSummary: TournamentSchedule = response else {
                print("no tours...")
                return
            }

            print("schedule = \(tourSummary)")
        }
    }

    func getTournamentResults() {
        print("=================> getTournamentResults")
        TennisApi.getTournamentResults("sr:tournament:2553") { response in
            guard let toursResults: TournamentResults = response else {
                print("no tours...")
                return
            }

            print("tournament = \(toursResults.tournament)")
    
            print("total = \(toursResults.results.count)")
            if toursResults.results.count > 0 {
                print (print("first is = \(toursResults.results[0])"))
            }
        }
    }
}

