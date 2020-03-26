//
//  PlayerInfoViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/25/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UIViewController, UINavigationControllerDelegate {
    
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
        
        TennisApi.getPlayerProfile(playerId) { response in
            guard let playerData = response else {
                print("no info found for player \(playerId)")
                return
            }
                   
            self.playerProfile = playerData
            print("info returned \(String(describing: self.playerProfile))")
        }
    }
}
