//
//  LiveSummaryViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class LiveSummaryViewController: UITableViewController,
    CalendarPickControllerDelegate {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var tournamentResults = [String: [MatchResult]]()
    var tournamentsLoaded = [Int: String]()
    var matchesLoaded = [IndexPath: String]()
    var selectedDate: String? = nil
    var isFromRefresh = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundView = activityIndicator
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl = ControllerUtil.getRefreshControl(self, selector: #selector(handleRefresh))
   }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getResults(ofDate: selectedDate)
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
            matchDetailVC.matchId = matchesLoaded[selectedIndex]
        }
    }
    
    func handleSelection(data: String) {
        selectedDate = data
        UserDefaults.standard.set(data, forKey: Constants.pickedDate)
        self.clearAll()
        self.tableView.backgroundView = activityIndicator
        getResults(ofDate: selectedDate)
    }
    
    @objc func handleRefresh() {
        if tableView.numberOfSections != 0 {
            print("quiting refresh... no empty table")
            return
        }

        isFromRefresh = true
        self.tableView.backgroundView = ControllerUtil.getLabel(self.view, text: "Refreshing.")
        getResults(ofDate: selectedDate)
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
        var size = 0
        if let keyStr = tournamentsLoaded[section], let itemsAtKey = tournamentResults[keyStr] {
            size = itemsAtKey.count
        }
        
        if size > 0 {
            tableView.separatorStyle = .singleLine
        }
        
        return size
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
        print("getting results of \(ofDate ?? "live")")
        
        if !isFromRefresh {
            activityIndicator.startAnimating()
        }
        TennisApi.getResults(ofDate: ofDate) { response in
            self.clearAll()
            if !self.isFromRefresh {
                self.activityIndicator.stopAnimating()
            } else {
                self.refreshControl?.endRefreshing()
            }
            guard let tResults: TournamentResults = response else {
                self.tableView.backgroundView = ControllerUtil.getLabel(self.view, text: "No data is currently available. Please pull down to refresh.")
                return
            }

            for tournamentResult in tResults.results {
                let sEvent = tournamentResult.sportEvent
                guard let tournament = sEvent.tournament else {
                    continue
                }

                if !UserDefaults.standard.bool(forKey: tournament.filter()) {
                    continue
                }
                
                if !self.tournamentResults.keys.contains(tournament.name) {
                    self.tournamentResults[tournament.name] = []
                    self.tournamentsLoaded[self.tournamentResults.keys.count - 1] = tournament.name
                }
                
                self.tournamentResults[tournament.name]!.append(tournamentResult)
            }
            self.tableView.reloadData()
            
            if self.tournamentResults.count == 0 {
                self.tableView.backgroundView = ControllerUtil.getLabel(self.view, text: "No data found, you can pick a date in calendar")
            }
        }
    }
    
    private func clearAll() {
        tournamentResults.removeAll()
        tournamentsLoaded.removeAll()
        matchesLoaded.removeAll()
    }
}

