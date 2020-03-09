//
//  SettingsViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/8/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellId")!
        cell.detailTextLabel?.text = TournamentManager.shared.leagues[indexPath.row]
                  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TournamentManager.shared.leagues.count
    }
}
