//
//  TourInfoViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/24/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class TourInfoViewController: UIViewController, UINavigationControllerDelegate {
    
    var tournamentId: String? = nil
    var tournamentInfo: TournamentInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTourInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getTourInfo() {
        guard let tourInfo = tournamentId else {
            print("no tour")
            return
        }
        TennisApi.getTournamentInfo(tourInfo) { response in
            guard let tournamentInfo = response else {
                print("no info found for \(tourInfo)")
                return
            }
            
            self.tournamentInfo = tournamentInfo
            print("info returned \(tournamentInfo)")
        }
    }
}
