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
    let maxRank = 15
    let playerInfo = "playerInfo"
    var selectedIndex: IndexPath = []
    var ranks: [String: [Ranking]] = [String: [Ranking]]()
    var currentWeek: [String: Int] = [String: Int]()
    var currentYear: [String: Int] = [String: Int]()
    
    // MARK:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPlayersRankings()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == playerInfo {
            let nav = segue.destination as! UINavigationController
            let playerInfoVC = nav.topViewController as! PlayerInfoViewController

            let ranking = ranks[TournamentManager.shared.types[selectedIndex.section]]![selectedIndex.row]
            playerInfoVC.playerId = ranking.player?.id
        }
    }
    
    // MARK: - Table Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TournamentManager.shared.types.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranks[TournamentManager.shared.types[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        performSegue(withIdentifier: playerInfo, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeaderView(title: TournamentManager.shared.types[section])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankingCell")!
        if let ranking: Ranking = ranks[TournamentManager.shared.types[indexPath.section]]?[indexPath.row] {
            cell.textLabel?.text = "\(ranking.rank). "
            
            if let player = ranking.player {
            cell.detailTextLabel?.text = "\(player.name) \(player.countryCode ?? "") \(ranking.points) pts"
            }
        }
        
        return cell
    }
    
    // MARK: - Service
    func getPlayersRankings() {
        TennisApi.getPlayerRankings { response in
            guard let rankings: PlayerRankings = response else {
                print("no ranks...")
                return
            }
            
            self.currentWeek.removeAll()
            self.ranks.removeAll()
            
            for rank in rankings.rankings {
                self.currentWeek[rank.type] = rank.week
                var rankPlayers: [Ranking] = [Ranking]()
                for playerRank in rank.playerRankings {
                    if playerRank.rank > self.maxRank {
                        break
                    }
                    rankPlayers.append(playerRank)
                }
                self.ranks[rank.type] = rankPlayers
            }
            self.tableView.reloadData()
        }
    }
}
