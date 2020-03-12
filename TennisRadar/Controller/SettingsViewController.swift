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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("didSelect \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath) as! TournamentViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellId") as! TournamentViewCell
        if cell.markTournamentView.image == UIImage(named: "untick") {
            cell.markTournamentView.image = UIImage(named: "tick")
        } else {
            cell.markTournamentView.image = UIImage(named: "untick")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellId") as! TournamentViewCell
        cell.tournamentNameLabel.text = TournamentManager.shared.leagues[indexPath.row]
        cell.markTournamentView.image = UIImage(named: "untick")
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TournamentManager.shared.leagues.count
    }
}
