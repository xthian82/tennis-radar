//
//  DataController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/14/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import CoreData

class DataController {
    
    static let shared = DataController(modelName: "TennisRadar")
    private let lockQueue = DispatchQueue(label: "DataController.lockQueue")
    
    let container: NSPersistentContainer
        
    var viewContext: NSManagedObjectContext {
        get {
            return lockQueue.sync {
                return container.viewContext
            }
        }
    }
        
    func configureContexts() {
        viewContext.automaticallyMergesChangesFromParent = true
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
        
    private init(modelName: String) {
        container = NSPersistentContainer(name: modelName)
        load()
    }
        
    private func load(completion: (() -> Void)? = nil) {
        container.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            //self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
    
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleObject(object: NSManagedObject) {
        viewContext.delete(object)
        saveContext()
    }
}
