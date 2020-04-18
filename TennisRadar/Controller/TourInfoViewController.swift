//
//  TourInfoViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/24/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class TourInfoViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Props
    var tournamentId: String? = nil
    var tournamentInfo: TournamentInfo?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var surface: UILabel!
    @IBOutlet weak var complex: UILabel!
    @IBOutlet weak var players: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var winner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTourInfo()
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
                self.activityIndicator.stopAnimating()
                ControllerUtil.presentAlert(self, title: "Alert", message: "No info found for \(tourInfo)")
                return
            }
            
            self.tournamentInfo = tournamentInfo
            self.loadData()
        }
    }
    
    private func clearValues() {
        name.text = ""
        date.text = ""
        surface.text = ""
        complex.text = ""
        players.text = ""
        status.text = ""
        winner.text = ""
    }
    
    private func loadData() {
        clearValues()
        
        if let tourInfo = tournamentInfo {
            name.text = tourInfo.tournament.currentSeason?.name ?? ""
            if let currSeason = tournamentInfo?.tournament.currentSeason {
                date.text = "From \(currSeason.startDate ?? "") to \(currSeason.endDate ?? "")"
            }
            
            if let surf = tourInfo.info.surface {
                surface.text = "Surface: \(surf)"
            }
            complex.text = tourInfo.info.complex ?? ""
            players.text = "Total of Competitors: \(tourInfo.info.numberOfQualifiedCompetitors ?? 0)"
            if let currStatus = tourInfo.info.tournamentStatus {
                status.text = "Current Status: \(currStatus)"
            }
            
            if let lastWinner = tourInfo.winnerLastSeason {
                winner.text = "Last Winner: \(lastWinner.name)"
            }
        }
        
        hiddenIfEmpty(name)
        hiddenIfEmpty(date)
        hiddenIfEmpty(surface)
        hiddenIfEmpty(complex)
        hiddenIfEmpty(players)
        hiddenIfEmpty(status)
        hiddenIfEmpty(winner)
    }
    
    private func hiddenIfEmpty(_ label: UILabel) {
        label.isHidden = label.text?.count == 0
    }
}
