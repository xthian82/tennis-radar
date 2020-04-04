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
//    var playerProfile: PlayerProfile?
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
    
    //MARK: - Controller Functions
    override func viewDidLoad() {
        uiscrollView.delegate = self
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
        print("searching for \(playerId)")
        guard let playerId = playerId else {
            print("no id player")
           return
        }
        activityIndicator.startAnimating()
        TennisApi.getPlayerProfile(playerId) { response in
            self.activityIndicator.stopAnimating()
            guard let playerData: PlayerProfile = response else {
                print("no info found for player \(playerId)")
                return
            }
            
            let player = playerData.player
            self.playerName.text = player.name
            if let countryCode = player.countryCode {
                self.countryFlag.image = UIImage(named: countryCode)
            }
            self.countryName.text = player.nationality
            self.birthdate.text = player.dateOfBirth
            self.handedness.text = player.handedness
            self.activityIndicator.stopAnimating()
            self.height.text = self.optIntString(player.height)
            self.weight.text = self.optIntString(player.weight)
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
        }
    }
    
    // MARK: - Helpers
    func optIntString(_ value: Int?, tag: String = "--") -> String {
        if let val = value {
            return "\(val)"
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
