//
//  PlayerInfoViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/25/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var playerId: String? = nil
    var playerProfile: PlayerProfile?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPlayerProfile()
    }
    
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getPlayerProfile() {
        guard let playerId = playerId else {
            print("no id player")
           return
        }
        activityIndicator.startAnimating()
        TennisApi.getPlayerProfile(playerId) { response in
            self.activityIndicator.stopAnimating()
            guard let playerData = response else {
                print("no info found for player \(playerId)")
                return
            }
                   
            self.playerProfile = playerData
            print("info returned \(String(describing: self.playerProfile))")
            self.activityIndicator.stopAnimating()
        }
    }
}
