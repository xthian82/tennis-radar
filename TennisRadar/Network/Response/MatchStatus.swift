//
//  MatchStatus.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

// DEPRECATE:
enum MatchStatus: String {
    case notStarted = "The match is scheduled to be played" //not_started
    case aboutToStart = "The match time has expired, awaiting play" //match_about_to_start
    case live = "The match is currently in progress"
    case closed = "The match finished"
    case ended = "The match is over"
    case interrupted = "The match interrupted, but coverage has stopped for a short time"
    case suspended = "Match suspended to a later time"
    case cancelled = "Match cancelled"
    case delayed = "Match delayed"
    case abandoned = "Match abandoned"
    case postponed = "Match has been postponed"
    case retired = "The match is incomplete as the result of one player"
    case walkover = "Walkover"
}

/*
1st_set – First set
2nd_set – Second set
3rd_set – Third set
4th_set – Fourth set
5th_set – Fifth set*/



