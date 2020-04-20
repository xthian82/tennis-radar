//
//  CoreDataUtil.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/19/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import CoreData

class CoreDataUtil {
    
    class func createFetchRequest(predicate: NSPredicate? = nil) -> NSFetchRequest<TourType> {
        let fetchRequest: NSFetchRequest<TourType> = TourType.fetchRequest()
           
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
           
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        return fetchRequest
    }
    
    class func filterTourTypes(_ tourTypes: [TourType]?, byName: String) -> TourType? {
        return tourTypes?.filter({ (tourType) -> Bool in
            return tourType.name == byName
        }).first
    }
    
    class func addTourType(name: String, isOn: Bool) {
        let tour = TourType(context: DataController.shared.viewContext)
        tour.name = name
        tour.isOn = isOn
        
        DataController.shared.saveContext()
    }
    
    class func updateTourType(tourType: TourType, isOn: Bool) {
        tourType.isOn = isOn
        DataController.shared.saveContext()
    }
}
