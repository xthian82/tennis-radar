//
//  LiveSummaryViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class LiveSummaryViewController: UITableViewController, CalendarPickControllerDelegate {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var selectedDate: String?
    var tournamentResults = [String: [MatchResult]]()
    var tournamentsLoaded = [Int: String]()
    var matchesLoaded = [IndexPath: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundView = activityIndicator
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getResults(ofDate: "2019-07-14")
        //getLiveSummary()*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.showCalendarSegue {
            let calendarController = segue.destination as! CalendarPickController
            calendarController.delegate = self
        } else if segue.identifier == Constants.showMatchDetailsSegue {
            guard let selectedIndex = tableView.indexPathForSelectedRow else {
                return
            }
            
            let nav = segue.destination as! UINavigationController
            let matchDetailVC = nav.topViewController as! MatchDetailsController
            print("matchId = \(matchesLoaded[selectedIndex])")
            matchDetailVC.matchId = matchesLoaded[selectedIndex]
        }
    }
    
    func handleSelection(data: String) {
        selectedDate = data
        print("now date is \(String(describing: selectedDate))")
    }
       
    // MARK: Table Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tournamentResults.keys.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura-Bold", size: 15)
        header.textLabel?.textAlignment = .center
        header.textLabel?.textColor = UIColor.black
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tournamentsLoaded[section] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.showMatchDetailsSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let keyStr = tournamentsLoaded[section] else {
            return 0
        }
        
        guard let itemsAtKey = tournamentResults[keyStr] else {
            return 0
        }
        if itemsAtKey.count > 0 {
            tableView.separatorStyle = .singleLine
        }
        
        return itemsAtKey.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.liveResultViewCellId) as! LiveResultViewCell
        
        guard let tourName = tournamentsLoaded[indexPath.section] else {
            return cell
        }
        
        guard let matchResults = tournamentResults[tourName] else {
            return cell
        }
        
        let matchResult = matchResults[indexPath.row]
        matchesLoaded[indexPath] = matchResult.sportEvent.id
        cell.loadResult(matchResult)
        
        return cell
    }
    
    // MARK: - test funcs
    func getResults(ofDate: String?) {
        activityIndicator.startAnimating()
        TennisApi.getResults(ofDate: ofDate) { response in
            self.clearAll()
            self.activityIndicator.stopAnimating()
            guard let tResults: TournamentResults = response else {
                print("no tours...")
                return
            }

            for tournamentResult in tResults.results {
                let sEvent = tournamentResult.sportEvent
                guard let tournament = sEvent.tournament else {
                    continue
                }
                guard let catLevel = tournament.category.level else {
                    continue
                }
                
                if !self.tournamentResults.keys.contains(tournament.name) {
                    self.tournamentResults[tournament.name] = []
                    self.tournamentsLoaded[self.tournamentResults.keys.count - 1] = tournament.name
                }
                
                self.tournamentResults[tournament.name]!.append(tournamentResult)
            }
            self.tableView.reloadData()
        }
    }
    
    private func clearAll() {
        tournamentResults.removeAll()
        tournamentsLoaded.removeAll()
        matchesLoaded.removeAll()
    }
}

