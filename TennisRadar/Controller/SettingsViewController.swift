//
//  SettingsViewController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/8/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
 
    //MARK: - Properties
    @IBOutlet weak var wtaPremierSingles: UISwitch!
    @IBOutlet weak var wtaInternationalSingles: UISwitch!
    @IBOutlet weak var wtaChampionSingles: UISwitch!
    @IBOutlet weak var wtaGrandSlamSingles: UISwitch!
    @IBOutlet weak var wtaPremierDoubles: UISwitch!
    @IBOutlet weak var wtaInternationalDoubles: UISwitch!
    @IBOutlet weak var wtaChampDoubles: UISwitch!
    @IBOutlet weak var wtaGrandSlamDoubles: UISwitch!
    @IBOutlet weak var atpThousandSingles: UISwitch!
    @IBOutlet weak var atpThousandDoubles: UISwitch!
    @IBOutlet weak var atpHundredSingles: UISwitch!
    @IBOutlet weak var atpHundredDoubles: UISwitch!
    @IBOutlet weak var atpTwoHundSingles: UISwitch!
    @IBOutlet weak var atpTwoHundDoubles: UISwitch!
    @IBOutlet weak var atpFinalesSingles: UISwitch!
    @IBOutlet weak var atpFinalesDoubles: UISwitch!
    @IBOutlet weak var atpGrandSlamSingles: UISwitch!
    @IBOutlet weak var atpGrandSlamDoubles: UISwitch!
    @IBOutlet weak var wtaSingles: UISwitch!
    @IBOutlet weak var wtaDoubles: UISwitch!
    @IBOutlet weak var atpSingles: UISwitch!
    @IBOutlet weak var atpDoubles: UISwitch!

    var wtaCategoriesSingles: [String:UISwitch]!
    var wtaCategoriesDoubles: [String:UISwitch]!
    var atpCategoriesSingles: [String:UISwitch]!
    var atpCategoriesDoubles: [String:UISwitch]!
    var tournaments: [String:UISwitch]!
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        wtaCategoriesSingles = [TournamentManager.wtaPremierSingles: wtaPremierSingles,
                                TournamentManager.wtaInternationalSingles: wtaInternationalSingles,
                                TournamentManager.wtaChampionshipsSingles: wtaChampionSingles,
                                TournamentManager.wtaGrandSlamSingles: wtaGrandSlamSingles]
        
        wtaCategoriesDoubles = [TournamentManager.wtaPremierDoubles: wtaPremierDoubles,
                                TournamentManager.wtaInternationalDoubles: wtaInternationalDoubles,
                                TournamentManager.wtaChampionshipsDoubles: wtaChampDoubles,
                                TournamentManager.wtaGrandSlamDoubles: wtaGrandSlamDoubles]
        
        atpCategoriesSingles = [TournamentManager.atpOneThousandSingles: atpThousandSingles,
                                TournamentManager.atpFiveHundredSingles: atpHundredSingles,
                                TournamentManager.atpTwoHundredSingles: atpTwoHundSingles,
                                TournamentManager.atpWorldTourSingles: atpFinalesSingles,
                                TournamentManager.atpGrandSlamSingles: atpGrandSlamSingles]

        atpCategoriesDoubles = [TournamentManager.atpOneThousandDoubles: atpThousandDoubles,
                                TournamentManager.atpFiveHundredDoubles: atpHundredDoubles,
                                TournamentManager.atpTwoHundredDoubles: atpTwoHundDoubles,
                                TournamentManager.atpWorldTourDoubles: atpFinalesDoubles,
                                TournamentManager.atpGrandSlamDoubles: atpGrandSlamDoubles]
        
        tournaments = [TournamentManager.wtaSingles: wtaSingles,
                       TournamentManager.wtaDoubles: wtaDoubles,
                       TournamentManager.atpSingles: atpSingles,
                       TournamentManager.atpDoubles: atpDoubles]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSwitches(wtaCategoriesSingles)
        setupSwitches(wtaCategoriesDoubles)
        setupSwitches(atpCategoriesSingles)
        setupSwitches(atpCategoriesDoubles)
        setupSwitches(tournaments)
    }
    
    // MARK: - Table Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeaderView(title: TournamentManager.shared.tours[section])
        /*let headerView = UIView(frame: CGRect(x: 15, y: 8, width: self.tableView.frame.size.width - 15, height: 22))
        let label = UILabel(frame: headerView.frame)
        label.text = TournamentManager.shared.tours[section]
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        headerView.addSubview(label)
        return headerView;*/
    }
    
    // MARK: - Button Actions
    @IBAction func clicked(_ sender: UISwitch) {
        switch sender {
        case wtaPremierSingles:
            saveOption(TournamentManager.wtaPremierSingles, isOn: sender.isOn)
            break
        case wtaPremierDoubles:
            saveOption(TournamentManager.wtaPremierDoubles, isOn: sender.isOn)
            break
        case wtaInternationalSingles:
            saveOption(TournamentManager.wtaInternationalSingles, isOn: sender.isOn)
            break
        case wtaInternationalDoubles:
            saveOption(TournamentManager.wtaInternationalDoubles, isOn: sender.isOn)
            break
        case wtaChampionSingles:
            saveOption(TournamentManager.wtaChampionshipsSingles, isOn: sender.isOn)
            break
        case wtaChampDoubles:
            saveOption(TournamentManager.wtaChampionshipsDoubles, isOn: sender.isOn)
            break
        case wtaGrandSlamSingles:
            saveOption(TournamentManager.wtaGrandSlamSingles, isOn: sender.isOn)
            break
        case wtaGrandSlamDoubles:
            saveOption(TournamentManager.wtaGrandSlamDoubles, isOn: sender.isOn)
            break
        case atpThousandSingles:
            saveOption(TournamentManager.atpOneThousandSingles, isOn: sender.isOn)
            break
        case atpThousandDoubles:
            saveOption(TournamentManager.atpOneThousandDoubles, isOn: sender.isOn)
            break
        case atpHundredSingles:
            saveOption(TournamentManager.atpFiveHundredSingles, isOn: sender.isOn)
            break
        case atpHundredDoubles:
            saveOption(TournamentManager.atpFiveHundredDoubles, isOn: sender.isOn)
            break
        case atpTwoHundSingles:
            saveOption(TournamentManager.atpTwoHundredSingles, isOn: sender.isOn)
            break
        case atpTwoHundDoubles:
            saveOption(TournamentManager.atpTwoHundredDoubles, isOn: sender.isOn)
            break
        case atpFinalesSingles:
            saveOption(TournamentManager.atpWorldTourSingles, isOn: sender.isOn)
            break
        case atpFinalesDoubles:
            saveOption(TournamentManager.atpWorldTourDoubles, isOn: sender.isOn)
            break
        case atpGrandSlamSingles:
            saveOption(TournamentManager.atpGrandSlamSingles, isOn: sender.isOn)
            break
        case atpGrandSlamDoubles:
            saveOption(TournamentManager.atpGrandSlamDoubles, isOn: sender.isOn)
            break
        default:
            print("Invalid")
            break
        }
    }
    
    // MARK: WTA
    @IBAction func wtaClick(_ sender: UISwitch) {
        switch sender {
        case wtaSingles:
            clickAll(wtaCategoriesSingles, isOn: sender.isOn)
            saveOption(TournamentManager.wtaSingles, isOn: sender.isOn)
            break
        case wtaDoubles:
            clickAll(wtaCategoriesDoubles, isOn: sender.isOn)
            saveOption(TournamentManager.wtaDoubles, isOn: sender.isOn)
            break
        default:
            print("invalid wta")
            break
        }
    }
    
    // MARK: ATP
    @IBAction func atpClick(_ sender: UISwitch) {
        switch sender {
        case atpSingles:
            clickAll(atpCategoriesSingles, isOn: sender.isOn)
            saveOption(TournamentManager.atpSingles, isOn: sender.isOn)
            break
        case atpDoubles:
            clickAll(atpCategoriesDoubles, isOn: sender.isOn)
            saveOption(TournamentManager.atpDoubles, isOn: sender.isOn)
            break
        default:
            print("invalid atp")
            break
        }
    }
    
    // MARK: - Helpers
    private func setupSwitches(_ switches: [String : UISwitch]) {
        for (key, uiSwitch) in switches {
            uiSwitch.isOn = UserDefaults.standard.bool(forKey: key)
        }
    }
    
    private func clickAll(_ switches: [String:UISwitch], isOn: Bool) {
        for (_, swt) in switches {
            clickOnDemand(swt, isOn: isOn)
        }
    }
    
    private func clickOnDemand(_ sender: UISwitch, isOn: Bool) {
        if sender.isOn != isOn {
            sender.isOn = isOn
            clicked(sender)
        }
    }
    
    private func saveOption(_ name: String, isOn: Bool) {
        //print("name = \(name) is \(isOn)")
        UserDefaults.standard.set(isOn, forKey: name)
    }
}
