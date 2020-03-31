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
        //getTourSumm()
        //getTourSch()
    }
    
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getTourInfo() {
        guard let tourInfo = tournamentId else {
            print("no tour")
            return
        }
        //activityIndicator.startAnimating()
        TennisApi.getTournamentInfo(tourInfo) { response in
            self.activityIndicator.stopAnimating()
            guard let tournamentInfo = response else {
                print("no info found for \(tourInfo)")
                return
            }
            
            self.tournamentInfo = tournamentInfo
            print("\n\n\ninfo returned \(tournamentInfo)")
        }
    }
    func getTourSumm() {
        guard let tourInfo = tournamentId else {
            print("no tour")
            return
        }
        TennisApi.getTournamentSummary(tourInfo) { response in
            guard let tournamentSummary = response else {
                print("no sum found for \(tourInfo)")
                return
            }
            
            print("\n\n\nsum returned \(tournamentSummary)")
        }
    }
    func getTourSch() {
        guard let tourInfo = tournamentId else {
            print("no tour")
            return
        }
        
        TennisApi.getTournamentSchedule(tourInfo) { response in
            self.activityIndicator.stopAnimating()
            guard let tournamentSchedule = response else {
                print("no schedule found for \(tourInfo)")
                return
            }
            print("\n\n\nschedule returned \(tournamentSchedule)")
        }
    }
}
