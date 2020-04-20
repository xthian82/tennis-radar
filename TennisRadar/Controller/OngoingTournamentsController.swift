//
//  OngoingTournamentsController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/7/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import CoreData

class OngoingTournamentsController: UITableViewController {

    var tournaments: [Tournament]? = nil
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var fetchedTourTypesController: NSFetchedResultsController<TourType>!
    
    // MARK: - Window functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = activityIndicator
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Constants.fontNavBar ?? UIFont.systemFont(ofSize: 17)]
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchedTourTypesController = super.setupFetchController(CoreDataUtil.createFetchRequest(), delegate: self)
        getOngoingTournaments { _ in }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedTourTypesController = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {
            return
        }
        
        if segue.identifier == Constants.showTournamentInfoSegue && selectedIndex.row >= 0 {
            let tourInfoVC = segue.destination as! TourInfoViewController
            tourInfoVC.tournamentId = tournaments?[selectedIndex.row].id
        }
    }
    
    // MARK: - Table functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.showTournamentInfoSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let size = tournaments?.count ?? 0
        if size > 0 {
            tableView.separatorStyle = .singleLine
        }
        return size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ongoingTourCellId)!
        if let tournament = self.tournaments?[indexPath.row] {
            cell.textLabel?.text = tournament.name
            if let season = tournament.currentSeason, let start = season.startDate, let end = season.endDate {
                cell.detailTextLabel?.text = "From \(start) to \(end)"
            }
        }
        
        return cell
    }
    
    // MARK: - Service
    func getOngoingTournaments(completion: @escaping (_ didFinish: Bool) -> Void) {
        activityIndicator.startAnimating()
        TennisApi.getOngoingTournaments { response in
            self.activityIndicator.stopAnimating()
            guard let tournaments: Tournaments = response else {
                 ControllerUtil.presentAlert(self, title: "Error", message: "No tournaments found")
                completion(false)
                return
            }
            self.tournaments = tournaments.tournaments.filter({ (tseason) -> Bool in
                return CoreDataUtil.filterTourTypes(self.fetchedTourTypesController.fetchedObjects, byName: tseason.filter())?.isOn ?? false
            })
            self.tableView.reloadData()
            completion(true)
        }
    }
}

extension OngoingTournamentsController: NSFetchedResultsControllerDelegate {
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        default:
            print("unkonwn!")
        }
    }
    
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        getOngoingTournaments { response in
            self.tableView.beginUpdates()
        }
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

