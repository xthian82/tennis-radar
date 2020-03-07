//
//  HeadToHead.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/6/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct HeadToHead: Codable {

    let generatedAt: String
    let schema: String
    let players: [Player]
    let lastMeetings: Meetings
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case players
        case lastMeetings = "last_meetings"
    }
}
