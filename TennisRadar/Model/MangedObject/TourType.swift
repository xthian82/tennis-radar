//
//  TourType.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/19/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import CoreData

extension TourType {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
