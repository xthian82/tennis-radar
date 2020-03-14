//
//  SettingsViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/8/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
 
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TournamentManager.shared.tours.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TournamentManager.shared.tours[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TournamentViewCell
        if cell.markTournamentView.image == UIImage(named: "untick") {
            cell.markTournamentView.image = UIImage(named: "tick")
        } else {
            cell.markTournamentView.image = UIImage(named: "untick")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tour: String = TournamentManager.shared.tours[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellId") as! TournamentViewCell
        cell.tournamentNameLabel.text = TournamentManager.shared.levels[tour]?[indexPath.row]
        cell.markTournamentView.image = UIImage(named: "untick")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tour: String = TournamentManager.shared.tours[section]
        return TournamentManager.shared.levels[tour]?.count ?? 0
    }
}
