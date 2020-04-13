//
//  PlayerInfoViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/25/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

// Flag Icons borrowed from
// https://github.com/madebybowtie/FlagKit

import UIKit

class PlayerInfoViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var playerId: String? = nil
    var playerProfile: PlayerProfile?
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var handedness: UILabel!
    @IBOutlet weak var turnedPro: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var topSingleRank: UILabel!
    @IBOutlet weak var topDoubleRank: UILabel!
    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var raceRank: UILabel!
    @IBOutlet weak var uiscrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!

    
    //MARK: - Controller Functions
    override func viewDidLoad() {
        uiscrollView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPlayerProfile()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
    
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Api
    func getPlayerProfile() {
        clearData()
        guard let playerId = playerId else {
            ControllerUtil.presentAlert(self, title: "Error", message: "No player selected")
           return
        }
        activityIndicator.startAnimating()
        TennisApi.getPlayerProfile(playerId) { response in
            self.activityIndicator.stopAnimating()
            guard let playerData: PlayerProfile = response else {
                ControllerUtil.presentAlert(self, title: "Alert", message: "No info found for \(playerId)")
                return
            }
            
            self.playerProfile = playerData
            
            let player = playerData.player
            self.playerName.text = player.name
            if let countryCode = player.countryCode {
                self.countryFlag.image = UIImage(named: countryCode)
            }
            self.countryName.text = player.nationality
            self.birthdate.text = player.dateOfBirth
            self.handedness.text = player.handedness
            self.activityIndicator.stopAnimating()
            self.height.text = self.optIntString(player.height, fill: " cm.")
            self.weight.text = self.optIntString(player.weight, fill: " kg.")
            self.topSingleRank.text = self.optIntString(player.highestSinglesRanking) + self.optStringEnclosed(player.dateHighestSinglesRanking, tag: " on")
            self.topDoubleRank.text = self.optIntString(player.highestDoublesRanking) + self.optStringEnclosed(player.dateHighestDoublesRanking, tag: " on")
            
            self.turnedPro.text = self.optIntString(player.proYear)
            self.raceRank.text = "-"
            self.ranking.text = "-"
            for rank in playerData.rankings {
                if rank.type != "singles" {
                    continue
                }
                
                if let raceRank = rank.raceRanking, raceRank == true {
                    self.raceRank.text = "\(rank.rank), \(rank.points) pts." + self.optStringEnclosed(rank.rankingMovement, tag: " Mov.")

                } else {
                    self.ranking.text = "\(rank.rank), \(rank.points) pts." + self.optStringEnclosed(rank.rankingMovement, tag: " Mov.")
                }
            }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Helpers
    func clearData() {
        playerName.text = ""
        countryName.text = ""
        birthdate.text = ""
        handedness.text = ""
        turnedPro.text = ""
        height.text = ""
        weight.text = ""
        topSingleRank.text = ""
        topDoubleRank.text = ""
        ranking.text = ""
        raceRank.text = ""
        countryFlag.image = nil
    }
    
    func optIntString(_ value: Int?, fill: String = "", tag: String = "--") -> String {
        if let val = value {
            return "\(val)\(fill)"
        }
        
        return tag
    }
    
    func optStringEnclosed(_ value: Any?, tag: String) -> String {
        if let val = value {
            return "\(tag) (\(val))"
        }
        
        return ""
    }
}

extension PlayerInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerProfile?.statistics?.periods.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.playerStatCellId) as! TourStatViewCell
        
        if let stat = playerProfile?.statistics?.periods[indexPath.row] {
            let statistics = stat.statistics
            let toursStat = Double(statistics.tournamentsWon)/Double(statistics.tournamentsPlayed) * 100
            let matchesStat = Double(statistics.matchesWon)/Double(statistics.matchesPlayed)*100
            
            cell.yearLabel.text = "\(stat.year)"
            cell.toursPlayedLabel.text = "\(statistics.tournamentsPlayed)"
            cell.toursWonLabel.text = "\(statistics.tournamentsWon)"
            cell.matchesPlayedLabel.text = "\(statistics.matchesPlayed)"
            cell.matchesWonLabel.text = "\(statistics.matchesWon)"
            cell.tourStatLabel.text = "\(toursStat.truncate(places: 2))%"
            cell.matchesStatLabel.text = "\(matchesStat.truncate(places: 2))%"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        ControllerUtil.setHeaderView(view)
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        ControllerUtil.setHeaderView(view)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "YEAR - TP - TW - MP - MW - TS - MS"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "TP: Tournaments Played, TW: Tournaments Won, MP: Matches Played, MW: Matches Won, TS: Tournaments Stats, MS: Matches Stas"
    }
}
