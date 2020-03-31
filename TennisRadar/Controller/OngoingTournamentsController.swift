//
//  OngoingTournamentsController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/7/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class OngoingTournamentsController: UITableViewController {
    
    let tournamentInfo = "showTournamentInfo"
    var tournaments: [Tournament]? = nil
    //var selectedIndex = -1
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Window functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = activityIndicator
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getOngoingTournaments()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {
            print("no selection!!!")
            return
        }
        
        if segue.identifier == tournamentInfo && selectedIndex.row >= 0 {
            let nav = segue.destination as! UINavigationController
            let tourInfoVC = nav.topViewController as! TourInfoViewController
            print(" +++ preparedSelected \(selectedIndex)")
            tourInfoVC.tournamentId = tournaments?[selectedIndex.row].id
        }
    }
    
    // MARK: - Table functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: tournamentInfo, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ongoingCell")!
        if let tournament = self.tournaments?[indexPath.row] {
            print("** id \(tournament.id), row \(indexPath), => name = \(tournament.name)")
            cell.textLabel?.text = tournament.name
            if let season = tournament.currentSeason, let start = season.startDate, let end = season.endDate {
                cell.detailTextLabel?.text = "From \(start) to \(end)"
            }
        }
        
        return cell
    }
    
    // MARK: - Service
    func getOngoingTournaments() {
        activityIndicator.startAnimating()
        TennisApi.getOngoingTournaments { response in
            self.activityIndicator.stopAnimating()
            guard let tournaments: Tournaments = response else {
                print("no tours...")
                return
            }
            self.tournaments = tournaments.tournaments
            self.tableView.reloadData()
        }
    }
}
