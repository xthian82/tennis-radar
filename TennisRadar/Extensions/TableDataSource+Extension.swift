//
//  TableDataSource+Extension.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/19/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import CoreData

extension UITableViewController {
    
    // MARK: - Utils for Filter in CoreData
    func performFetchRequest<Type: NSManagedObject>(_ fetchedResultController: NSFetchedResultsController<Type>) {
        do {
            try fetchedResultController.performFetch()
        } catch {
            fatalError("fetch error \(error.localizedDescription)")
        }
    }

    func setupFetchController<Type: NSManagedObject>(_ fetchRequest: NSFetchRequest<Type>, delegate: NSFetchedResultsControllerDelegate, cacheName: String? = nil) -> NSFetchedResultsController<Type> {

        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataController.shared.viewContext, sectionNameKeyPath: nil, cacheName: cacheName)
           
        fetchedResultController.delegate = delegate

        performFetchRequest(fetchedResultController)
        return fetchedResultController
    }
}
