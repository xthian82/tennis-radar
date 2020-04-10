//
//  RankingViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/7/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class RankingViewController: UITableViewController {
    
    // MARK: - Properties
    
    var tourRanking: TourRanking?
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Windows Functions
    override func viewDidLoad() {
        tableView.backgroundView = activityIndicator
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {
            print("no selection!!!")
            return
        }
        
        if segue.identifier == Constants.showPlayerInfoSegue {
            let nav = segue.destination as! UINavigationController
            let playerInfoVC = nav.topViewController as! PlayerInfoViewController
            let ranking = tourRanking?.playerRankings[selectedIndex.row]
            playerInfoVC.playerId = ranking?.player?.id
        }
    }
    
    // MARK: - Table Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = tourRanking?.playerRankings.count, count > 0 {
            tableView.separatorStyle = .singleLine
            return Constants.maxRankPlayers
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.showPlayerInfoSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        ControllerUtil.setHeaderView(view, fontName: "Futura-Bold", ofSize: 17)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tourRanking?.type ?? ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.rankingCellId) as! RankingCellView
        if let ranking: Ranking = tourRanking?.playerRankings[indexPath.row] {
            cell.rankLabel.text = "\(ranking.rank). "
            
            if let player = ranking.player {
                let countryCode = player.countryCode ?? ""
                cell.countryFlag.image = UIImage(named: countryCode)
                cell.playerName.text = player.name
                cell.pointsLabel.text = "\(ranking.points) pts"
            }
        }
        
        return cell
    }
    
    // MARK: - Service
    func refresh() {
        self.tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }
}
