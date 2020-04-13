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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
        getTourInfo()
    }
    
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getTourInfo() {
        guard let tourInfo = tournamentId else {
            ControllerUtil.presentAlert(self, title: "Error", message: "No tour selected")
            return
        }
        activityIndicator.startAnimating()
        TennisApi.getTournamentInfo(tourInfo) { response in
            self.activityIndicator.stopAnimating()
            guard let tournamentInfo = response else {
                ControllerUtil.presentAlert(self, title: "Alert", message: "No info found for \(tourInfo)")
                return
            }
            
            self.tournamentInfo = tournamentInfo
            // TODO: show details
        }
    }
}
