import Foundation

struct Season: Codable {
    
       let id: String
    let name: String
    let startDate: String?
    let endDate: String?
    let year: String?
    let tournamentId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case startDate = "start_date"
        case endDate = "end_date"
        case year
        case tournamentId = "tournament_id"
    }
}


struct IdName: Codable {
    
    let id: String
    let name: String
    let level: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case level
    }
}


struct Tournament: Codable {
    
    let id: String
       let name: String
       let parentId: String?
       let sport: IdName
       let category: IdName
       let currentSeason: Season?
       let type: String?
       let gender: String?
       let countryFormat: Bool?
       
       enum CodingKeys: String, CodingKey {
           case id
           case name
           case parentId = "parent_id"
           case sport
           case category
           case currentSeason = "current_season"
           case type
           case gender
           case countryFormat = "country_format"
       }
    
    func filter() -> String {
        if let level = category.level {
           return "\(category.name)_\(level)_\(type ?? "")"
        }
        return "\(category.name)_\(type ?? "")"
    }
}

struct Tournaments: Codable {
    
    let generatedAt: String
    let schema: String
    let tournaments: [Tournament]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournaments
    }
}

struct Player: Codable {

    let id: String
    let name: String
    let nationality: String?
    let countryCode: String
    let abbreviation: String?
    let qualifier: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nationality
        case countryCode = "country_code"
        case abbreviation
        case qualifier
    }
}

struct Competitor: Codable {
    let id: String?
    let name: String?
    let bracketNumber: Int?
    let abbreviation: String?
    let qualifier: String?
    let players: [Player]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bracketNumber = "bracket_number"
        case abbreviation
        case qualifier
        case players
    }
}

struct TournamentRound: Codable {
    let type: String
    let name: String?
    let groupLongName: String?
    let cupRoundMatchNumber: Int?
    let cupRoundMatches: Int?
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
        case groupLongName = "group_long_name"
        case cupRoundMatchNumber = "cup_round_match_number"
        case cupRoundMatches = "cup_round_matches"
    }
}

struct Venue: Codable {
    let id: String
    let name: String
    let cityName: String?
    let countryName: String?
    let countryCode: String?
                       
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cityName = "city_name"
        case countryName = "country_name"
        case countryCode = "country_code"
    }
}

struct SportEvent: Codable {
    
    let id: String
    let scheduled: String
    let startTimeTbd: Bool?
    let tournamentRound: TournamentRound?
    let season: Season?
    let tournament: Tournament?
    let competitors: [Competitor]?
    let venue: Venue?
    let sportEventType: String?
    let estimated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case scheduled
        case startTimeTbd = "start_time_tbd"
        case tournamentRound = "tournament_round"
        case season
        case tournament
        case competitors
        case venue
        case sportEventType = "sport_event_type"
        case estimated
    }
}

struct SportEventConditions: Codable {
    let matchMode: String
    let venue: Venue?
     let championsTiebreak: Bool?
    
    enum CodingKeys: String, CodingKey {
        case matchMode = "match_mode"
        case venue
        case championsTiebreak = "champions_tiebreak"
    }
}

struct PeriodScore: Codable {
    let homeScore: Int?
    let awayScore: Int?
    let type: String
    let number: Int?
    
    enum CodingKeys: String, CodingKey {
        case homeScore = "home_score"
        case awayScore = "away_score"
        case type
        case number
    }
}


struct SportEventStatus: Codable {
    let status: String
    let homeScore: Int?
    let awayScore: Int?
    let winnerId: String?
    let periodScores: [PeriodScore]?
    let matchEnded: String?

    enum CodingKeys: String, CodingKey {
        case status
        case homeScore = "home_score"
        case awayScore = "away_score"
        case winnerId = "winner_id"
        case periodScores = "period_scores"
        case matchEnded = "match_ended"
    }
}
struct CoverageInfo: Codable {
    let liveCoverage: Bool?
    let playByPlay: Bool?
    let detailedServeOutcomes: Bool?
    
    enum CodingKeys: String, CodingKey {
        case liveCoverage = "live_coverage"
        case playByPlay = "play_by_play"
        case detailedServeOutcomes = "detailed_serve_outcomes"
    }
}
struct TournamentResult: Codable {
    let sportEvent: SportEvent
    let sportEventConditions: SportEventConditions?
    let sportEventStatus: SportEventStatus
    let coverageInfo: CoverageInfo?
    
    enum CodingKeys: String, CodingKey {
        case sportEvent = "sport_event"
        case sportEventConditions = "sport_event_conditions"
        case sportEventStatus = "sport_event_status"
        case coverageInfo = "coverage_info"
    }
}

struct TournamentResults: Codable {
    let generatedAt: String?
    let schema: String?
    let tournament: Tournament?
    let results: [TournamentResult]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournament
        case results
    }
}


struct TournamentSchedule: Codable {
    let generatedAt: String
    let schema: String?
    let tournament: Tournament?
    let sportEvents: [SportEvent]?
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournament
        case sportEvents = "sport_events"
    }
}

struct Outcome: Codable {

    let name: String
    let probability: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case probability
    }
}


struct Market: Codable {

    let name: String
    let outcomes: [Outcome]
    
    enum CodingKeys: String, CodingKey {
        case name
        case outcomes
    }
}

struct Markets: Codable {

    let markets: [Market]
    
    enum CodingKeys: String, CodingKey {
        case markets
    }
}

struct MatchProbability: Codable {
    let generatedAt: String
    let schema: String?
    let sportEvent: SportEvent
    let probabilities: Markets
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case sportEvent = "sport_event"
        case probabilities
    }
}

struct Stats: Codable {
    
    let aces: Int
    let doubleFaults: Int
    let pointsWon: Int
    let maxPointsInARow: Int
    let firstServePointsWon: Int
    let secondServcePointsWon: Int
    let totalBreakpoints: Int
    let breakpointsWon: Int
    let maxGamesInARow: Int
    let gamesWon: Int
    let firstServeSuccessful: Int
    let secondServeSuccesful: Int
    let servicePointsWon: Int
    let serviceGamesWon: Int
    let tiebreaksWon: Int
    let receiverPointsWon: Int
    
    enum CodingKeys: String, CodingKey {
        case aces
        case doubleFaults = "double_faults"
        case pointsWon = "points_won"
        case maxPointsInARow = "max_points_in_a_row"
        case firstServePointsWon = "first_serve_points_won"
        case secondServcePointsWon = "second_serve_points_won"
        case totalBreakpoints = "total_breakpoints"
        case breakpointsWon = "breakpoints_won"
        case maxGamesInARow = "max_games_in_a_row"
        case gamesWon = "games_won"
        case firstServeSuccessful = "first_serve_successful"
        case secondServeSuccesful = "second_serve_successful"
        case servicePointsWon = "service_points_won"
        case serviceGamesWon = "service_games_won"
        case tiebreaksWon = "tiebreaks_won"
        case receiverPointsWon = "receiver_points_won"
    }
}

struct TeamStat: Codable {

    let id: String
    let name: String
    let abbreviation: String
    let qualifier: String
    let statistics: Stats
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbreviation
        case qualifier
        case statistics
    }
}

struct Statistics: Codable {
    
    let teams: [TeamStat]
    
    enum CodingKeys: String, CodingKey {
        case teams
    }
}

public struct EventResult: Codable {
    //let generatedAt: String?
    //let schema: String?
    let sportEvent: SportEvent
    let sportEventConditions: SportEventConditions?
    let sportEventStatus: SportEventStatus
    let coverageInfo: CoverageInfo?
    let statistics: Statistics?
    
    enum CodingKeys: String, CodingKey {
        //case generatedAt = "generated_at"
        //case schema
        case sportEvent = "sport_event"
        case sportEventConditions = "sport_event_conditions"
        case sportEventStatus = "sport_event_status"
        case coverageInfo = "coverage_info"
        case statistics
    }
}

  
struct PeriodStat: Codable {

    let tournamentsPlayed: Int
    let tournamentsWon: Int
    let matchesPlayed: Int
    let matchesWon: Int
    
    enum CodingKeys: String, CodingKey {
        case tournamentsPlayed = "tournaments_played"
        case tournamentsWon = "tournaments_won"
        case matchesPlayed = "matches_played"
        case matchesWon = "matches_won"
    }
}

struct Surface: Codable {

    let type: String?
    let statistics: PeriodStat
    
    enum CodingKeys: String, CodingKey {
        case type
        case statistics
    }
}

struct Period: Codable {

    let year: Int
    let surfaces: [Surface]
    let statistics: PeriodStat
    
    enum CodingKeys: String, CodingKey {
        case year
        case surfaces
        case statistics
    }
}


struct Periods: Codable {

    let periods: [Period]
    
    enum CodingKeys: String, CodingKey {
        case periods
    }
}


struct Ranking: Codable {

     let playerId: String?
       let points: Int
       let rank: Int
       let raceRanking: Bool?
       let rankingMovement: Int?
       let tournamentsPlayed: Int?
       let name: String?
       let type: String?
       let player: Player?
       
       enum CodingKeys: String, CodingKey {
           case playerId = "player_id"
           case points
           case rank
           case raceRanking = "race_ranking"
           case rankingMovement = "ranking_movement"
           case tournamentsPlayed = "tournaments_played"
           case name
           case type
           case player
       }
}

  struct PlayerProfile: Codable {

    let player: Player
    let rankings: [Ranking]
    let statistics: Periods?
    let tournamentsPlayed: [Tournament]?
    
    enum CodingKeys: String, CodingKey {
        case player
        case rankings
        case statistics
        case tournamentsPlayed = "tournaments_played"
    }
}

struct Timeline: Codable {
    
    let id: Int
    let type: String
    let time: String?
    let periodName: String?
    let team: String?
    let homeScore: Int?
    let awayScore: Int?
    let server: String?
    let result: String?
    let firstServeFault: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case time
        case periodName = "period_name"
        case team
        case homeScore = "home_score"
        case awayScore = "away_score"
        case server
        case result
        case firstServeFault = "first_serve_fault"
    }
}

struct MatchStats: Codable {
    
    let aces: Int
    let doubleFaults: Int
    let pointsWon: Int
    let maxPointsInARow: Int
    let firstServePointsWon: Int
    let secondServcePointsWon: Int
    let totalBreakpoints: Int
    let breakpointsWon: Int
    let maxGamesInARow: Int
    let gamesWon: Int
    let firstServeSuccessful: Int
    let secondServeSuccesful: Int
    let servicePointsWon: Int
    let serviceGamesWon: Int
    let tiebreaksWon: Int
    let receiverPointsWon: Int
    
    enum CodingKeys: String, CodingKey {
        case aces
        case doubleFaults = "double_faults"
        case pointsWon = "points_won"
        case maxPointsInARow = "max_points_in_a_row"
        case firstServePointsWon = "first_serve_points_won"
        case secondServcePointsWon = "second_serve_points_won"
        case totalBreakpoints = "total_breakpoints"
        case breakpointsWon = "breakpoints_won"
        case maxGamesInARow = "max_games_in_a_row"
        case gamesWon = "games_won"
        case firstServeSuccessful = "first_serve_successful"
        case secondServeSuccesful = "second_serve_successful"
        case servicePointsWon = "service_points_won"
        case serviceGamesWon = "service_games_won"
        case tiebreaksWon = "tiebreaks_won"
        case receiverPointsWon = "receiver_points_won"
    }
}


public struct MatchStat: Codable {

    let id: String
    let name: String
    let abbreviation: String
    let qualifier: String
    let statistics: MatchStats
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbreviation
        case qualifier
        case statistics
    }
}

struct MatchStatistics: Codable {
    
    let teams: [MatchStat]
    
    enum CodingKeys: String, CodingKey {
        case teams
    }
}

public struct MatchResult: Codable {

    let sportEvent: SportEvent
    let sportEventConditions: SportEventConditions?
    let sportEventStatus: SportEventStatus
    let coverageInfo: CoverageInfo?
    let timeline: [Timeline]?
    let statistics: MatchStatistics?
    
    enum CodingKeys: String, CodingKey {
        case sportEvent = "sport_event"
        case sportEventConditions = "sport_event_conditions"
        case sportEventStatus = "sport_event_status"
        case coverageInfo = "coverage_info"
        case timeline
        case statistics
    }
}

struct Meetings: Codable {
    let results: [MatchResult]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

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

struct Info: Codable {
    let surface: String?
    let complex: String?
    let complexId: String?
    let numberOfQualifiedCompetitors: Int
    
    enum CodingKeys: String, CodingKey {
        case surface
        case complex
        case complexId = "complex_id"
        case numberOfQualifiedCompetitors = "number_of_qualified_competitors"
    }
}


struct TournamentInfo: Codable {
    let generatedAt: String?
    let schema: String?
    let tournament: Tournament
    let season: Season
    let info: Info
    let coverageInfo: CoverageInfo
    let winnerLastSeason: Player?
    let competitors: [Player]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournament
        case season
        case info
        case coverageInfo = "coverage_info"
        case winnerLastSeason = "winner_last_season"
        case competitors
    }
}

struct TourRanking: Codable {
    let name: String
    let type: String
    let year: Int
    let week: Int
    let categoryId: String
    let playerRankings: [Ranking]
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case year
        case week
        case categoryId = "category_id"
        case playerRankings = "player_rankings"
    }
}

struct PlayerRankings : Codable {
    let generatedAt: String?
    let schema: String?
    let rankings: [TourRanking]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case rankings
    }
}

let playerProfile: String =
"""
{
    "generated_at": "2020-03-26T02:06:32+00:00",
    "schema": "http://schemas.sportradar.com/bsa/tennis/v1/json/endpoints/tennis/player_rankings.json",
    "rankings": [
        {
            "name": "WTA",
            "type": "WTA",
            "year": 2020,
            "week": 11,
            "category_id": "sr:category:6",
            "player_rankings": [
                {
                    "rank": 1,
                    "points": 8717,
                    "ranking_movement": 0,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:49352",
                        "name": "Barty, Ashleigh",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 2,
                    "points": 6076,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:35837",
                        "name": "Halep, Simona",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "HAL"
                    }
                },
                {
                    "rank": 3,
                    "points": 5205,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:20732",
                        "name": "Pliskova, Karolina",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "PLI"
                    }
                },
                {
                    "rank": 4,
                    "points": 4590,
                    "ranking_movement": 1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:91960",
                        "name": "Kenin, Sofia",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KEN"
                    }
                },
                {
                    "rank": 5,
                    "points": 4580,
                    "ranking_movement": 2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:51293",
                        "name": "Svitolina, Elina",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "SVI"
                    }
                },
                {
                    "rank": 6,
                    "points": 4555,
                    "ranking_movement": -2,
                    "tournaments_played": 10,
                    "player": {
                        "id": "sr:competitor:217912",
                        "name": "Andreescu, Bianca Vanessa",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 7,
                    "points": 4335,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:45435",
                        "name": "Bertens, Kiki",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "BER"
                    }
                },
                {
                    "rank": 8,
                    "points": 4010,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:63957",
                        "name": "Bencic, Belinda",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "BEN"
                    }
                },
                {
                    "rank": 9,
                    "points": 3915,
                    "ranking_movement": 0,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:18254",
                        "name": "Williams, Serena",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "WIL"
                    }
                },
                {
                    "rank": 10,
                    "points": 3625,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:66476",
                        "name": "Osaka, Naomi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OSA"
                    }
                },
                {
                    "rank": 11,
                    "points": 3615,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:157754",
                        "name": "Sabalenka, Aryna",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "SAB"
                    }
                },
                {
                    "rank": 12,
                    "points": 3566,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:19836",
                        "name": "Kvitova, Petra",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "KVI"
                    }
                },
                {
                    "rank": 13,
                    "points": 2962,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:35424",
                        "name": "Keys, Madison",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KEY"
                    }
                },
                {
                    "rank": 14,
                    "points": 2803,
                    "ranking_movement": 2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:45772",
                        "name": "Konta, Johanna",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "KON"
                    }
                },
                {
                    "rank": 15,
                    "points": 2770,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:19704",
                        "name": "Martic, Petra",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 16,
                    "points": 2711,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:50776",
                        "name": "Muguruza, Garbine",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "MUG"
                    }
                },
                {
                    "rank": 17,
                    "points": 2471,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:186312",
                        "name": "Rybakina, Elena",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "RYB"
                    }
                },
                {
                    "rank": 18,
                    "points": 2307,
                    "ranking_movement": 0,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:152804",
                        "name": "Vondrousova, Marketa",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "VON"
                    }
                },
                {
                    "rank": 19,
                    "points": 2256,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:19934",
                        "name": "Riske, Alison",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "RIS"
                    }
                },
                {
                    "rank": 20,
                    "points": 2130,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:65950",
                        "name": "Sakkari, Maria",
                        "nationality": "Greece",
                        "country_code": "GRC",
                        "abbreviation": "SAK"
                    }
                },
                {
                    "rank": 21,
                    "points": 2040,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19578",
                        "name": "Kerber, Angelique",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "KER"
                    }
                },
                {
                    "rank": 22,
                    "points": 2010,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:48009",
                        "name": "Kontaveit, Anett",
                        "nationality": "Estonia",
                        "country_code": "EST",
                        "abbreviation": "KON"
                    }
                },
                {
                    "rank": 23,
                    "points": 1950,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:78551",
                        "name": "Mertens, Elise",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "MER"
                    }
                },
                {
                    "rank": 24,
                    "points": 1880,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:50641",
                        "name": "Vekic, Donna",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "VEK"
                    }
                },
                {
                    "rank": 25,
                    "points": 1835,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:192108",
                        "name": "Yastremska, Dayana",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "YAS"
                    }
                },
                {
                    "rank": 26,
                    "points": 1813,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:85077",
                        "name": "Muchova, Karolina",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "MUC"
                    }
                },
                {
                    "rank": 27,
                    "points": 1775,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:67759",
                        "name": "Alexandrova, Ekaterina",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ALE"
                    }
                },
                {
                    "rank": 28,
                    "points": 1717,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:281189",
                        "name": "Anisimova, Amanda",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ANI"
                    }
                },
                {
                    "rank": 29,
                    "points": 1706,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:45846",
                        "name": "Wang, Qiang",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "WAN"
                    }
                },
                {
                    "rank": 30,
                    "points": 1540,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19546",
                        "name": "Pavlyuchenkova, Anastasia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "PAV"
                    }
                },
                {
                    "rank": 31,
                    "points": 1530,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:18430",
                        "name": "Strycova, Barbora",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "STR"
                    }
                },
                {
                    "rank": 32,
                    "points": 1527,
                    "ranking_movement": 0,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:18352",
                        "name": "Kuznetsova, Svetlana",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KUZ"
                    }
                },
                {
                    "rank": 33,
                    "points": 1525,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:45545",
                        "name": "Putintseva, Yulia",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "PUT"
                    }
                },
                {
                    "rank": 34,
                    "points": 1510,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:47697",
                        "name": "Zheng, Saisai",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHE"
                    }
                },
                {
                    "rank": 35,
                    "points": 1475,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:19607",
                        "name": "Zhang, Shuai",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHA"
                    }
                },
                {
                    "rank": 36,
                    "points": 1472,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:42289",
                        "name": "Linette, Magda",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "LIN"
                    }
                },
                {
                    "rank": 37,
                    "points": 1453,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:23158",
                        "name": "Stephens, Sloane",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 38,
                    "points": 1423,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19686",
                        "name": "Goerges, Julia",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "GOE"
                    }
                },
                {
                    "rank": 39,
                    "points": 1373,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:55401",
                        "name": "Jabeur, Ons",
                        "nationality": "Tunisia",
                        "country_code": "TUN",
                        "abbreviation": "JAB"
                    }
                },
                {
                    "rank": 40,
                    "points": 1373,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:66968",
                        "name": "Kudermetova, Veronika",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KUD"
                    }
                },
                {
                    "rank": 41,
                    "points": 1360,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:64496",
                        "name": "Ostapenko, Jelena",
                        "nationality": "Latvia",
                        "country_code": "LVA",
                        "abbreviation": "OST"
                    }
                },
                {
                    "rank": 42,
                    "points": 1335,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:33593",
                        "name": "Mladenovic, Kristina",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MLA"
                    }
                },
                {
                    "rank": 43,
                    "points": 1288,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:19788",
                        "name": "Sevastova, Anastasija",
                        "nationality": "Latvia",
                        "country_code": "LVA",
                        "abbreviation": "SEV"
                    }
                },
                {
                    "rank": 44,
                    "points": 1225,
                    "ranking_movement": 1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:75281",
                        "name": "Peterson, Rebecca",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "PET"
                    }
                },
                {
                    "rank": 45,
                    "points": 1205,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19957",
                        "name": "Hercog, Polona",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "HER"
                    }
                },
                {
                    "rank": 46,
                    "points": 1175,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:42339",
                        "name": "Garcia, Caroline",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GAR"
                    }
                },
                {
                    "rank": 47,
                    "points": 1147,
                    "ranking_movement": 10,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:105463",
                        "name": "Bouzkova, Marie",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "BOU"
                    }
                },
                {
                    "rank": 48,
                    "points": 1144,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:52273",
                        "name": "Brady, Jennifer",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BRA"
                    }
                },
                {
                    "rank": 49,
                    "points": 1139,
                    "ranking_movement": -1,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:274013",
                        "name": "Swiatek, Iga",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "SWI"
                    }
                },
                {
                    "rank": 50,
                    "points": 1122,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:41404",
                        "name": "Watson, Heather",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "WAT"
                    }
                },
                {
                    "rank": 51,
                    "points": 1115,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:58515",
                        "name": "Collins, Danielle",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "COL"
                    }
                },
                {
                    "rank": 52,
                    "points": 1081,
                    "ranking_movement": -1,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:373352",
                        "name": "Gauff, Cori",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "GAU"
                    }
                },
                {
                    "rank": 53,
                    "points": 1047,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:65656",
                        "name": "Ferro, Fiona",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "FER"
                    }
                },
                {
                    "rank": 54,
                    "points": 1045,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:72376",
                        "name": "Siniakova, Katerina",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "SIN"
                    }
                },
                {
                    "rank": 55,
                    "points": 1035,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:18936",
                        "name": "Hsieh, Su-Wei",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "HSI"
                    }
                },
                {
                    "rank": 56,
                    "points": 1035,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:34486",
                        "name": "Tomljanovic, Ajla",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "TOM"
                    }
                },
                {
                    "rank": 57,
                    "points": 1035,
                    "ranking_movement": 5,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:50687",
                        "name": "van Uytvanck, Alison",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 58,
                    "points": 992,
                    "ranking_movement": -2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:19017",
                        "name": "Azarenka, Victoria",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "AZA"
                    }
                },
                {
                    "rank": 59,
                    "points": 985,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:18808",
                        "name": "Cornet, Alize",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "COR"
                    }
                },
                {
                    "rank": 60,
                    "points": 985,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:67757",
                        "name": "Pera, Bernarda",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 61,
                    "points": 969,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:192130",
                        "name": "Blinkova, Anna",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "BLI"
                    }
                },
                {
                    "rank": 62,
                    "points": 967,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:41372",
                        "name": "Davis, Lauren",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "DAV"
                    }
                },
                {
                    "rank": 63,
                    "points": 924,
                    "ranking_movement": 3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:90814",
                        "name": "Teichmann, Jil",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "TEI"
                    }
                },
                {
                    "rank": 64,
                    "points": 918,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:36443",
                        "name": "Diyas, Zarina",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "DIY"
                    }
                },
                {
                    "rank": 65,
                    "points": 910,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:37508",
                        "name": "Siegemund, Laura",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "SIE"
                    }
                },
                {
                    "rank": 66,
                    "points": 905,
                    "ranking_movement": 7,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:132370",
                        "name": "Kasatkina, Daria",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAS"
                    }
                },
                {
                    "rank": 67,
                    "points": 900,
                    "ranking_movement": -2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:18251",
                        "name": "Williams, Venus",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "WIL"
                    }
                },
                {
                    "rank": 68,
                    "points": 881,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:20805",
                        "name": "Suarez Navarro, Carla",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "SUA"
                    }
                },
                {
                    "rank": 69,
                    "points": 880,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:19361",
                        "name": "Pliskova, Kristyna",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "PLI"
                    }
                },
                {
                    "rank": 70,
                    "points": 869,
                    "ranking_movement": 6,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:19847",
                        "name": "Rus, Arantxa",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "RUS"
                    }
                },
                {
                    "rank": 71,
                    "points": 840,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:110299",
                        "name": "Zidansek, Tamara",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "ZID"
                    }
                },
                {
                    "rank": 72,
                    "points": 838,
                    "ranking_movement": -3,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:72450",
                        "name": "Hibino, Nao",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HIB"
                    }
                },
                {
                    "rank": 73,
                    "points": 835,
                    "ranking_movement": -3,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:51387",
                        "name": "Townsend, Taylor",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "TOW"
                    }
                },
                {
                    "rank": 74,
                    "points": 830,
                    "ranking_movement": -2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:45584",
                        "name": "Zhu, Lin",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHU"
                    }
                },
                {
                    "rank": 75,
                    "points": 820,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19728",
                        "name": "Cirstea, Sorana",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "CIR"
                    }
                },
                {
                    "rank": 76,
                    "points": 818,
                    "ranking_movement": 10,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:38461",
                        "name": "Doi, Misaki",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "DOI"
                    }
                },
                {
                    "rank": 77,
                    "points": 801,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:18457",
                        "name": "Flipkens, Kirsten",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "FLI"
                    }
                },
                {
                    "rank": 78,
                    "points": 795,
                    "ranking_movement": 6,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:52025",
                        "name": "Wang, Yafan",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "WAN"
                    }
                },
                {
                    "rank": 79,
                    "points": 786,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:19610",
                        "name": "Brengle, Madison",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BRE"
                    }
                },
                {
                    "rank": 80,
                    "points": 783,
                    "ranking_movement": -2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:44834",
                        "name": "Pegula, Jessica",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "PEG"
                    }
                },
                {
                    "rank": 81,
                    "points": 777,
                    "ranking_movement": 23,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:35838",
                        "name": "Begu, Irina-Camelia",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "BEG"
                    }
                },
                {
                    "rank": 82,
                    "points": 775,
                    "ranking_movement": 3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:129534",
                        "name": "Kuzmova, Viktoria",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "KUZ"
                    }
                },
                {
                    "rank": 83,
                    "points": 763,
                    "ranking_movement": -4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:60392",
                        "name": "Sorribes Tormo, Sara",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "SOR"
                    }
                },
                {
                    "rank": 84,
                    "points": 759,
                    "ranking_movement": 5,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:234150",
                        "name": "Potapova, Anastasia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "POT"
                    }
                },
                {
                    "rank": 85,
                    "points": 759,
                    "ranking_movement": -5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:54397",
                        "name": "Tig, Patricia Maria",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "TIG"
                    }
                },
                {
                    "rank": 86,
                    "points": 751,
                    "ranking_movement": -5,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:120666",
                        "name": "Stojanovic, Nina",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "STO"
                    }
                },
                {
                    "rank": 87,
                    "points": 750,
                    "ranking_movement": -5,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:19579",
                        "name": "Petkovic, Andrea",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "PET"
                    }
                },
                {
                    "rank": 88,
                    "points": 737,
                    "ranking_movement": -5,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:25066",
                        "name": "McHale, Christina",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MCH"
                    }
                },
                {
                    "rank": 89,
                    "points": 732,
                    "ranking_movement": 5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:44309",
                        "name": "Giorgi, Camila",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GIO"
                    }
                },
                {
                    "rank": 90,
                    "points": 722,
                    "ranking_movement": -3,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:45136",
                        "name": "Puig, Monica",
                        "nationality": "Puerto Rico",
                        "country_code": "PRI",
                        "abbreviation": "PUI"
                    }
                },
                {
                    "rank": 91,
                    "points": 714,
                    "ranking_movement": -3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:52229",
                        "name": "Kovinic, Danka",
                        "nationality": "Montenegro",
                        "country_code": "MNE",
                        "abbreviation": "KOV"
                    }
                },
                {
                    "rank": 92,
                    "points": 710,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:41355",
                        "name": "Bogdan, Ana",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "BOG"
                    }
                },
                {
                    "rank": 93,
                    "points": 702,
                    "ranking_movement": -2,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:19520",
                        "name": "Maria, Tatjana",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 94,
                    "points": 698,
                    "ranking_movement": -2,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:133662",
                        "name": "Badosa, Paula",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BAS"
                    }
                },
                {
                    "rank": 95,
                    "points": 689,
                    "ranking_movement": -2,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:69208",
                        "name": "Paolini, Jasmine",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "PAO"
                    }
                },
                {
                    "rank": 96,
                    "points": 668,
                    "ranking_movement": 2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:25070",
                        "name": "Ahn, Kristie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "AHN"
                    }
                },
                {
                    "rank": 97,
                    "points": 667,
                    "ranking_movement": -2,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:18429",
                        "name": "Stosur, Samantha",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "STO"
                    }
                },
                {
                    "rank": 98,
                    "points": 658,
                    "ranking_movement": -2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:48583",
                        "name": "Kozlova, Kateryna",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "KOZ"
                    }
                },
                {
                    "rank": 99,
                    "points": 656,
                    "ranking_movement": -2,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:18977",
                        "name": "Kanepi, Kaia",
                        "nationality": "Estonia",
                        "country_code": "EST",
                        "abbreviation": "KAN"
                    }
                },
                {
                    "rank": 100,
                    "points": 650,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:43102",
                        "name": "Babos, Timea",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "BAB"
                    }
                },
                {
                    "rank": 101,
                    "points": 645,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:246905",
                        "name": "Gracheva, Varvara",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "GRA"
                    }
                },
                {
                    "rank": 102,
                    "points": 644,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:115507",
                        "name": "Bolsova Zadoinov, Aliona",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BOL"
                    }
                },
                {
                    "rank": 103,
                    "points": 642,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:18481",
                        "name": "Peng, Shuai",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "PEN"
                    }
                },
                {
                    "rank": 104,
                    "points": 636,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:110803",
                        "name": "Minnen, Greet",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "MIN"
                    }
                },
                {
                    "rank": 105,
                    "points": 631,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:202623",
                        "name": "Zavatska, Katarina",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "ZAV"
                    }
                },
                {
                    "rank": 106,
                    "points": 629,
                    "ranking_movement": 30,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:50655",
                        "name": "Friedsam, Anna-Lena",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "FRI"
                    }
                },
                {
                    "rank": 107,
                    "points": 622,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:262759",
                        "name": "Wang, Xiyu",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "WAN"
                    }
                },
                {
                    "rank": 108,
                    "points": 619,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:32862",
                        "name": "Diatchenko, Vitalia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "DIA"
                    }
                },
                {
                    "rank": 109,
                    "points": 612,
                    "ranking_movement": -1,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:18860",
                        "name": "Voegele, Stefanie",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "VOE"
                    }
                },
                {
                    "rank": 110,
                    "points": 601,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:41193",
                        "name": "Gasparyan, Margarita",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "GAS"
                    }
                },
                {
                    "rank": 111,
                    "points": 599,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:69988",
                        "name": "Korpatsch, Tamara",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "KOR"
                    }
                },
                {
                    "rank": 112,
                    "points": 596,
                    "ranking_movement": -1,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:179146",
                        "name": "Kalinskaya, Anna",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAL"
                    }
                },
                {
                    "rank": 113,
                    "points": 586,
                    "ranking_movement": 1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:42459",
                        "name": "Rogers, Shelby",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ROG"
                    }
                },
                {
                    "rank": 114,
                    "points": 586,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:99405",
                        "name": "Inglis, Maddison",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "ING"
                    }
                },
                {
                    "rank": 115,
                    "points": 580,
                    "ranking_movement": -2,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:60398",
                        "name": "Krejcikova, Barbora",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "KRE"
                    }
                },
                {
                    "rank": 116,
                    "points": 579,
                    "ranking_movement": 14,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:64968",
                        "name": "Dodin, Oceane",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "DOD"
                    }
                },
                {
                    "rank": 117,
                    "points": 569,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:128584",
                        "name": "Samsonova, Liudmila",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "SAM"
                    }
                },
                {
                    "rank": 118,
                    "points": 569,
                    "ranking_movement": 8,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:289507",
                        "name": "Fernandez, Leylah Annie",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "FER"
                    }
                },
                {
                    "rank": 119,
                    "points": 561,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:45902",
                        "name": "Sasnovich, Aliaksandra",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "SAS"
                    }
                },
                {
                    "rank": 120,
                    "points": 558,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:19833",
                        "name": "Buzarnescu, Mihaela",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "BUZ"
                    }
                },
                {
                    "rank": 121,
                    "points": 557,
                    "ranking_movement": -3,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:205633",
                        "name": "Juvan, Kaja",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "JUV"
                    }
                },
                {
                    "rank": 122,
                    "points": 556,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:54259",
                        "name": "Bonaventure, Ysaline",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "BON"
                    }
                },
                {
                    "rank": 123,
                    "points": 548,
                    "ranking_movement": -4,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:48455",
                        "name": "Golubic, Viktorija",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "GOL"
                    }
                },
                {
                    "rank": 124,
                    "points": 544,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:242602",
                        "name": "Mcnally, Catherine",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MCC"
                    }
                },
                {
                    "rank": 125,
                    "points": 531,
                    "ranking_movement": -4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:42492",
                        "name": "Kawa, Katarzyna",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "KAW"
                    }
                },
                {
                    "rank": 126,
                    "points": 528,
                    "ranking_movement": 1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:58053",
                        "name": "Sharma, Astra",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "SHA"
                    }
                },
                {
                    "rank": 127,
                    "points": 528,
                    "ranking_movement": -4,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:79443",
                        "name": "Cabrera, Lizette",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "CAB"
                    }
                },
                {
                    "rank": 128,
                    "points": 520,
                    "ranking_movement": -4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:188557",
                        "name": "Di Lorenzo, Francesca",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "DIL"
                    }
                },
                {
                    "rank": 129,
                    "points": 519,
                    "ranking_movement": -4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:90654",
                        "name": "Vikhlyantseva, Natalia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "VIK"
                    }
                },
                {
                    "rank": 130,
                    "points": 505,
                    "ranking_movement": 13,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:41374",
                        "name": "Tomova, Viktoriya",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "TOM"
                    }
                },
                {
                    "rank": 131,
                    "points": 504,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:261583",
                        "name": "Li, Ann",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "LIA"
                    }
                },
                {
                    "rank": 132,
                    "points": 500,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:87834",
                        "name": "Hon, Priscilla",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "HON"
                    }
                },
                {
                    "rank": 133,
                    "points": 488,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:48318",
                        "name": "Martincova, Tereza",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 134,
                    "points": 480,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:123824",
                        "name": "Dolehide, Caroline",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "DOL"
                    }
                },
                {
                    "rank": 135,
                    "points": 477,
                    "ranking_movement": 7,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:19528",
                        "name": "Govortsova, Olga",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "GOV"
                    }
                },
                {
                    "rank": 136,
                    "points": 470,
                    "ranking_movement": -3,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:19655",
                        "name": "Niculescu, Monica",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "NIC"
                    }
                },
                {
                    "rank": 137,
                    "points": 469,
                    "ranking_movement": -2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:54203",
                        "name": "Haas, Barbara",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "HAA"
                    }
                },
                {
                    "rank": 138,
                    "points": 463,
                    "ranking_movement": -4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:99385",
                        "name": "Arconada, Usue Maitane",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ARC"
                    }
                },
                {
                    "rank": 139,
                    "points": 460,
                    "ranking_movement": 13,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:36067",
                        "name": "Tsurenko, Lesia",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "TSU"
                    }
                },
                {
                    "rank": 140,
                    "points": 454,
                    "ranking_movement": -3,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:272217",
                        "name": "Wang, Xinyu",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "WAN"
                    }
                },
                {
                    "rank": 141,
                    "points": 451,
                    "ranking_movement": 0,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:278887",
                        "name": "Kostyuk, Marta",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "KOS"
                    }
                },
                {
                    "rank": 142,
                    "points": 449,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:38411",
                        "name": "Nara, Kurumi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NAR"
                    }
                },
                {
                    "rank": 143,
                    "points": 447,
                    "ranking_movement": -5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:260987",
                        "name": "Osuigwe, Whitney",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "OSU"
                    }
                },
                {
                    "rank": 144,
                    "points": 436,
                    "ranking_movement": -4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:90664",
                        "name": "Kalinina, Anhelina",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "KAL"
                    }
                },
                {
                    "rank": 145,
                    "points": 434,
                    "ranking_movement": 8,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:19876",
                        "name": "Wickmayer, Yanina",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "WIC"
                    }
                },
                {
                    "rank": 146,
                    "points": 430,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:53789",
                        "name": "Dart, Harriet",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "DAR"
                    }
                },
                {
                    "rank": 147,
                    "points": 428,
                    "ranking_movement": -3,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:19057",
                        "name": "Minella, Mandy",
                        "nationality": "Luxembourg",
                        "country_code": "LUX",
                        "abbreviation": "MIN"
                    }
                },
                {
                    "rank": 148,
                    "points": 421,
                    "ranking_movement": -2,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:37509",
                        "name": "Gibbs, Nicole",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "GIB"
                    }
                },
                {
                    "rank": 149,
                    "points": 415,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:51977",
                        "name": "Flink, Varvara",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "FLI"
                    }
                },
                {
                    "rank": 150,
                    "points": 415,
                    "ranking_movement": -2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:44211",
                        "name": "Gatto-Monticone, Giulia",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GAT"
                    }
                },
                {
                    "rank": 151,
                    "points": 413,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:153860",
                        "name": "Trevisan, Martina",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "TRE"
                    }
                },
                {
                    "rank": 152,
                    "points": 410,
                    "ranking_movement": -5,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:18939",
                        "name": "Parmentier, Pauline",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 153,
                    "points": 407,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:45668",
                        "name": "Cepede Royg, Veronica",
                        "nationality": "Paraguay",
                        "country_code": "PRY",
                        "abbreviation": "CEP"
                    }
                },
                {
                    "rank": 154,
                    "points": 406,
                    "ranking_movement": 5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:46448",
                        "name": "Arruabarrena, Lara",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ARR"
                    }
                },
                {
                    "rank": 155,
                    "points": 404,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:181062",
                        "name": "Kung, Leonie",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "KUN"
                    }
                },
                {
                    "rank": 156,
                    "points": 402,
                    "ranking_movement": 2,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:373354",
                        "name": "Cocciaretto, Elisabetta",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "COC"
                    }
                },
                {
                    "rank": 157,
                    "points": 400,
                    "ranking_movement": -3,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:23082",
                        "name": "Rodionova, Arina",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "ROD"
                    }
                },
                {
                    "rank": 158,
                    "points": 399,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:51392",
                        "name": "Vickery, Sachia",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "VIC"
                    }
                },
                {
                    "rank": 159,
                    "points": 397,
                    "ranking_movement": 9,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:52183",
                        "name": "Bara, Irina Maria",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 160,
                    "points": 396,
                    "ranking_movement": -3,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:50361",
                        "name": "Kiick, Allie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KII"
                    }
                },
                {
                    "rank": 161,
                    "points": 395,
                    "ranking_movement": 1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:61408",
                        "name": "Lottner, Antonia",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "LOT"
                    }
                },
                {
                    "rank": 162,
                    "points": 388,
                    "ranking_movement": 12,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:72758",
                        "name": "Cristian, Jaqueline Adina",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "CRI"
                    }
                },
                {
                    "rank": 163,
                    "points": 383,
                    "ranking_movement": -3,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:46625",
                        "name": "Raina, Ankita",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "RAI"
                    }
                },
                {
                    "rank": 164,
                    "points": 381,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:38964",
                        "name": "Cepelova, Jana",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "CEP"
                    }
                },
                {
                    "rank": 165,
                    "points": 379,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:49358",
                        "name": "Pattinama Kerkhove, Lesley",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "PAK"
                    }
                },
                {
                    "rank": 166,
                    "points": 372,
                    "ranking_movement": -3,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:59460",
                        "name": "Hibi, Mayo",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HIB"
                    }
                },
                {
                    "rank": 167,
                    "points": 368,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:19202",
                        "name": "Errani, Sara",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "ERR"
                    }
                },
                {
                    "rank": 168,
                    "points": 363,
                    "ranking_movement": 11,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:211262",
                        "name": "Danilovic, Olga",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "DAN"
                    }
                },
                {
                    "rank": 169,
                    "points": 360,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:71250",
                        "name": "Frech, Magdalena",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "FRE"
                    }
                },
                {
                    "rank": 170,
                    "points": 359,
                    "ranking_movement": -4,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:46591",
                        "name": "Paquet, Chloe",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PAQ"
                    }
                },
                {
                    "rank": 171,
                    "points": 358,
                    "ranking_movement": 2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:20661",
                        "name": "Kucova, Kristina",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "KUC"
                    }
                },
                {
                    "rank": 172,
                    "points": 358,
                    "ranking_movement": -5,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:96981",
                        "name": "Xun, Fang Ying",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "XUN"
                    }
                },
                {
                    "rank": 173,
                    "points": 358,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:99131",
                        "name": "Bucsa, Cristina",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BUC"
                    }
                },
                {
                    "rank": 174,
                    "points": 352,
                    "ranking_movement": 18,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:134532",
                        "name": "You, Xiaodi",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "YOU"
                    }
                },
                {
                    "rank": 175,
                    "points": 352,
                    "ranking_movement": 3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:60276",
                        "name": "Podoroska, Nadia",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "POD"
                    }
                },
                {
                    "rank": 176,
                    "points": 351,
                    "ranking_movement": -6,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:103901",
                        "name": "Ruse, Elena-Gabriela",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "RUS"
                    }
                },
                {
                    "rank": 177,
                    "points": 349,
                    "ranking_movement": 6,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:252223",
                        "name": "Rakhimova, Kamilla",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "RAK"
                    }
                },
                {
                    "rank": 178,
                    "points": 348,
                    "ranking_movement": -6,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:18919",
                        "name": "Lepchenko, Varvara",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "LEP"
                    }
                },
                {
                    "rank": 179,
                    "points": 342,
                    "ranking_movement": 20,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:46304",
                        "name": "Schmiedlova, Anna-Karolina",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "SCH"
                    }
                },
                {
                    "rank": 180,
                    "points": 340,
                    "ranking_movement": -5,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:19283",
                        "name": "Rybarikova, Magdalena",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "RYB"
                    }
                },
                {
                    "rank": 181,
                    "points": 337,
                    "ranking_movement": -5,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:100341",
                        "name": "Bolkvadze, Mariam",
                        "nationality": "Georgia",
                        "country_code": "GEO",
                        "abbreviation": "BOL"
                    }
                },
                {
                    "rank": 182,
                    "points": 336,
                    "ranking_movement": -5,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:20354",
                        "name": "Buyukakcay, Cagla",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "BUY"
                    }
                },
                {
                    "rank": 183,
                    "points": 332,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:43502",
                        "name": "Lu, Jia-Jing",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "LUJ"
                    }
                },
                {
                    "rank": 184,
                    "points": 331,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:64722",
                        "name": "de Vroome, Indy",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "DEV"
                    }
                },
                {
                    "rank": 185,
                    "points": 326,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:47876",
                        "name": "Shinikova, Isabella",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "SHI"
                    }
                },
                {
                    "rank": 186,
                    "points": 326,
                    "ranking_movement": 11,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:52489",
                        "name": "Schoofs, Bibiane",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "SCH"
                    }
                },
                {
                    "rank": 187,
                    "points": 324,
                    "ranking_movement": -5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:41592",
                        "name": "Han, Na-Lae",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "HAN"
                    }
                },
                {
                    "rank": 188,
                    "points": 323,
                    "ranking_movement": 6,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19932",
                        "name": "Muhammad, Asia",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MUH"
                    }
                },
                {
                    "rank": 189,
                    "points": 321,
                    "ranking_movement": -4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:265553",
                        "name": "Naito, Yuki",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NAI"
                    }
                },
                {
                    "rank": 190,
                    "points": 321,
                    "ranking_movement": -4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:58423",
                        "name": "Kostic, Natalija",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "KOS"
                    }
                },
                {
                    "rank": 191,
                    "points": 320,
                    "ranking_movement": -4,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:111189",
                        "name": "Zarazua, Renata",
                        "nationality": "Mexico",
                        "country_code": "MEX",
                        "abbreviation": "ZAR"
                    }
                },
                {
                    "rank": 192,
                    "points": 318,
                    "ranking_movement": 12,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:71034",
                        "name": "Sramkova, Rebecca",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "SRA"
                    }
                },
                {
                    "rank": 193,
                    "points": 318,
                    "ranking_movement": -5,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:24066",
                        "name": "Han, Xinyun",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "HAN"
                    }
                },
                {
                    "rank": 194,
                    "points": 315,
                    "ranking_movement": -5,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:66480",
                        "name": "Di Giuseppe, Martina",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "DIG"
                    }
                },
                {
                    "rank": 195,
                    "points": 314,
                    "ranking_movement": -5,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:88310",
                        "name": "Sherif, Maiar",
                        "nationality": "Egypt",
                        "country_code": "EGY",
                        "abbreviation": "SHE"
                    }
                },
                {
                    "rank": 196,
                    "points": 308,
                    "ranking_movement": -5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:51315",
                        "name": "Anderson, Robin",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 197,
                    "points": 307,
                    "ranking_movement": -4,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:19427",
                        "name": "Vandeweghe, Coco",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 198,
                    "points": 304,
                    "ranking_movement": 4,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:190882",
                        "name": "Aiava, Destanee",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "AIA"
                    }
                },
                {
                    "rank": 199,
                    "points": 301,
                    "ranking_movement": -4,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:44210",
                        "name": "Kostova, Elitsa",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "KOS"
                    }
                },
                {
                    "rank": 200,
                    "points": 300,
                    "ranking_movement": -4,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:40987",
                        "name": "Jani, Reka Luca",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "JAN"
                    }
                },
                {
                    "rank": 201,
                    "points": 300,
                    "ranking_movement": 7,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:81765",
                        "name": "Komardina, Anastasiya",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KOM"
                    }
                },
                {
                    "rank": 202,
                    "points": 298,
                    "ranking_movement": -4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:125016",
                        "name": "Lao, Danielle",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "LAO"
                    }
                },
                {
                    "rank": 203,
                    "points": 298,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:51473",
                        "name": "Paar, Laura-Ioana",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "PAA"
                    }
                },
                {
                    "rank": 204,
                    "points": 297,
                    "ranking_movement": 9,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:49907",
                        "name": "Murray Sharan, Samantha",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "MUS"
                    }
                },
                {
                    "rank": 205,
                    "points": 292,
                    "ranking_movement": -5,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:48486",
                        "name": "Gorgodze, Ekaterine",
                        "nationality": "Georgia",
                        "country_code": "GEO",
                        "abbreviation": "GOR"
                    }
                },
                {
                    "rank": 206,
                    "points": 292,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:242630",
                        "name": "Osorio Serrano, Maria Camila",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "OSO"
                    }
                },
                {
                    "rank": 207,
                    "points": 289,
                    "ranking_movement": -2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:208125",
                        "name": "Liang, En Shuo",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "LIA"
                    }
                },
                {
                    "rank": 208,
                    "points": 289,
                    "ranking_movement": -2,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:153816",
                        "name": "Muramatsu, Chihiro",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "MUR"
                    }
                },
                {
                    "rank": 209,
                    "points": 287,
                    "ranking_movement": -2,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:39425",
                        "name": "Savinykh, Valeria",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "SAV"
                    }
                },
                {
                    "rank": 210,
                    "points": 287,
                    "ranking_movement": 4,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:20347",
                        "name": "Ozgen, Pemra",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "OZG"
                    }
                },
                {
                    "rank": 211,
                    "points": 286,
                    "ranking_movement": 6,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:329535",
                        "name": "Tauson, Clara",
                        "nationality": "Denmark",
                        "country_code": "DNK",
                        "abbreviation": "TAU"
                    }
                },
                {
                    "rank": 212,
                    "points": 285,
                    "ranking_movement": 4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:46177",
                        "name": "Hogenkamp, Richel",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "HOG"
                    }
                },
                {
                    "rank": 213,
                    "points": 284,
                    "ranking_movement": -4,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:42839",
                        "name": "Barthel, Mona",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 214,
                    "points": 284,
                    "ranking_movement": -4,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:41877",
                        "name": "Yuan, Yue",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "YUA"
                    }
                },
                {
                    "rank": 215,
                    "points": 284,
                    "ranking_movement": -4,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:380704",
                        "name": "Snigur, Daria",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "SNI"
                    }
                },
                {
                    "rank": 216,
                    "points": 281,
                    "ranking_movement": -4,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:49171",
                        "name": "Parrizas-Diaz, Nuria",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 217,
                    "points": 277,
                    "ranking_movement": -2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:41524",
                        "name": "Krunic, Aleksandra",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "KA"
                    }
                },
                {
                    "rank": 218,
                    "points": 271,
                    "ranking_movement": 4,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:92442",
                        "name": "Fett, Jana",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "FET"
                    }
                },
                {
                    "rank": 219,
                    "points": 269,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:45601",
                        "name": "Seguel, Daniela",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "SEG"
                    }
                },
                {
                    "rank": 220,
                    "points": 267,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:71284",
                        "name": "Bains, Naiktha",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "BAI"
                    }
                },
                {
                    "rank": 221,
                    "points": 267,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:113079",
                        "name": "Grabher, Julia",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "GRA"
                    }
                },
                {
                    "rank": 222,
                    "points": 267,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:62000",
                        "name": "Kan, Victoria",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAN"
                    }
                },
                {
                    "rank": 223,
                    "points": 266,
                    "ranking_movement": 21,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:63220",
                        "name": "Ponchet, Jessika",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PON"
                    }
                },
                {
                    "rank": 224,
                    "points": 264,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:46651",
                        "name": "Melnikova, Marina",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "MEL"
                    }
                },
                {
                    "rank": 225,
                    "points": 263,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:49271",
                        "name": "Jovic, Jovana",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "JOV"
                    }
                },
                {
                    "rank": 226,
                    "points": 263,
                    "ranking_movement": 3,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:235260",
                        "name": "Chwalinska, Maja",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "CHW"
                    }
                },
                {
                    "rank": 227,
                    "points": 261,
                    "ranking_movement": -2,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:77993",
                        "name": "Jorovic, Ivana",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "JOR"
                    }
                },
                {
                    "rank": 228,
                    "points": 260,
                    "ranking_movement": -2,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:132414",
                        "name": "Guerrero Alvarez, Eva",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GUE"
                    }
                },
                {
                    "rank": 229,
                    "points": 259,
                    "ranking_movement": -2,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:41287",
                        "name": "Mrdeza, Tereza",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "MRD"
                    }
                },
                {
                    "rank": 230,
                    "points": 258,
                    "ranking_movement": -2,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:52533",
                        "name": "Jakupovic, Dalila",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "JAK"
                    }
                },
                {
                    "rank": 231,
                    "points": 256,
                    "ranking_movement": 1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:45605",
                        "name": "Ce, Gabriela",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "CEG"
                    }
                },
                {
                    "rank": 232,
                    "points": 256,
                    "ranking_movement": -2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:55309",
                        "name": "Talaba, Gabriela",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "TAL"
                    }
                },
                {
                    "rank": 233,
                    "points": 255,
                    "ranking_movement": 14,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:319455",
                        "name": "Baptiste, Hailey",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BAP"
                    }
                },
                {
                    "rank": 234,
                    "points": 254,
                    "ranking_movement": 4,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:198414",
                        "name": "Molinaro, Eleonora",
                        "nationality": "Luxembourg",
                        "country_code": "LUX",
                        "abbreviation": "MOL"
                    }
                },
                {
                    "rank": 235,
                    "points": 253,
                    "ranking_movement": -4,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:179300",
                        "name": "Liu, Claire",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "LIU"
                    }
                },
                {
                    "rank": 236,
                    "points": 252,
                    "ranking_movement": -3,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:42656",
                        "name": "Satralova, Denisa",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "SAT"
                    }
                },
                {
                    "rank": 237,
                    "points": 251,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:89000",
                        "name": "Gerlach, Katharina",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "GER"
                    }
                },
                {
                    "rank": 238,
                    "points": 251,
                    "ranking_movement": -3,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:49181",
                        "name": "Naydenova, Aleksandrina",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "NAY"
                    }
                },
                {
                    "rank": 239,
                    "points": 250,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:72868",
                        "name": "Liu, Fangzhou",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "LIU"
                    }
                },
                {
                    "rank": 240,
                    "points": 250,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:41281",
                        "name": "Ivakhnenko, Valentyna",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "IVA"
                    }
                },
                {
                    "rank": 241,
                    "points": 247,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:130690",
                        "name": "Okamura, Kyoka",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OKA"
                    }
                },
                {
                    "rank": 242,
                    "points": 247,
                    "ranking_movement": 10,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:341112",
                        "name": "Zakharova, Anastasia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ZAK"
                    }
                },
                {
                    "rank": 243,
                    "points": 247,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:49963",
                        "name": "Omae, Akiko",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OMA"
                    }
                },
                {
                    "rank": 244,
                    "points": 246,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:119670",
                        "name": "Perez, Ellen",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 245,
                    "points": 246,
                    "ranking_movement": -3,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:119496",
                        "name": "Mcphee, Kaylah",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "MCP"
                    }
                },
                {
                    "rank": 246,
                    "points": 245,
                    "ranking_movement": -3,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:278943",
                        "name": "Lansere, Sofya",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "LAN"
                    }
                },
                {
                    "rank": 247,
                    "points": 240,
                    "ranking_movement": 9,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:67322",
                        "name": "Tan, Harmony",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "TAN"
                    }
                },
                {
                    "rank": 248,
                    "points": 240,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:47801",
                        "name": "Eikeri, Ulrikke",
                        "nationality": "Norway",
                        "country_code": "NOR",
                        "abbreviation": "EIK"
                    }
                },
                {
                    "rank": 249,
                    "points": 239,
                    "ranking_movement": -3,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:40994",
                        "name": "Gavrilova, Daria",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "GAV"
                    }
                },
                {
                    "rank": 250,
                    "points": 237,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:147506",
                        "name": "Fourlis, Jaimee",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "FOU"
                    }
                },
                {
                    "rank": 251,
                    "points": 237,
                    "ranking_movement": -2,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:72244",
                        "name": "Hobgarski, Katharina",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HOB"
                    }
                },
                {
                    "rank": 252,
                    "points": 233,
                    "ranking_movement": -2,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:54171",
                        "name": "Benoit, Marie",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "BEN"
                    }
                },
                {
                    "rank": 253,
                    "points": 231,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:97995",
                        "name": "Galfi, Dalma",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "GAL"
                    }
                },
                {
                    "rank": 254,
                    "points": 229,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:46528",
                        "name": "Perrin, Conny",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 255,
                    "points": 229,
                    "ranking_movement": -1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:122630",
                        "name": "Andrianjafitrimo, Tessah",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 256,
                    "points": 226,
                    "ranking_movement": 2,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:155952",
                        "name": "Swan, Katie",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "SWA"
                    }
                },
                {
                    "rank": 257,
                    "points": 224,
                    "ranking_movement": -2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:66060",
                        "name": "Zacarias, Marcela",
                        "nationality": "Mexico",
                        "country_code": "MEX",
                        "abbreviation": "ZAC"
                    }
                },
                {
                    "rank": 258,
                    "points": 223,
                    "ranking_movement": 6,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:47985",
                        "name": "Marcinkevica, Diana",
                        "nationality": "Latvia",
                        "country_code": "LVA",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 259,
                    "points": 223,
                    "ranking_movement": -2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:49118",
                        "name": "Harrison, Catherine",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "HAR"
                    }
                },
                {
                    "rank": 260,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:40142",
                        "name": "Ormaechea, Paula",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "ORM"
                    }
                },
                {
                    "rank": 261,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:58267",
                        "name": "Radanovic, Dejana",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "RAD"
                    }
                },
                {
                    "rank": 262,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:50915",
                        "name": "Plipuech, Peangtarn",
                        "nationality": "Thailand",
                        "country_code": "THA",
                        "abbreviation": "PLI"
                    }
                },
                {
                    "rank": 263,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:50643",
                        "name": "Lukas, Tena",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "LUK"
                    }
                },
                {
                    "rank": 264,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:45139",
                        "name": "Papamichail, Despina",
                        "nationality": "Greece",
                        "country_code": "GRC",
                        "abbreviation": "PAP"
                    }
                },
                {
                    "rank": 265,
                    "points": 217,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:19329",
                        "name": "Radwanska, Urszula",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "RAD"
                    }
                },
                {
                    "rank": 266,
                    "points": 217,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:51582",
                        "name": "Dascalu, Nicoleta-Catalina",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "DAS"
                    }
                },
                {
                    "rank": 267,
                    "points": 216,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:128638",
                        "name": "Sebov, Katherine",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "SEB"
                    }
                },
                {
                    "rank": 268,
                    "points": 215,
                    "ranking_movement": 51,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:18298",
                        "name": "Zvonareva, Vera",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ZVO"
                    }
                },
                {
                    "rank": 269,
                    "points": 214,
                    "ranking_movement": 2,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:52388",
                        "name": "Hesse, Amandine",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HES"
                    }
                },
                {
                    "rank": 270,
                    "points": 214,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:74875",
                        "name": "Wagner, Stephanie",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "WAG"
                    }
                },
                {
                    "rank": 271,
                    "points": 213,
                    "ranking_movement": -2,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:195408",
                        "name": "Shimizu, Ayano",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SHI"
                    }
                },
                {
                    "rank": 272,
                    "points": 212,
                    "ranking_movement": -2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:132186",
                        "name": "Mendez, Seone",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "MEN"
                    }
                },
                {
                    "rank": 273,
                    "points": 209,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:69718",
                        "name": "Danilina, Anna",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "DAN"
                    }
                },
                {
                    "rank": 274,
                    "points": 209,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:130624",
                        "name": "Gasanova, Anastasia",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "GAS"
                    }
                },
                {
                    "rank": 275,
                    "points": 207,
                    "ranking_movement": -1,
                    "tournaments_played": 6,
                    "player": {
                        "id": "sr:competitor:45835",
                        "name": "Sanders, Storm",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 276,
                    "points": 206,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:82307",
                        "name": "von Deichmann, Kathinka",
                        "nationality": "Liechtenstein",
                        "country_code": "LIE",
                        "abbreviation": "VON"
                    }
                },
                {
                    "rank": 277,
                    "points": 206,
                    "ranking_movement": 5,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:73500",
                        "name": "Loeb, Jamie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "LOE"
                    }
                },
                {
                    "rank": 278,
                    "points": 205,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:150574",
                        "name": "Bondar, Anna",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "BON"
                    }
                },
                {
                    "rank": 279,
                    "points": 205,
                    "ranking_movement": -2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:61934",
                        "name": "Soylu, Ipek",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "SOY"
                    }
                },
                {
                    "rank": 280,
                    "points": 205,
                    "ranking_movement": -2,
                    "tournaments_played": 8,
                    "player": {
                        "id": "sr:competitor:83129",
                        "name": "Stewart, Katerina",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 281,
                    "points": 204,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:41480",
                        "name": "Garcia Perez, Georgina",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GAR"
                    }
                },
                {
                    "rank": 282,
                    "points": 204,
                    "ranking_movement": 2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:54979",
                        "name": "Georges, Myrtille",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GEO"
                    }
                },
                {
                    "rank": 283,
                    "points": 201,
                    "ranking_movement": 2,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:18933",
                        "name": "Glatch, Alexa",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "GLA"
                    }
                },
                {
                    "rank": 284,
                    "points": 200,
                    "ranking_movement": -4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:245295",
                        "name": "Waltert, Simona",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "WAL"
                    }
                },
                {
                    "rank": 285,
                    "points": 199,
                    "ranking_movement": -4,
                    "tournaments_played": 8,
                    "player": {
                        "id": "sr:competitor:59702",
                        "name": "Haddad Maia, Beatriz",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "HAD"
                    }
                },
                {
                    "rank": 286,
                    "points": 199,
                    "ranking_movement": 4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:161270",
                        "name": "Salden, Lara",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "SAL"
                    }
                },
                {
                    "rank": 287,
                    "points": 198,
                    "ranking_movement": -4,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:47775",
                        "name": "Min, Grace",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MIN"
                    }
                },
                {
                    "rank": 288,
                    "points": 198,
                    "ranking_movement": 10,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:96061",
                        "name": "Bandecchi, Susan",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "BAN"
                    }
                },
                {
                    "rank": 289,
                    "points": 195,
                    "ranking_movement": -3,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:18730",
                        "name": "Bacsinszky, Timea",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "BAC"
                    }
                },
                {
                    "rank": 290,
                    "points": 194,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:46465",
                        "name": "Cadantu, Alexandra",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "CAD"
                    }
                },
                {
                    "rank": 291,
                    "points": 191,
                    "ranking_movement": -3,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:59522",
                        "name": "Lee, Ya-Hsuan",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "LEE"
                    }
                },
                {
                    "rank": 292,
                    "points": 190,
                    "ranking_movement": -3,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:43321",
                        "name": "Caregaro, Martina",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 293,
                    "points": 189,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:172590",
                        "name": "Burrage, Jodie Anna",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "BUR"
                    }
                },
                {
                    "rank": 294,
                    "points": 187,
                    "ranking_movement": -3,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:80773",
                        "name": "Hives, Zoe",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "HIV"
                    }
                },
                {
                    "rank": 295,
                    "points": 185,
                    "ranking_movement": -3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:72736",
                        "name": "Xu, Shilin",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "XUS"
                    }
                },
                {
                    "rank": 296,
                    "points": 184,
                    "ranking_movement": -2,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:26120",
                        "name": "Marino, Rebecca",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 297,
                    "points": 184,
                    "ranking_movement": 3,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:255031",
                        "name": "Niemeier, Jule",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "NIE"
                    }
                },
                {
                    "rank": 298,
                    "points": 184,
                    "ranking_movement": -3,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:137948",
                        "name": "Chang, Hanna",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "CHA"
                    }
                },
                {
                    "rank": 299,
                    "points": 184,
                    "ranking_movement": -3,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:71484",
                        "name": "Chirico, Louisa",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "CHI"
                    }
                },
                {
                    "rank": 300,
                    "points": 183,
                    "ranking_movement": 2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:82609",
                        "name": "Grammatikopoulou, Valentini",
                        "nationality": "Greece",
                        "country_code": "GRC",
                        "abbreviation": "GRA"
                    }
                },
                {
                    "rank": 301,
                    "points": 181,
                    "ranking_movement": -4,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:93661",
                        "name": "Fetecau, Irina",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "FET"
                    }
                },
                {
                    "rank": 302,
                    "points": 180,
                    "ranking_movement": -3,
                    "tournaments_played": 4,
                    "player": {
                        "id": "sr:competitor:137968",
                        "name": "Bellis, Catherine",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BEL"
                    }
                },
                {
                    "rank": 303,
                    "points": 180,
                    "ranking_movement": 5,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:74445",
                        "name": "Abanda, Francoise",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "ABA"
                    }
                },
                {
                    "rank": 304,
                    "points": 177,
                    "ranking_movement": -3,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:157150",
                        "name": "Boskovic, Lea",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "BOS"
                    }
                },
                {
                    "rank": 305,
                    "points": 176,
                    "ranking_movement": -2,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:100175",
                        "name": "Halbauer, Elizabeth",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "HAL"
                    }
                },
                {
                    "rank": 306,
                    "points": 176,
                    "ranking_movement": 1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:58239",
                        "name": "Rubini, Stefania",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "RUB"
                    }
                },
                {
                    "rank": 307,
                    "points": 175,
                    "ranking_movement": 14,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:133094",
                        "name": "Yerolymos, Margot",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "YER"
                    }
                },
                {
                    "rank": 308,
                    "points": 175,
                    "ranking_movement": -4,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:225350",
                        "name": "Chernyshova, Maryna",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "CHE"
                    }
                },
                {
                    "rank": 309,
                    "points": 174,
                    "ranking_movement": -4,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:96237",
                        "name": "Pieri, Jessica",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "PIE"
                    }
                },
                {
                    "rank": 310,
                    "points": 172,
                    "ranking_movement": -4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:194480",
                        "name": "Ma, Shuyue",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "MAS"
                    }
                },
                {
                    "rank": 311,
                    "points": 170,
                    "ranking_movement": -2,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:41737",
                        "name": "Jang, Su Jeong",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "JAN"
                    }
                },
                {
                    "rank": 312,
                    "points": 167,
                    "ranking_movement": 0,
                    "tournaments_played": 10,
                    "player": {
                        "id": "sr:competitor:37507",
                        "name": "Falconi, Irina",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "FAL"
                    }
                },
                {
                    "rank": 313,
                    "points": 167,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:45805",
                        "name": "Myers, Abbie",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "MYE"
                    }
                },
                {
                    "rank": 314,
                    "points": 167,
                    "ranking_movement": -3,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:79023",
                        "name": "Turati, Bianca",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "TUR"
                    }
                },
                {
                    "rank": 315,
                    "points": 166,
                    "ranking_movement": 10,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:318195",
                        "name": "Parry, Diane",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 316,
                    "points": 166,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:42655",
                        "name": "Zlochova, Zuzana",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "ZLO"
                    }
                },
                {
                    "rank": 317,
                    "points": 165,
                    "ranking_movement": -3,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:41278",
                        "name": "Zanevska, Maryna",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "ZAN"
                    }
                },
                {
                    "rank": 318,
                    "points": 165,
                    "ranking_movement": -3,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:68708",
                        "name": "Ozaki, Risa",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OZA"
                    }
                },
                {
                    "rank": 319,
                    "points": 163,
                    "ranking_movement": -3,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:59662",
                        "name": "Sanchez, Ana Sofia",
                        "nationality": "Mexico",
                        "country_code": "MEX",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 320,
                    "points": 160,
                    "ranking_movement": -3,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:198488",
                        "name": "Jones, Francesca",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "JON"
                    }
                },
                {
                    "rank": 321,
                    "points": 159,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:66472",
                        "name": "Osaka, Mari",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OSA"
                    }
                },
                {
                    "rank": 322,
                    "points": 158,
                    "ranking_movement": -2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:50771",
                        "name": "Khazaniuk, Deniz",
                        "nationality": "Israel",
                        "country_code": "ISR",
                        "abbreviation": "KHA"
                    }
                },
                {
                    "rank": 323,
                    "points": 158,
                    "ranking_movement": -1,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:145930",
                        "name": "Hayashi, Erina",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HAY"
                    }
                },
                {
                    "rank": 324,
                    "points": 157,
                    "ranking_movement": -1,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:46428",
                        "name": "Maleckova, Jesika",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "MAL"
                    }
                },
                {
                    "rank": 325,
                    "points": 157,
                    "ranking_movement": -1,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:208017",
                        "name": "Maristany Zuleta de Reales, Guiomar",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 326,
                    "points": 156,
                    "ranking_movement": 6,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:152052",
                        "name": "Bjorklund, Mirjam",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "BJO"
                    }
                },
                {
                    "rank": 327,
                    "points": 156,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:183957",
                        "name": "Kobori, Momoko",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "KOB"
                    }
                },
                {
                    "rank": 328,
                    "points": 155,
                    "ranking_movement": -1,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:44059",
                        "name": "Bouchard, Eugenie",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "BOU"
                    }
                },
                {
                    "rank": 329,
                    "points": 155,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:33049",
                        "name": "Rogowska, Olivia",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "ROG"
                    }
                },
                {
                    "rank": 330,
                    "points": 154,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:41282",
                        "name": "Carreras, Amanda",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 331,
                    "points": 154,
                    "ranking_movement": -1,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:110055",
                        "name": "Bronzetti, Lucia",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 332,
                    "points": 153,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:20655",
                        "name": "Luangnam, Nudnida",
                        "nationality": "Thailand",
                        "country_code": "THA",
                        "abbreviation": "LUA"
                    }
                },
                {
                    "rank": 333,
                    "points": 149,
                    "ranking_movement": 43,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:352782",
                        "name": "Raducanu, Emma",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "RAD"
                    }
                },
                {
                    "rank": 334,
                    "points": 149,
                    "ranking_movement": -1,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:98733",
                        "name": "Burillo Escorihuela, Irene",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BUR"
                    }
                },
                {
                    "rank": 335,
                    "points": 147,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:103375",
                        "name": "Serban, Raluca Georgiana",
                        "nationality": "Cyprus",
                        "country_code": "CYP",
                        "abbreviation": "SER"
                    }
                },
                {
                    "rank": 336,
                    "points": 145,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:18978",
                        "name": "Namigata, Junri",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NAM"
                    }
                },
                {
                    "rank": 337,
                    "points": 143,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:64315",
                        "name": "Kuwata, Hiroko",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "KUW"
                    }
                },
                {
                    "rank": 338,
                    "points": 143,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:53967",
                        "name": "Sun, Ziyue",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "SUN"
                    }
                },
                {
                    "rank": 339,
                    "points": 142,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:70970",
                        "name": "Bhatia, Riya",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "BHA"
                    }
                },
                {
                    "rank": 340,
                    "points": 142,
                    "ranking_movement": -1,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:79249",
                        "name": "Kim, Dabin",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "KIM"
                    }
                },
                {
                    "rank": 341,
                    "points": 142,
                    "ranking_movement": 3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:67743",
                        "name": "Gjorcheska, Lina",
                        "nationality": "North Macedonia",
                        "country_code": "MKD",
                        "abbreviation": "GJO"
                    }
                },
                {
                    "rank": 342,
                    "points": 141,
                    "ranking_movement": -2,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:63682",
                        "name": "Lazaro Garcia, Andrea",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "LAZ"
                    }
                },
                {
                    "rank": 343,
                    "points": 140,
                    "ranking_movement": -2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:343160",
                        "name": "Volynets, Katie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "VOL"
                    }
                },
                {
                    "rank": 344,
                    "points": 139,
                    "ranking_movement": -2,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:41656",
                        "name": "Simmonds, Chanel",
                        "nationality": "South Africa",
                        "country_code": "ZAF",
                        "abbreviation": "SIM"
                    }
                },
                {
                    "rank": 345,
                    "points": 138,
                    "ranking_movement": -2,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:50064",
                        "name": "Dunne, Katy",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "DUN"
                    }
                },
                {
                    "rank": 346,
                    "points": 137,
                    "ranking_movement": 32,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:144202",
                        "name": "Lapko, Vera",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "LAP"
                    }
                },
                {
                    "rank": 347,
                    "points": 137,
                    "ranking_movement": 57,
                    "tournaments_played": 8,
                    "player": {
                        "id": "sr:competitor:18742",
                        "name": "Bondarenko, Kateryna",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "BON"
                    }
                },
                {
                    "rank": 348,
                    "points": 136,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:74975",
                        "name": "Ferrando, Cristiana",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "FER"
                    }
                },
                {
                    "rank": 349,
                    "points": 134,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:206949",
                        "name": "Hontama, Mai",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HON"
                    }
                },
                {
                    "rank": 350,
                    "points": 133,
                    "ranking_movement": -3,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:159732",
                        "name": "Craciun, Georgia Andreea",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "CRA"
                    }
                },
                {
                    "rank": 351,
                    "points": 132,
                    "ranking_movement": -3,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:153652",
                        "name": "Guo, Hanyu",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "GUO"
                    }
                },
                {
                    "rank": 352,
                    "points": 131,
                    "ranking_movement": -3,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:18354",
                        "name": "Mattek-Sands, Bethanie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MAT"
                    }
                },
                {
                    "rank": 353,
                    "points": 131,
                    "ranking_movement": -3,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:19731",
                        "name": "Piter, Katarzyna",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "PIT"
                    }
                },
                {
                    "rank": 354,
                    "points": 131,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:80535",
                        "name": "Kaji, Haruka",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "KAJ"
                    }
                },
                {
                    "rank": 355,
                    "points": 131,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:121760",
                        "name": "Anshba, Amina",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ANS"
                    }
                },
                {
                    "rank": 356,
                    "points": 131,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:102449",
                        "name": "Steur, Julyette Maria Josephine",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 357,
                    "points": 130,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:157672",
                        "name": "Stollar, Fanny",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "STO"
                    }
                },
                {
                    "rank": 358,
                    "points": 130,
                    "ranking_movement": 7,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:254551",
                        "name": "Udvardy, Panna",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "UDV"
                    }
                },
                {
                    "rank": 359,
                    "points": 129,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:38054",
                        "name": "Sharipova, Sabina",
                        "nationality": "Uzbekistan",
                        "country_code": "UZB",
                        "abbreviation": "SHA"
                    }
                },
                {
                    "rank": 360,
                    "points": 129,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:70784",
                        "name": "Hozumi, Eri",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HOZ"
                    }
                },
                {
                    "rank": 361,
                    "points": 128,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:61414",
                        "name": "Woolcock, Belinda",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "WOO"
                    }
                },
                {
                    "rank": 362,
                    "points": 128,
                    "ranking_movement": -4,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:247471",
                        "name": "Popovic, Ivana",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "POP"
                    }
                },
                {
                    "rank": 363,
                    "points": 128,
                    "ranking_movement": -4,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:173748",
                        "name": "Detiuc, Anastasia",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "DET"
                    }
                },
                {
                    "rank": 364,
                    "points": 127,
                    "ranking_movement": -4,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:69602",
                        "name": "Lumsden, Maia",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "LUM"
                    }
                },
                {
                    "rank": 365,
                    "points": 127,
                    "ranking_movement": -4,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:92971",
                        "name": "Ushijima, Risa",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "USH"
                    }
                },
                {
                    "rank": 366,
                    "points": 126,
                    "ranking_movement": 8,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:52692",
                        "name": "Brouleau, Lou",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 367,
                    "points": 126,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:23689",
                        "name": "Pereira, Teliana",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 368,
                    "points": 126,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:256547",
                        "name": "Parks, Alycia",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 369,
                    "points": 126,
                    "ranking_movement": -5,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:156098",
                        "name": "Arakawa, Haruna",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "ARA"
                    }
                },
                {
                    "rank": 370,
                    "points": 125,
                    "ranking_movement": 26,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:62924",
                        "name": "Boulter, Katie",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "BOU"
                    }
                },
                {
                    "rank": 371,
                    "points": 124,
                    "ranking_movement": -5,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:25822",
                        "name": "Shapatava, Sofia",
                        "nationality": "Georgia",
                        "country_code": "GEO",
                        "abbreviation": "SHA"
                    }
                },
                {
                    "rank": 372,
                    "points": 124,
                    "ranking_movement": -5,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:87090",
                        "name": "Chong, Eudice Wong",
                        "nationality": "Hong Kong, China",
                        "country_code": "HKG",
                        "abbreviation": "CHO"
                    }
                },
                {
                    "rank": 373,
                    "points": 124,
                    "ranking_movement": -5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:117948",
                        "name": "Hanatani, Nagi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "HAN"
                    }
                },
                {
                    "rank": 374,
                    "points": 123,
                    "ranking_movement": -5,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:19038",
                        "name": "Rodina, Evgeniya",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ROD"
                    }
                },
                {
                    "rank": 375,
                    "points": 123,
                    "ranking_movement": -5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:51481",
                        "name": "Sutjiadi, Aldila",
                        "nationality": "Indonesia",
                        "country_code": "IDN",
                        "abbreviation": "SUT"
                    }
                },
                {
                    "rank": 376,
                    "points": 123,
                    "ranking_movement": -5,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:51943",
                        "name": "Strakhova, Valeriya",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "STR"
                    }
                },
                {
                    "rank": 377,
                    "points": 123,
                    "ranking_movement": 9,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:179808",
                        "name": "Tere-Apisah, Abigail",
                        "nationality": "Papua New Guinea",
                        "country_code": "PNG",
                        "abbreviation": "TER"
                    }
                },
                {
                    "rank": 378,
                    "points": 122,
                    "ranking_movement": -6,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:46461",
                        "name": "Smitkova, Tereza",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "SMI"
                    }
                },
                {
                    "rank": 379,
                    "points": 122,
                    "ranking_movement": -6,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:412295",
                        "name": "Lopatetska, Daria",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "LOD"
                    }
                },
                {
                    "rank": 380,
                    "points": 121,
                    "ranking_movement": -5,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:73542",
                        "name": "Gleason, Quinn",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "GLE"
                    }
                },
                {
                    "rank": 381,
                    "points": 120,
                    "ranking_movement": 3,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:155556",
                        "name": "Bulgaru, Miriam Bianca",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "BUL"
                    }
                },
                {
                    "rank": 382,
                    "points": 119,
                    "ranking_movement": -5,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:111149",
                        "name": "Samir, Sandra",
                        "nationality": "Egypt",
                        "country_code": "EGY",
                        "abbreviation": "SAM"
                    }
                },
                {
                    "rank": 383,
                    "points": 118,
                    "ranking_movement": 70,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:59001",
                        "name": "Ramialison, Irina",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "RAM"
                    }
                },
                {
                    "rank": 384,
                    "points": 118,
                    "ranking_movement": -5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:120664",
                        "name": "Pedretti, Thaisa Grana",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "PED"
                    }
                },
                {
                    "rank": 385,
                    "points": 117,
                    "ranking_movement": -5,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:88318",
                        "name": "Albie, Audrey",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "ALB"
                    }
                },
                {
                    "rank": 386,
                    "points": 117,
                    "ranking_movement": 6,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:135192",
                        "name": "Rame, Alice",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "RAM"
                    }
                },
                {
                    "rank": 387,
                    "points": 116,
                    "ranking_movement": -6,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:155890",
                        "name": "Stefanini, Lucrezia",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 388,
                    "points": 116,
                    "ranking_movement": -6,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:265865",
                        "name": "Subhash, Natasha",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SUB"
                    }
                },
                {
                    "rank": 389,
                    "points": 115,
                    "ranking_movement": -6,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:49664",
                        "name": "Sanchez, Maria",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 390,
                    "points": 115,
                    "ranking_movement": -5,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:134342",
                        "name": "Cengiz, Berfu",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "CEN"
                    }
                },
                {
                    "rank": 391,
                    "points": 114,
                    "ranking_movement": 36,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:43570",
                        "name": "Elie, Jennifer",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ELI"
                    }
                },
                {
                    "rank": 392,
                    "points": 114,
                    "ranking_movement": 7,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:262573",
                        "name": "Koval, Vlada",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KOV"
                    }
                },
                {
                    "rank": 393,
                    "points": 114,
                    "ranking_movement": -6,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:55885",
                        "name": "Herdzelas, Dea",
                        "nationality": "Bosnia & Herzegovina",
                        "country_code": "BIH",
                        "abbreviation": "HER"
                    }
                },
                {
                    "rank": 394,
                    "points": 114,
                    "ranking_movement": -5,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:128588",
                        "name": "Potocnik, Nina",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "POT"
                    }
                },
                {
                    "rank": 395,
                    "points": 113,
                    "ranking_movement": -7,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:53673",
                        "name": "Imanishi, Miharu",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "IMA"
                    }
                },
                {
                    "rank": 396,
                    "points": 112,
                    "ranking_movement": -6,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:55793",
                        "name": "Chiesa, Deborah",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "CHI"
                    }
                },
                {
                    "rank": 397,
                    "points": 112,
                    "ranking_movement": -6,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:175850",
                        "name": "Yushchenko, Valeriya",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "YUS"
                    }
                },
                {
                    "rank": 398,
                    "points": 111,
                    "ranking_movement": -5,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:208185",
                        "name": "Talbi, Shalimar",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "TAL"
                    }
                },
                {
                    "rank": 399,
                    "points": 111,
                    "ranking_movement": -5,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:50999",
                        "name": "Burger, Cindy",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "BUR"
                    }
                },
                {
                    "rank": 400,
                    "points": 111,
                    "ranking_movement": -5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:99997",
                        "name": "Rosca, Ioana Loredana",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "ROS"
                    }
                },
                {
                    "rank": 401,
                    "points": 110,
                    "ranking_movement": -4,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:98607",
                        "name": "Chang, Sophie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "CHA"
                    }
                },
                {
                    "rank": 402,
                    "points": 110,
                    "ranking_movement": -4,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:18651",
                        "name": "Amanmuradova, Akgul",
                        "nationality": "Uzbekistan",
                        "country_code": "UZB",
                        "abbreviation": "AMA"
                    }
                },
                {
                    "rank": 403,
                    "points": 110,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:194696",
                        "name": "Markova, Johana",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 404,
                    "points": 110,
                    "ranking_movement": -3,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:75825",
                        "name": "Bektas, Emina",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BEK"
                    }
                },
                {
                    "rank": 405,
                    "points": 109,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:183861",
                        "name": "Bassols Ribera, Marina",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BAS"
                    }
                },
                {
                    "rank": 406,
                    "points": 108,
                    "ranking_movement": 10,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:48376",
                        "name": "Zaja, Anna",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "ZAJ"
                    }
                },
                {
                    "rank": 407,
                    "points": 108,
                    "ranking_movement": -4,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:51839",
                        "name": "Alves, Carolina Meligeni Rodrigues",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "ALV"
                    }
                },
                {
                    "rank": 408,
                    "points": 108,
                    "ranking_movement": 162,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:43233",
                        "name": "Akita, Shiho",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "AKI"
                    }
                },
                {
                    "rank": 409,
                    "points": 106,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:54023",
                        "name": "Gervais, Julie",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GER"
                    }
                },
                {
                    "rank": 410,
                    "points": 105,
                    "ranking_movement": -4,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:160190",
                        "name": "Hartono, Arianne",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "HAR"
                    }
                },
                {
                    "rank": 411,
                    "points": 105,
                    "ranking_movement": 166,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:157368",
                        "name": "Kazionova, Ekaterina",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAZ"
                    }
                },
                {
                    "rank": 412,
                    "points": 104,
                    "ranking_movement": -5,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:43550",
                        "name": "Glushko, Julia",
                        "nationality": "Israel",
                        "country_code": "ISR",
                        "abbreviation": "GLU"
                    }
                },
                {
                    "rank": 413,
                    "points": 104,
                    "ranking_movement": -5,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:115477",
                        "name": "Zarycka, Anastasia",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "ZAR"
                    }
                },
                {
                    "rank": 414,
                    "points": 104,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:51736",
                        "name": "Sekulic, Sarah Rebecca",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "SEK"
                    }
                },
                {
                    "rank": 415,
                    "points": 104,
                    "ranking_movement": -2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:194690",
                        "name": "Mateas, Maria",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MAT"
                    }
                },
                {
                    "rank": 416,
                    "points": 104,
                    "ranking_movement": -6,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:48584",
                        "name": "Saez Larra, Olga",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "SAE"
                    }
                },
                {
                    "rank": 417,
                    "points": 103,
                    "ranking_movement": -6,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:381262",
                        "name": "Whittle, Sophia",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "WHI"
                    }
                },
                {
                    "rank": 418,
                    "points": 103,
                    "ranking_movement": -6,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:62010",
                        "name": "Doroshina, Olga",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "DOR"
                    }
                },
                {
                    "rank": 419,
                    "points": 101,
                    "ranking_movement": -5,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:66330",
                        "name": "Zhang, Yuxuan",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHA"
                    }
                },
                {
                    "rank": 420,
                    "points": 101,
                    "ranking_movement": 11,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:19606",
                        "name": "Arn, Greta",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "ARN"
                    }
                },
                {
                    "rank": 421,
                    "points": 101,
                    "ranking_movement": -6,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:59678",
                        "name": "Poznikhirenko, Ganna",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "POZ"
                    }
                },
                {
                    "rank": 422,
                    "points": 101,
                    "ranking_movement": 18,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:55541",
                        "name": "Heisen, Vivian",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HEI"
                    }
                },
                {
                    "rank": 423,
                    "points": 100,
                    "ranking_movement": -6,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:64085",
                        "name": "Pigossi, Laura",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "PIG"
                    }
                },
                {
                    "rank": 424,
                    "points": 100,
                    "ranking_movement": -6,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:97833",
                        "name": "Scala, Camilla",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "SCA"
                    }
                },
                {
                    "rank": 425,
                    "points": 100,
                    "ranking_movement": -6,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:36598",
                        "name": "Kolar, Nastja",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "KOL"
                    }
                },
                {
                    "rank": 426,
                    "points": 99,
                    "ranking_movement": -6,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:108621",
                        "name": "Kempen, Magali",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "KEM"
                    }
                },
                {
                    "rank": 427,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:43625",
                        "name": "Eraydin, Basak",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "ERA"
                    }
                },
                {
                    "rank": 428,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:52303",
                        "name": "Lemoine, Quirine",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "LEM"
                    }
                },
                {
                    "rank": 429,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:92879",
                        "name": "Shymanovich, Iryna",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "SHY"
                    }
                },
                {
                    "rank": 430,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:118238",
                        "name": "Shoshyna, Anastasiya",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "SHO"
                    }
                },
                {
                    "rank": 431,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:144084",
                        "name": "Cakarevic, Sara",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "CAK"
                    }
                },
                {
                    "rank": 432,
                    "points": 97,
                    "ranking_movement": -6,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:170936",
                        "name": "Zhuk, Sofya",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ZHU"
                    }
                },
                {
                    "rank": 433,
                    "points": 97,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:41943",
                        "name": "Hsu, Chieh-Yu",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "HSU"
                    }
                },
                {
                    "rank": 434,
                    "points": 96,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:96407",
                        "name": "Taylor, Gabriella",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "TAY"
                    }
                },
                {
                    "rank": 435,
                    "points": 96,
                    "ranking_movement": -5,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:47950",
                        "name": "Mishina, Daria",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "MIS"
                    }
                },
                {
                    "rank": 436,
                    "points": 95,
                    "ranking_movement": -4,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:148276",
                        "name": "Zheng, Wushuang",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHE"
                    }
                },
                {
                    "rank": 437,
                    "points": 95,
                    "ranking_movement": 26,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:208181",
                        "name": "Hatouka, Yuliya",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "HAT"
                    }
                },
                {
                    "rank": 438,
                    "points": 95,
                    "ranking_movement": -5,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:70728",
                        "name": "Bhosale, Rutuja",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "BHO"
                    }
                },
                {
                    "rank": 439,
                    "points": 94,
                    "ranking_movement": -5,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:79563",
                        "name": "Tjandramulia, Olivia",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "TJA"
                    }
                },
                {
                    "rank": 440,
                    "points": 94,
                    "ranking_movement": -5,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:44236",
                        "name": "Di Sarra, Federica",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "DIS"
                    }
                },
                {
                    "rank": 441,
                    "points": 93,
                    "ranking_movement": -5,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:23688",
                        "name": "Moore, Tara",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "MOO"
                    }
                },
                {
                    "rank": 442,
                    "points": 93,
                    "ranking_movement": -5,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:87078",
                        "name": "Hourigan, Paige Mary",
                        "nationality": "New Zealand",
                        "country_code": "NZL",
                        "abbreviation": "HOU"
                    }
                },
                {
                    "rank": 443,
                    "points": 93,
                    "ranking_movement": 15,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:51651",
                        "name": "Rosatello, Camilla",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "ROS"
                    }
                },
                {
                    "rank": 444,
                    "points": 92,
                    "ranking_movement": 11,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:50010",
                        "name": "Gabueva, Angelina",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "GAB"
                    }
                },
                {
                    "rank": 445,
                    "points": 92,
                    "ranking_movement": -7,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:55313",
                        "name": "Simion, Oana Georgeta",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "SIM"
                    }
                },
                {
                    "rank": 446,
                    "points": 92,
                    "ranking_movement": -7,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:49912",
                        "name": "Tanaka, Yuuki",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "TAN"
                    }
                },
                {
                    "rank": 447,
                    "points": 92,
                    "ranking_movement": 7,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:67430",
                        "name": "Cascino, Estelle",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "CAS"
                    }
                },
                {
                    "rank": 448,
                    "points": 91,
                    "ranking_movement": -7,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:191364",
                        "name": "Vicens Mas, Rosa",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "VIC"
                    }
                },
                {
                    "rank": 449,
                    "points": 91,
                    "ranking_movement": 8,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:142942",
                        "name": "Bozovic, Alexandra",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "BOZ"
                    }
                },
                {
                    "rank": 450,
                    "points": 91,
                    "ranking_movement": -8,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:46307",
                        "name": "Goncalves, Paula Cristina",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "GON"
                    }
                },
                {
                    "rank": 451,
                    "points": 91,
                    "ranking_movement": -8,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:57973",
                        "name": "Terziyska, Julia",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "TER"
                    }
                },
                {
                    "rank": 452,
                    "points": 91,
                    "ranking_movement": -4,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:99687",
                        "name": "Stokke, Melanie",
                        "nationality": "Norway",
                        "country_code": "NOR",
                        "abbreviation": "STO"
                    }
                },
                {
                    "rank": 453,
                    "points": 91,
                    "ranking_movement": -9,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:50113",
                        "name": "Sanesi, Gaia",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 454,
                    "points": 90,
                    "ranking_movement": -9,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:194474",
                        "name": "Yang, Yidi",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "YAN"
                    }
                },
                {
                    "rank": 455,
                    "points": 90,
                    "ranking_movement": -9,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:165866",
                        "name": "Miyazaki, Yuriko Lily",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "MIY"
                    }
                },
                {
                    "rank": 456,
                    "points": 89,
                    "ranking_movement": -9,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:47788",
                        "name": "Zhang, Kai Lin",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHA"
                    }
                },
                {
                    "rank": 457,
                    "points": 89,
                    "ranking_movement": -8,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:95853",
                        "name": "Pieri, Tatiana",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "PIE"
                    }
                },
                {
                    "rank": 458,
                    "points": 88,
                    "ranking_movement": -8,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:166124",
                        "name": "Olmos, Giuliana",
                        "nationality": "Mexico",
                        "country_code": "MEX",
                        "abbreviation": "OLM"
                    }
                },
                {
                    "rank": 459,
                    "points": 88,
                    "ranking_movement": -3,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:110281",
                        "name": "Contreras Gomez, Fernanda",
                        "nationality": "Mexico",
                        "country_code": "MEX",
                        "abbreviation": "CON"
                    }
                },
                {
                    "rank": 460,
                    "points": 88,
                    "ranking_movement": -9,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:66328",
                        "name": "Sun, Xu Liu",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "SUN"
                    }
                },
                {
                    "rank": 461,
                    "points": 88,
                    "ranking_movement": -9,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:44417",
                        "name": "Bosio, Victoria",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "BOS"
                    }
                },
                {
                    "rank": 462,
                    "points": 87,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:282057",
                        "name": "Guo, Meiqi",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "GUO"
                    }
                },
                {
                    "rank": 463,
                    "points": 86,
                    "ranking_movement": -1,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:234216",
                        "name": "Kubareva, Anna",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "KUB"
                    }
                },
                {
                    "rank": 464,
                    "points": 86,
                    "ranking_movement": -4,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:132988",
                        "name": "Ma, Yexin",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "MAY"
                    }
                },
                {
                    "rank": 465,
                    "points": 85,
                    "ranking_movement": -4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:54175",
                        "name": "Zimmermann, Kimberley",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "ZIM"
                    }
                },
                {
                    "rank": 466,
                    "points": 85,
                    "ranking_movement": -2,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:160364",
                        "name": "Ghioroaie, Ilona Georgiana",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "GHI"
                    }
                },
                {
                    "rank": 467,
                    "points": 85,
                    "ranking_movement": -2,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:100273",
                        "name": "Ivanova, Dasha",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "IVA"
                    }
                },
                {
                    "rank": 468,
                    "points": 84,
                    "ranking_movement": -2,
                    "tournaments_played": 10,
                    "player": {
                        "id": "sr:competitor:43860",
                        "name": "Dabrowski, Gabriela",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "DAB"
                    }
                },
                {
                    "rank": 469,
                    "points": 84,
                    "ranking_movement": -2,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:58479",
                        "name": "Duval, Victoria",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "DUV"
                    }
                },
                {
                    "rank": 470,
                    "points": 84,
                    "ranking_movement": -2,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:19331",
                        "name": "Hradecka, Lucie",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "HRA"
                    }
                },
                {
                    "rank": 471,
                    "points": 83,
                    "ranking_movement": -2,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:104003",
                        "name": "Ainitdinova, Gozal",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "AIN"
                    }
                },
                {
                    "rank": 472,
                    "points": 83,
                    "ranking_movement": -2,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:45828",
                        "name": "Giovine, Claudia",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GIO"
                    }
                },
                {
                    "rank": 473,
                    "points": 83,
                    "ranking_movement": -2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:84013",
                        "name": "Gatica, Barbara",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "GAT"
                    }
                },
                {
                    "rank": 474,
                    "points": 83,
                    "ranking_movement": -2,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:79315",
                        "name": "Colmegna, Martina",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "COL"
                    }
                },
                {
                    "rank": 475,
                    "points": 82,
                    "ranking_movement": -2,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:360038",
                        "name": "Stearns, Peyton",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 476,
                    "points": 82,
                    "ranking_movement": 2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:47969",
                        "name": "Werner, Caroline",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "WER"
                    }
                },
                {
                    "rank": 477,
                    "points": 81,
                    "ranking_movement": -3,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:53288",
                        "name": "Silva, Eden",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "SIL"
                    }
                },
                {
                    "rank": 478,
                    "points": 81,
                    "ranking_movement": -3,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:150130",
                        "name": "Gao, Xinyu",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "GAO"
                    }
                },
                {
                    "rank": 479,
                    "points": 81,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:46661",
                        "name": "Gamiz, Andrea",
                        "nationality": "Venezuela",
                        "country_code": "VEN",
                        "abbreviation": "GAM"
                    }
                },
                {
                    "rank": 480,
                    "points": 81,
                    "ranking_movement": -3,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:137962",
                        "name": "Day, Kayla",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "DAY"
                    }
                },
                {
                    "rank": 481,
                    "points": 81,
                    "ranking_movement": 4,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:226644",
                        "name": "Topalova, Gergana",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "TOP"
                    }
                },
                {
                    "rank": 482,
                    "points": 81,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:52695",
                        "name": "Moratelli, Angelica",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MOR"
                    }
                },
                {
                    "rank": 483,
                    "points": 80,
                    "ranking_movement": -3,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:20158",
                        "name": "Webley-Smith, Emily",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "WEB"
                    }
                },
                {
                    "rank": 484,
                    "points": 80,
                    "ranking_movement": -3,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:44978",
                        "name": "Kinard, Tori",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KIN"
                    }
                },
                {
                    "rank": 485,
                    "points": 80,
                    "ranking_movement": -3,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:97413",
                        "name": "Ostlund, Fanny",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "OST"
                    }
                },
                {
                    "rank": 486,
                    "points": 79,
                    "ranking_movement": -3,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:107327",
                        "name": "In-Albon, Ylena",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "INA"
                    }
                },
                {
                    "rank": 487,
                    "points": 79,
                    "ranking_movement": -3,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:335171",
                        "name": "Uchijima, Moyuka",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "UCH"
                    }
                },
                {
                    "rank": 488,
                    "points": 79,
                    "ranking_movement": -2,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:65452",
                        "name": "Partaud, Marine",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 489,
                    "points": 79,
                    "ranking_movement": -2,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:106091",
                        "name": "Meliss, Verena",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MEL"
                    }
                },
                {
                    "rank": 490,
                    "points": 79,
                    "ranking_movement": 12,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:37638",
                        "name": "Sema, Erika",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SEM"
                    }
                },
                {
                    "rank": 491,
                    "points": 79,
                    "ranking_movement": -3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:61664",
                        "name": "Morgina, Anna",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "MOR"
                    }
                },
                {
                    "rank": 492,
                    "points": 78,
                    "ranking_movement": -3,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:137974",
                        "name": "Kratzer, Ashley",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KRA"
                    }
                },
                {
                    "rank": 493,
                    "points": 78,
                    "ranking_movement": -3,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:23690",
                        "name": "Broady, Naomi",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 494,
                    "points": 78,
                    "ranking_movement": -3,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:234398",
                        "name": "Nahimana, Sada",
                        "nationality": "Burundi",
                        "country_code": "BDI",
                        "abbreviation": "NAH"
                    }
                },
                {
                    "rank": 495,
                    "points": 78,
                    "ranking_movement": -3,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:51223",
                        "name": "Muntean, Victoria",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MUN"
                    }
                },
                {
                    "rank": 496,
                    "points": 78,
                    "ranking_movement": -3,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:108701",
                        "name": "Noel, Mallaurie",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "NOE"
                    }
                },
                {
                    "rank": 497,
                    "points": 77,
                    "ranking_movement": 0,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:228418",
                        "name": "Navarro, Emma",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "NAV"
                    }
                },
                {
                    "rank": 498,
                    "points": 77,
                    "ranking_movement": 21,
                    "tournaments_played": 8,
                    "player": {
                        "id": "sr:competitor:282597",
                        "name": "Park, Sohyun",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "PAR"
                    }
                },
                {
                    "rank": 499,
                    "points": 77,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:119566",
                        "name": "Arshinkova, Petia",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "ARS"
                    }
                },
                {
                    "rank": 500,
                    "points": 77,
                    "ranking_movement": -5,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:192962",
                        "name": "Kilnarova, Monika",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "KIL"
                    }
                }
            ]
        },
        {
            "name": "ATP",
            "type": "ATP",
            "year": 2020,
            "week": 12,
            "category_id": "sr:category:3",
            "player_rankings": [
                {
                    "rank": 1,
                    "points": 10220,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:14882",
                        "name": "Djokovic, Novak",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "DJO"
                    }
                },
                {
                    "rank": 2,
                    "points": 9850,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:14486",
                        "name": "Nadal, Rafael",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "NAD"
                    }
                },
                {
                    "rank": 3,
                    "points": 7045,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:43748",
                        "name": "Thiem, Dominic",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "THI"
                    }
                },
                {
                    "rank": 4,
                    "points": 6630,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:14342",
                        "name": "Federer, Roger",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "FED"
                    }
                },
                {
                    "rank": 5,
                    "points": 5890,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:163504",
                        "name": "Medvedev, Daniil",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "MED"
                    }
                },
                {
                    "rank": 6,
                    "points": 4745,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:122366",
                        "name": "Tsitsipas, Stefanos",
                        "nationality": "Greece",
                        "country_code": "GRC",
                        "abbreviation": "TSI"
                    }
                },
                {
                    "rank": 7,
                    "points": 3630,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:57163",
                        "name": "Zverev, Alexander",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "ZVE"
                    }
                },
                {
                    "rank": 8,
                    "points": 2860,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:112783",
                        "name": "Berrettini, Matteo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BER"
                    }
                },
                {
                    "rank": 9,
                    "points": 2860,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:14844",
                        "name": "Monfils, Gael",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MON"
                    }
                },
                {
                    "rank": 10,
                    "points": 2555,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:25838",
                        "name": "Goffin, David",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "GOF"
                    }
                },
                {
                    "rank": 11,
                    "points": 2400,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:15434",
                        "name": "Fognini, Fabio",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "FOG"
                    }
                },
                {
                    "rank": 12,
                    "points": 2360,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:16720",
                        "name": "Bautista-Agut, Roberto",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BAU"
                    }
                },
                {
                    "rank": 13,
                    "points": 2265,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:48599",
                        "name": "Schwartzman, Diego",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "SWM"
                    }
                },
                {
                    "rank": 14,
                    "points": 2234,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:106755",
                        "name": "Rublev, Andrey",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "RUB"
                    }
                },
                {
                    "rank": 15,
                    "points": 2120,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:90080",
                        "name": "Khachanov, Karen",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KHA"
                    }
                },
                {
                    "rank": 16,
                    "points": 2075,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:117916",
                        "name": "Shapovalov, Denis",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "SHA"
                    }
                },
                {
                    "rank": 17,
                    "points": 2060,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:14548",
                        "name": "Wawrinka, Stan",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "WAW"
                    }
                },
                {
                    "rank": 18,
                    "points": 1900,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:64570",
                        "name": "Garin, Cristian",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "GAR"
                    }
                },
                {
                    "rank": 19,
                    "points": 1850,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:23581",
                        "name": "Dimitrov, Grigor",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "DIM"
                    }
                },
                {
                    "rank": 20,
                    "points": 1771,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:195800",
                        "name": "Auger-Aliassime, Felix",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "AUG"
                    }
                },
                {
                    "rank": 21,
                    "points": 1760,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:16120",
                        "name": "Isner, John",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ISN"
                    }
                },
                {
                    "rank": 22,
                    "points": 1738,
                    "ranking_movement": 0,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:22218",
                        "name": "Paire, Benoit",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PAI"
                    }
                },
                {
                    "rank": 23,
                    "points": 1695,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:39234",
                        "name": "Lajovic, Dusan",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "LAJ"
                    }
                },
                {
                    "rank": 24,
                    "points": 1510,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:136042",
                        "name": "Fritz, Taylor",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "FRI"
                    }
                },
                {
                    "rank": 25,
                    "points": 1500,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:40800",
                        "name": "Carreno-Busta, Pablo",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 26,
                    "points": 1485,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:214182",
                        "name": "de Minaur, Alex",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "DEM"
                    }
                },
                {
                    "rank": 27,
                    "points": 1395,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:26204",
                        "name": "Basilashvili, Nikoloz",
                        "nationality": "Georgia",
                        "country_code": "GEO",
                        "abbreviation": "BAS"
                    }
                },
                {
                    "rank": 28,
                    "points": 1359,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16375",
                        "name": "Evans, Daniel",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "EVA"
                    }
                },
                {
                    "rank": 29,
                    "points": 1353,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:158896",
                        "name": "Hurkacz, Hubert",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "HUR"
                    }
                },
                {
                    "rank": 30,
                    "points": 1350,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:18111",
                        "name": "Raonic, Milos",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "RAO"
                    }
                },
                {
                    "rank": 31,
                    "points": 1345,
                    "ranking_movement": 0,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:15733",
                        "name": "Nishikori, Kei",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NIS"
                    }
                },
                {
                    "rank": 32,
                    "points": 1343,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:22970",
                        "name": "Krajinovic, Filip",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "KRA"
                    }
                },
                {
                    "rank": 33,
                    "points": 1320,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:64580",
                        "name": "Coric, Borna",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "COR"
                    }
                },
                {
                    "rank": 34,
                    "points": 1315,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:46391",
                        "name": "Struff, Jan-Lennard",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "STR"
                    }
                },
                {
                    "rank": 35,
                    "points": 1310,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:24418",
                        "name": "Pella, Guido",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "PEL"
                    }
                },
                {
                    "rank": 36,
                    "points": 1279,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:119248",
                        "name": "Ruud, Casper",
                        "nationality": "Norway",
                        "country_code": "NOR",
                        "abbreviation": "RUU"
                    }
                },
                {
                    "rank": 37,
                    "points": 1225,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:15387",
                        "name": "Cilic, Marin",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "CIL"
                    }
                },
                {
                    "rank": 38,
                    "points": 1191,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:15894",
                        "name": "Mannarino, Adrian",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MAN"
                    }
                },
                {
                    "rank": 39,
                    "points": 1177,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:130400",
                        "name": "Opelka, Reilly",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "OPE"
                    }
                },
                {
                    "rank": 40,
                    "points": 1170,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:62490",
                        "name": "Kyrgios, Nick",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "KYR"
                    }
                },
                {
                    "rank": 41,
                    "points": 1130,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:16822",
                        "name": "Ramos-Vinolas, Albert",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "RAM"
                    }
                },
                {
                    "rank": 42,
                    "points": 1111,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:185388",
                        "name": "Humbert, Ugo",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HUM"
                    }
                },
                {
                    "rank": 43,
                    "points": 1071,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:33115",
                        "name": "Millman, John",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "MIL"
                    }
                },
                {
                    "rank": 44,
                    "points": 1050,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:65382",
                        "name": "Edmund, Kyle",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "EDM"
                    }
                },
                {
                    "rank": 45,
                    "points": 1045,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:15301",
                        "name": "Querrey, Sam",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "QUE"
                    }
                },
                {
                    "rank": 46,
                    "points": 1030,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:104847",
                        "name": "Sonego, Lorenzo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "SON"
                    }
                },
                {
                    "rank": 47,
                    "points": 1028,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:130398",
                        "name": "Kecmanovic, Miomir",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "KEC"
                    }
                },
                {
                    "rank": 48,
                    "points": 1007,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:59281",
                        "name": "Nishioka, Yoshihito",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NIS"
                    }
                },
                {
                    "rank": 49,
                    "points": 1005,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:15090",
                        "name": "Tsonga, Jo-Wilfried",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "TSO"
                    }
                },
                {
                    "rank": 50,
                    "points": 985,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:14414",
                        "name": "Gasquet, Richard",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GAS"
                    }
                },
                {
                    "rank": 51,
                    "points": 965,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:163480",
                        "name": "Bublik, Alexander",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "BUB"
                    }
                },
                {
                    "rank": 52,
                    "points": 945,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:14488",
                        "name": "Verdasco, Fernando",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "VER"
                    }
                },
                {
                    "rank": 53,
                    "points": 942,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:15432",
                        "name": "Andujar, Pablo",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 54,
                    "points": 935,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:14736",
                        "name": "Simon, Gilles",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "SIM"
                    }
                },
                {
                    "rank": 55,
                    "points": 923,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:36678",
                        "name": "Sandgren, Tennys",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 56,
                    "points": 908,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:14465",
                        "name": "Lopez, Feliciano",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "LOP"
                    }
                },
                {
                    "rank": 57,
                    "points": 894,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:138546",
                        "name": "Paul, Tommy",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "PAU"
                    }
                },
                {
                    "rank": 58,
                    "points": 880,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:57703",
                        "name": "Pouille, Lucas",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "POU"
                    }
                },
                {
                    "rank": 59,
                    "points": 860,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:15829",
                        "name": "Chardy, Jeremy",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "CHA"
                    }
                },
                {
                    "rank": 60,
                    "points": 857,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:15789",
                        "name": "Cuevas, Pablo",
                        "nationality": "Uruguay",
                        "country_code": "URY",
                        "abbreviation": "CUE"
                    }
                },
                {
                    "rank": 61,
                    "points": 850,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:38022",
                        "name": "Bedene, Aljaz",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "BED"
                    }
                },
                {
                    "rank": 62,
                    "points": 832,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:47297",
                        "name": "Londero, Juan Ignacio",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "LJI"
                    }
                },
                {
                    "rank": 63,
                    "points": 825,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:38493",
                        "name": "Johnson, Steve",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "JOH"
                    }
                },
                {
                    "rank": 64,
                    "points": 823,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:87690",
                        "name": "Thompson, Jordan",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "THO"
                    }
                },
                {
                    "rank": 65,
                    "points": 785,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:41857",
                        "name": "Vesely, Jiri",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "VES"
                    }
                },
                {
                    "rank": 66,
                    "points": 776,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:37785",
                        "name": "Sousa, Joao",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "SOU"
                    }
                },
                {
                    "rank": 67,
                    "points": 772,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:44547",
                        "name": "Albot, Radu",
                        "nationality": "Moldova",
                        "country_code": "MDA",
                        "abbreviation": "ALB"
                    }
                },
                {
                    "rank": 68,
                    "points": 759,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:152048",
                        "name": "Ymer, Mikael",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "YME"
                    }
                },
                {
                    "rank": 69,
                    "points": 744,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:49283",
                        "name": "Gerasimov, Egor",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "GER"
                    }
                },
                {
                    "rank": 70,
                    "points": 742,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:97647",
                        "name": "Kwon, Soonwoo",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "KWON"
                    }
                },
                {
                    "rank": 71,
                    "points": 740,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:44553",
                        "name": "Herbert, Pierre-Hugues",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HER"
                    }
                },
                {
                    "rank": 72,
                    "points": 739,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:22956",
                        "name": "Berankis, Ricardas",
                        "nationality": "Lithuania",
                        "country_code": "LTU",
                        "abbreviation": "BER"
                    }
                },
                {
                    "rank": 73,
                    "points": 733,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:225050",
                        "name": "Sinner, Jannik",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "SIN"
                    }
                },
                {
                    "rank": 74,
                    "points": 729,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:14624",
                        "name": "Kohlschreiber, Philipp",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "KOH"
                    }
                },
                {
                    "rank": 75,
                    "points": 722,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:175014",
                        "name": "Moutet, Corentin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MOU"
                    }
                },
                {
                    "rank": 76,
                    "points": 715,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:24309",
                        "name": "Balazs, Attila",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "BAL"
                    }
                },
                {
                    "rank": 77,
                    "points": 712,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:95935",
                        "name": "Norrie, Cameron",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "NOR"
                    }
                },
                {
                    "rank": 78,
                    "points": 711,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:35167",
                        "name": "Delbonis, Federico",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "DEL"
                    }
                },
                {
                    "rank": 79,
                    "points": 711,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:69500",
                        "name": "Mager, Gianluca",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MAG"
                    }
                },
                {
                    "rank": 80,
                    "points": 705,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:97231",
                        "name": "Djere, Laslo",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "DJE"
                    }
                },
                {
                    "rank": 81,
                    "points": 700,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:101101",
                        "name": "Tiafoe, Frances",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "TIA"
                    }
                },
                {
                    "rank": 82,
                    "points": 699,
                    "ranking_movement": 0,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:47603",
                        "name": "Monteiro, Thiago",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "MON"
                    }
                },
                {
                    "rank": 83,
                    "points": 697,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:39711",
                        "name": "Duckworth, James",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "DUC"
                    }
                },
                {
                    "rank": 84,
                    "points": 692,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:47770",
                        "name": "Fucsovics, Marton",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "FUC"
                    }
                },
                {
                    "rank": 85,
                    "points": 686,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:59304",
                        "name": "Novak, Dennis",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "NOV"
                    }
                },
                {
                    "rank": 86,
                    "points": 684,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:36300",
                        "name": "Travaglia, Stefano",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "TRA"
                    }
                },
                {
                    "rank": 87,
                    "points": 682,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:16507",
                        "name": "Sugita, Yuichi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SUG"
                    }
                },
                {
                    "rank": 88,
                    "points": 671,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:14773",
                        "name": "Seppi, Andreas",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "SEP"
                    }
                },
                {
                    "rank": 89,
                    "points": 671,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:89632",
                        "name": "Jarry, Nicolas",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "JAR"
                    }
                },
                {
                    "rank": 90,
                    "points": 669,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:46390",
                        "name": "Uchiyama, Yasutaka",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "UCH"
                    }
                },
                {
                    "rank": 91,
                    "points": 661,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:16683",
                        "name": "Kukushkin, Mikhail",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "KUK"
                    }
                },
                {
                    "rank": 92,
                    "points": 643,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:129368",
                        "name": "Koepfer, Dominik",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "KOE"
                    }
                },
                {
                    "rank": 93,
                    "points": 642,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:16779",
                        "name": "Pospisil, Vasek",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "POS"
                    }
                },
                {
                    "rank": 94,
                    "points": 638,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:57289",
                        "name": "Dellien, Hugo",
                        "nationality": "Bolivia",
                        "country_code": "BOL",
                        "abbreviation": "DEL"
                    }
                },
                {
                    "rank": 95,
                    "points": 637,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:67154",
                        "name": "Barrere, Gregoire",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 96,
                    "points": 629,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:24415",
                        "name": "Martin, Andrej",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 97,
                    "points": 627,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:157456",
                        "name": "Davidovich Fokina, Alejandro",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "DAV"
                    }
                },
                {
                    "rank": 98,
                    "points": 616,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:157808",
                        "name": "Harris, Lloyd",
                        "nationality": "South Africa",
                        "country_code": "ZAF",
                        "abbreviation": "HAR"
                    }
                },
                {
                    "rank": 99,
                    "points": 614,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:51141",
                        "name": "Carballes Baena, Roberto",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 100,
                    "points": 597,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:59310",
                        "name": "Caruso, Salvatore",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 101,
                    "points": 584,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:167370",
                        "name": "Ruusuvuori, Emil",
                        "nationality": "Finland",
                        "country_code": "FIN",
                        "abbreviation": "RUU"
                    }
                },
                {
                    "rank": 102,
                    "points": 577,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:42379",
                        "name": "Giron, Marcos",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "GIR"
                    }
                },
                {
                    "rank": 103,
                    "points": 575,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:128552",
                        "name": "Popyrin, Alexei",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "POP"
                    }
                },
                {
                    "rank": 104,
                    "points": 569,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:54573",
                        "name": "Coria, Federico",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "COR"
                    }
                },
                {
                    "rank": 105,
                    "points": 548,
                    "ranking_movement": 0,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:126356",
                        "name": "Munar, Jaume",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "MUN"
                    }
                },
                {
                    "rank": 106,
                    "points": 537,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:77223",
                        "name": "Martinez, Pedro",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 107,
                    "points": 524,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:49172",
                        "name": "Dzumhur, Damir",
                        "nationality": "Bosnia & Herzegovina",
                        "country_code": "BIH",
                        "abbreviation": "DZU"
                    }
                },
                {
                    "rank": 108,
                    "points": 523,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:108709",
                        "name": "Majchrzak, Kamil",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "MAJ"
                    }
                },
                {
                    "rank": 109,
                    "points": 522,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:50139",
                        "name": "Gombos, Norbert",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "GOM"
                    }
                },
                {
                    "rank": 110,
                    "points": 522,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:17988",
                        "name": "Sousa, Pedro",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "SOU"
                    }
                },
                {
                    "rank": 111,
                    "points": 521,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:36595",
                        "name": "Kudla, Denis",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KUD"
                    }
                },
                {
                    "rank": 112,
                    "points": 511,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:48632",
                        "name": "Daniel, Taro",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "DAN"
                    }
                },
                {
                    "rank": 113,
                    "points": 508,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:44549",
                        "name": "Cecchinato, Marco",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "CEC"
                    }
                },
                {
                    "rank": 114,
                    "points": 507,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:161262",
                        "name": "Seyboth Wild, Thiago",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "SEY"
                    }
                },
                {
                    "rank": 115,
                    "points": 505,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:17017",
                        "name": "Donskoy, Evgeny",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "DON"
                    }
                },
                {
                    "rank": 116,
                    "points": 498,
                    "ranking_movement": 0,
                    "tournaments_played": 35,
                    "player": {
                        "id": "sr:competitor:58221",
                        "name": "O'Connell, Christopher",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "OCO"
                    }
                },
                {
                    "rank": 117,
                    "points": 480,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:15739",
                        "name": "Soeda, Go",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SOE"
                    }
                },
                {
                    "rank": 118,
                    "points": 464,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:15565",
                        "name": "Mayer, Leonardo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "MAY"
                    }
                },
                {
                    "rank": 119,
                    "points": 462,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:80665",
                        "name": "Polmans, Marc",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "POL"
                    }
                },
                {
                    "rank": 120,
                    "points": 462,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:63446",
                        "name": "Jung, Jason",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "JUN"
                    }
                },
                {
                    "rank": 121,
                    "points": 447,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:14914",
                        "name": "Lorenzi, Paolo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "LOR"
                    }
                },
                {
                    "rank": 122,
                    "points": 447,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:57021",
                        "name": "Kovalik, Jozef",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "KOV"
                    }
                },
                {
                    "rank": 123,
                    "points": 445,
                    "ranking_movement": 0,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:15561",
                        "name": "Anderson, Kevin",
                        "nationality": "South Africa",
                        "country_code": "ZAF",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 124,
                    "points": 444,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:14527",
                        "name": "Karlovic, Ivo",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "KAR"
                    }
                },
                {
                    "rank": 125,
                    "points": 444,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16194",
                        "name": "Gojowczyk, Peter",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "GOJ"
                    }
                },
                {
                    "rank": 126,
                    "points": 436,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:38408",
                        "name": "Klahn, Bradley",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KLA"
                    }
                },
                {
                    "rank": 127,
                    "points": 423,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:131566",
                        "name": "Nagal, Sumit",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "NAG"
                    }
                },
                {
                    "rank": 128,
                    "points": 415,
                    "ranking_movement": 0,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:15276",
                        "name": "Del Potro, Juan Martin",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "DEL"
                    }
                },
                {
                    "rank": 129,
                    "points": 412,
                    "ranking_movement": 0,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:15126",
                        "name": "Murray, Andy",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "MUR"
                    }
                },
                {
                    "rank": 130,
                    "points": 412,
                    "ranking_movement": 0,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:23664",
                        "name": "Gaio, Federico",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GAI"
                    }
                },
                {
                    "rank": 131,
                    "points": 407,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:42029",
                        "name": "Safwat, Mohamed",
                        "nationality": "Egypt",
                        "country_code": "EGY",
                        "abbreviation": "SAF"
                    }
                },
                {
                    "rank": 132,
                    "points": 405,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:18215",
                        "name": "Gunneswaran, Prajnesh",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "GUN"
                    }
                },
                {
                    "rank": 133,
                    "points": 405,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:23670",
                        "name": "Stebe, Cedrik-Marcel",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "STE"
                    }
                },
                {
                    "rank": 134,
                    "points": 404,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:38183",
                        "name": "Bagnis, Facundo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "BAG"
                    }
                },
                {
                    "rank": 135,
                    "points": 403,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:72248",
                        "name": "Varillas, Juan Pablo",
                        "nationality": "Peru",
                        "country_code": "PER",
                        "abbreviation": "VAR"
                    }
                },
                {
                    "rank": 136,
                    "points": 402,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:94747",
                        "name": "Hoang, Antoine",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HOA"
                    }
                },
                {
                    "rank": 137,
                    "points": 400,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:17018",
                        "name": "Laaksonen, Henri",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "LAA"
                    }
                },
                {
                    "rank": 138,
                    "points": 396,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:89320",
                        "name": "Ivashka, Ilya",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "IVA"
                    }
                },
                {
                    "rank": 139,
                    "points": 389,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:47295",
                        "name": "Andreozzi, Guido",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "AND"
                    }
                },
                {
                    "rank": 140,
                    "points": 389,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:75813",
                        "name": "Zhang, Zhizhen",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHA"
                    }
                },
                {
                    "rank": 141,
                    "points": 387,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:25455",
                        "name": "Rola, Blaz",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "ROL"
                    }
                },
                {
                    "rank": 142,
                    "points": 383,
                    "ranking_movement": 0,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:83211",
                        "name": "Chung, Hyeon",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "CHU"
                    }
                },
                {
                    "rank": 143,
                    "points": 383,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:47975",
                        "name": "Hanfmann, Yannick",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HAN"
                    }
                },
                {
                    "rank": 144,
                    "points": 383,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:234048",
                        "name": "Wolf, Jeffrey John",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "WOL"
                    }
                },
                {
                    "rank": 145,
                    "points": 382,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:74439",
                        "name": "Milojevic, Nikola",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "MIL"
                    }
                },
                {
                    "rank": 146,
                    "points": 380,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:58369",
                        "name": "Bolt, Alex",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "BOL"
                    }
                },
                {
                    "rank": 147,
                    "points": 379,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:16515",
                        "name": "Fabbiano, Thomas",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "FAB"
                    }
                },
                {
                    "rank": 148,
                    "points": 379,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:92074",
                        "name": "Galan, Daniel Elahi",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "GAL"
                    }
                },
                {
                    "rank": 149,
                    "points": 370,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:87678",
                        "name": "Maden, Yannick",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MAD"
                    }
                },
                {
                    "rank": 150,
                    "points": 367,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:15568",
                        "name": "Granollers, Marcel",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GRA"
                    }
                },
                {
                    "rank": 151,
                    "points": 365,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:26203",
                        "name": "Gomez, Emilio",
                        "nationality": "Ecuador",
                        "country_code": "ECU",
                        "abbreviation": "GOM"
                    }
                },
                {
                    "rank": 152,
                    "points": 357,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:57327",
                        "name": "Domingues, Joao",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "DOM"
                    }
                },
                {
                    "rank": 153,
                    "points": 356,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:48626",
                        "name": "Giustino, Lorenzo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GIU"
                    }
                },
                {
                    "rank": 154,
                    "points": 353,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:54955",
                        "name": "Coppejans, Kimmer",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "COP"
                    }
                },
                {
                    "rank": 155,
                    "points": 342,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:17959",
                        "name": "Ito, Tatsuma",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "ITO"
                    }
                },
                {
                    "rank": 156,
                    "points": 339,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:15743",
                        "name": "Istomin, Denis",
                        "nationality": "Uzbekistan",
                        "country_code": "UZB",
                        "abbreviation": "IST"
                    }
                },
                {
                    "rank": 157,
                    "points": 337,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:51185",
                        "name": "Petrovic, Danilo",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "PET"
                    }
                },
                {
                    "rank": 158,
                    "points": 331,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:23598",
                        "name": "Marcora, Roberto",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 159,
                    "points": 327,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:15983",
                        "name": "Klizan, Martin",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "KLI"
                    }
                },
                {
                    "rank": 160,
                    "points": 326,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:16833",
                        "name": "Giannessi, Alessandro",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "GIA"
                    }
                },
                {
                    "rank": 161,
                    "points": 323,
                    "ranking_movement": 0,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:63606",
                        "name": "Rinderknech, Arthur",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "RIN"
                    }
                },
                {
                    "rank": 162,
                    "points": 321,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:15725",
                        "name": "Gulbis, Ernests",
                        "nationality": "Latvia",
                        "country_code": "LVA",
                        "abbreviation": "GUL"
                    }
                },
                {
                    "rank": 163,
                    "points": 321,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:83397",
                        "name": "Ofner, Sebastian",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "OFN"
                    }
                },
                {
                    "rank": 164,
                    "points": 320,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:269521",
                        "name": "Cressy, Maxime",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "CRE"
                    }
                },
                {
                    "rank": 165,
                    "points": 315,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:36298",
                        "name": "Diez, Steven",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "DIE"
                    }
                },
                {
                    "rank": 166,
                    "points": 314,
                    "ranking_movement": 2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:212004",
                        "name": "Rodionov, Jurij",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "ROD"
                    }
                },
                {
                    "rank": 167,
                    "points": 313,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:116616",
                        "name": "Clarke, Jay",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "CLA"
                    }
                },
                {
                    "rank": 168,
                    "points": 311,
                    "ranking_movement": 2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:87808",
                        "name": "Torpegaard, Mikael",
                        "nationality": "Denmark",
                        "country_code": "DNK",
                        "abbreviation": "TOR"
                    }
                },
                {
                    "rank": 169,
                    "points": 307,
                    "ranking_movement": -2,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:14903",
                        "name": "Stakhovsky, Sergiy",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "STA"
                    }
                },
                {
                    "rank": 170,
                    "points": 305,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16042",
                        "name": "Haase, Robin",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "HAA"
                    }
                },
                {
                    "rank": 171,
                    "points": 303,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:38908",
                        "name": "Horansky, Filip",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "HOR"
                    }
                },
                {
                    "rank": 172,
                    "points": 297,
                    "ranking_movement": 0,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:15804",
                        "name": "Lacko, Lukas",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "LAC"
                    }
                },
                {
                    "rank": 173,
                    "points": 292,
                    "ranking_movement": 4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:102339",
                        "name": "van de Zandschulp, Botic",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 174,
                    "points": 290,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:102151",
                        "name": "Tabilo, Alejandro",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "TAB"
                    }
                },
                {
                    "rank": 175,
                    "points": 290,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:108559",
                        "name": "Taberner, Carlos",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "TAB"
                    }
                },
                {
                    "rank": 176,
                    "points": 290,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:50901",
                        "name": "Popko, Dmitry",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "POP"
                    }
                },
                {
                    "rank": 177,
                    "points": 286,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:66470",
                        "name": "Schnur, Brayden",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "SCH"
                    }
                },
                {
                    "rank": 178,
                    "points": 286,
                    "ranking_movement": 11,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:124930",
                        "name": "Safiullin, Roman",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "SAF"
                    }
                },
                {
                    "rank": 179,
                    "points": 286,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:74441",
                        "name": "Couacaud, Enzo",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "COU"
                    }
                },
                {
                    "rank": 180,
                    "points": 285,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:16286",
                        "name": "Rosol, Lukas",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "ROS"
                    }
                },
                {
                    "rank": 181,
                    "points": 284,
                    "ranking_movement": -1,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:80491",
                        "name": "Escobedo, Ernesto",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ESC"
                    }
                },
                {
                    "rank": 182,
                    "points": 281,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:131442",
                        "name": "Mmoh, Michael",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MMO"
                    }
                },
                {
                    "rank": 183,
                    "points": 281,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:63642",
                        "name": "Kwiatkowski, Thai-Son",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KWI"
                    }
                },
                {
                    "rank": 184,
                    "points": 281,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:15468",
                        "name": "Troicki, Viktor",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "TRO"
                    }
                },
                {
                    "rank": 185,
                    "points": 279,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:121606",
                        "name": "Menezes, Joao",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "MEN"
                    }
                },
                {
                    "rank": 186,
                    "points": 278,
                    "ranking_movement": -1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:58877",
                        "name": "Ramanathan, Ramkumar",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "RAM"
                    }
                },
                {
                    "rank": 187,
                    "points": 277,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:16327",
                        "name": "Copil, Marius",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "COP"
                    }
                },
                {
                    "rank": 188,
                    "points": 275,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:71336",
                        "name": "Vilella Martinez, Mario",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "VIL"
                    }
                },
                {
                    "rank": 189,
                    "points": 273,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:231192",
                        "name": "Molleker, Rudolf",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MOL"
                    }
                },
                {
                    "rank": 190,
                    "points": 271,
                    "ranking_movement": 9,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:122368",
                        "name": "Griekspoor, Tallon",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "GRI"
                    }
                },
                {
                    "rank": 191,
                    "points": 270,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:107625",
                        "name": "Janvier, Maxime",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "JAN"
                    }
                },
                {
                    "rank": 192,
                    "points": 270,
                    "ranking_movement": -1,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:16174",
                        "name": "Polansky, Peter",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "POL"
                    }
                },
                {
                    "rank": 193,
                    "points": 268,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:66484",
                        "name": "Ferreira Silva, Frederico",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "FER"
                    }
                },
                {
                    "rank": 194,
                    "points": 264,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:90798",
                        "name": "Halys, Quentin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HAL"
                    }
                },
                {
                    "rank": 195,
                    "points": 264,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:52276",
                        "name": "Krueger, Mitchell",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KRU"
                    }
                },
                {
                    "rank": 196,
                    "points": 263,
                    "ranking_movement": -1,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:51144",
                        "name": "Lopez Perez, Enrique",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "LOP"
                    }
                },
                {
                    "rank": 197,
                    "points": 260,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:124656",
                        "name": "Vukic, Aleksandar",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "VUK"
                    }
                },
                {
                    "rank": 198,
                    "points": 259,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:43761",
                        "name": "Collarini, Andrea",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "COL"
                    }
                },
                {
                    "rank": 199,
                    "points": 257,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:53183",
                        "name": "Ilkel, Cem",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "ILK"
                    }
                },
                {
                    "rank": 200,
                    "points": 255,
                    "ranking_movement": 9,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:16192",
                        "name": "Marchenko, Illya",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 201,
                    "points": 254,
                    "ranking_movement": 5,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:83661",
                        "name": "Ymer, Elias",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "YME"
                    }
                },
                {
                    "rank": 202,
                    "points": 253,
                    "ranking_movement": -2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:17080",
                        "name": "Tomic, Bernard",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "TOM"
                    }
                },
                {
                    "rank": 203,
                    "points": 251,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:14651",
                        "name": "Garcia-Lopez, Guillermo",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GAR"
                    }
                },
                {
                    "rank": 204,
                    "points": 251,
                    "ranking_movement": -2,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:62488",
                        "name": "Harris, Andrew",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "HAR"
                    }
                },
                {
                    "rank": 205,
                    "points": 250,
                    "ranking_movement": -2,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:113979",
                        "name": "Ficovich, Juan Pablo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "FIC"
                    }
                },
                {
                    "rank": 206,
                    "points": 249,
                    "ranking_movement": -2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:15300",
                        "name": "Sela, Dudi",
                        "nationality": "Israel",
                        "country_code": "ISR",
                        "abbreviation": "SEL"
                    }
                },
                {
                    "rank": 207,
                    "points": 248,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:43746",
                        "name": "Li, Zhe",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "LIZ"
                    }
                },
                {
                    "rank": 208,
                    "points": 242,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:135786",
                        "name": "Benchetrit, Elliot",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BEN"
                    }
                },
                {
                    "rank": 209,
                    "points": 241,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:55787",
                        "name": "Olivo, Renzo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "OLI"
                    }
                },
                {
                    "rank": 210,
                    "points": 240,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:62790",
                        "name": "Lestienne, Constant",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "LES"
                    }
                },
                {
                    "rank": 211,
                    "points": 240,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:47764",
                        "name": "Broady, Liam",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 212,
                    "points": 240,
                    "ranking_movement": 8,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:108565",
                        "name": "Zapata Miralles, Bernabe",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ZAP"
                    }
                },
                {
                    "rank": 213,
                    "points": 239,
                    "ranking_movement": -1,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:14508",
                        "name": "Mahut, Nicolas",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MAH"
                    }
                },
                {
                    "rank": 214,
                    "points": 239,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:14335",
                        "name": "Robredo, Tommy",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ROB"
                    }
                },
                {
                    "rank": 215,
                    "points": 235,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:17004",
                        "name": "Bemelmans, Ruben",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "BEM"
                    }
                },
                {
                    "rank": 216,
                    "points": 233,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:124658",
                        "name": "Purcell, Max",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "PUR"
                    }
                },
                {
                    "rank": 217,
                    "points": 231,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:62404",
                        "name": "Otte, Oscar",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "OTT"
                    }
                },
                {
                    "rank": 218,
                    "points": 231,
                    "ranking_movement": 23,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:94485",
                        "name": "Bonzi, Benjamin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BON"
                    }
                },
                {
                    "rank": 219,
                    "points": 230,
                    "ranking_movement": -2,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:127208",
                        "name": "Altmaier, Daniel",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "ALT"
                    }
                },
                {
                    "rank": 220,
                    "points": 229,
                    "ranking_movement": -2,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:294300",
                        "name": "Nakashima, Brandon",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "NAK"
                    }
                },
                {
                    "rank": 221,
                    "points": 229,
                    "ranking_movement": -2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:51309",
                        "name": "Cid Subervi, Roberto",
                        "nationality": "Dominican Republic",
                        "country_code": "DOM",
                        "abbreviation": "CID"
                    }
                },
                {
                    "rank": 222,
                    "points": 223,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:24003",
                        "name": "Viola, Matteo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "VIO"
                    }
                },
                {
                    "rank": 223,
                    "points": 222,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:38180",
                        "name": "Mena, Facundo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "MEN"
                    }
                },
                {
                    "rank": 224,
                    "points": 220,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:203681",
                        "name": "Korda, Sebastian",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KOR"
                    }
                },
                {
                    "rank": 225,
                    "points": 219,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:65016",
                        "name": "Rubin, Noah",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "RUB"
                    }
                },
                {
                    "rank": 226,
                    "points": 219,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:157302",
                        "name": "Watanuki, Yosuke",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "WAT"
                    }
                },
                {
                    "rank": 227,
                    "points": 218,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:52462",
                        "name": "Vatutin, Alexey",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "VAT"
                    }
                },
                {
                    "rank": 228,
                    "points": 215,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:223874",
                        "name": "Gaston, Hugo",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GAS"
                    }
                },
                {
                    "rank": 229,
                    "points": 215,
                    "ranking_movement": -1,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:132558",
                        "name": "Kolar, Zdenek",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "KOL"
                    }
                },
                {
                    "rank": 230,
                    "points": 213,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:25683",
                        "name": "Bai, Yan",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "BAI"
                    }
                },
                {
                    "rank": 231,
                    "points": 212,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:38517",
                        "name": "Trungelliti, Marco",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "TRU"
                    }
                },
                {
                    "rank": 232,
                    "points": 212,
                    "ranking_movement": -1,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:202497",
                        "name": "Kuhn, Nicola",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "KUH"
                    }
                },
                {
                    "rank": 233,
                    "points": 211,
                    "ranking_movement": 6,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:15958",
                        "name": "Kamke, Tobias",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "KAM"
                    }
                },
                {
                    "rank": 234,
                    "points": 210,
                    "ranking_movement": -2,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:39726",
                        "name": "Kubler, Jason",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "KUB"
                    }
                },
                {
                    "rank": 235,
                    "points": 210,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:32466",
                        "name": "Moriya, Hiroki",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "MOR"
                    }
                },
                {
                    "rank": 236,
                    "points": 210,
                    "ranking_movement": -2,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:100097",
                        "name": "Moroni, Gian Marco",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MOR"
                    }
                },
                {
                    "rank": 237,
                    "points": 209,
                    "ranking_movement": -2,
                    "tournaments_played": 7,
                    "player": {
                        "id": "sr:competitor:71280",
                        "name": "Kokkinakis, Thanasi",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "KOK"
                    }
                },
                {
                    "rank": 238,
                    "points": 209,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:206879",
                        "name": "Eubanks, Christopher",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "EUB"
                    }
                },
                {
                    "rank": 239,
                    "points": 209,
                    "ranking_movement": 7,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:15931",
                        "name": "Brown, Dustin",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 240,
                    "points": 209,
                    "ranking_movement": -3,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:163996",
                        "name": "Wu, Tung-Lin",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "WUT"
                    }
                },
                {
                    "rank": 241,
                    "points": 208,
                    "ranking_movement": -3,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:14552",
                        "name": "Tipsarevic, Janko",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "TIP"
                    }
                },
                {
                    "rank": 242,
                    "points": 207,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:137810",
                        "name": "Blanch, Ulises",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BLA"
                    }
                },
                {
                    "rank": 243,
                    "points": 207,
                    "ranking_movement": -1,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:107357",
                        "name": "Grenier, Hugo",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GRE"
                    }
                },
                {
                    "rank": 244,
                    "points": 204,
                    "ranking_movement": 3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:255595",
                        "name": "Cerundolo, Francisco",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "CER"
                    }
                },
                {
                    "rank": 245,
                    "points": 203,
                    "ranking_movement": -2,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:42151",
                        "name": "Nam, Ji Sung",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "NAM"
                    }
                },
                {
                    "rank": 246,
                    "points": 203,
                    "ranking_movement": -2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:73016",
                        "name": "Krstin, Pedja",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "KRS"
                    }
                },
                {
                    "rank": 247,
                    "points": 202,
                    "ranking_movement": -2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:88992",
                        "name": "Muller, Alexandre",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MUL"
                    }
                },
                {
                    "rank": 248,
                    "points": 202,
                    "ranking_movement": 1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:54903",
                        "name": "Karlovskiy, Evgeny",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAR"
                    }
                },
                {
                    "rank": 249,
                    "points": 199,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:84253",
                        "name": "Baldi, Filippo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BAL"
                    }
                },
                {
                    "rank": 250,
                    "points": 199,
                    "ranking_movement": 2,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:53483",
                        "name": "Masur, Daniel",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MAS"
                    }
                },
                {
                    "rank": 251,
                    "points": 198,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:52133",
                        "name": "Lenz, Julian",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "LEN"
                    }
                },
                {
                    "rank": 252,
                    "points": 196,
                    "ranking_movement": -1,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:15098",
                        "name": "Darcis, Steve",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "DAR"
                    }
                },
                {
                    "rank": 253,
                    "points": 194,
                    "ranking_movement": 10,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:60502",
                        "name": "Karatsev, Aslan",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KAR"
                    }
                },
                {
                    "rank": 254,
                    "points": 193,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:93695",
                        "name": "Lee, Duckhee",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "LEE"
                    }
                },
                {
                    "rank": 255,
                    "points": 191,
                    "ranking_movement": -1,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:58371",
                        "name": "Bourgue, Mathias",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BOU"
                    }
                },
                {
                    "rank": 256,
                    "points": 189,
                    "ranking_movement": -1,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:300540",
                        "name": "Machac, Tomas",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "MAC"
                    }
                },
                {
                    "rank": 257,
                    "points": 188,
                    "ranking_movement": -1,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:14823",
                        "name": "Gabashvili, Teymuraz",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "GAB"
                    }
                },
                {
                    "rank": 258,
                    "points": 187,
                    "ranking_movement": -1,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:16011",
                        "name": "Zverev, Mischa",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "ZVE"
                    }
                },
                {
                    "rank": 259,
                    "points": 182,
                    "ranking_movement": -1,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:42152",
                        "name": "Napolitano, Stefano",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "NAP"
                    }
                },
                {
                    "rank": 260,
                    "points": 182,
                    "ranking_movement": -1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:83263",
                        "name": "Santillan, Akira",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 261,
                    "points": 181,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:15853",
                        "name": "Jaziri, Malek",
                        "nationality": "Tunisia",
                        "country_code": "TUN",
                        "abbreviation": "JAZ"
                    }
                },
                {
                    "rank": 262,
                    "points": 179,
                    "ranking_movement": -1,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:55427",
                        "name": "Fratangelo, Bjorn",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "FRA"
                    }
                },
                {
                    "rank": 263,
                    "points": 179,
                    "ranking_movement": 5,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:75237",
                        "name": "Moraing, Mats",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MOR"
                    }
                },
                {
                    "rank": 264,
                    "points": 179,
                    "ranking_movement": -2,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:16040",
                        "name": "Menendez-Maceiras, Adrian",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "MEN"
                    }
                },
                {
                    "rank": 265,
                    "points": 178,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:47767",
                        "name": "Lamasine, Tristan",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "LAM"
                    }
                },
                {
                    "rank": 266,
                    "points": 176,
                    "ranking_movement": -1,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:51323",
                        "name": "King, Darian",
                        "nationality": "Barbados",
                        "country_code": "BRB",
                        "abbreviation": "KIN"
                    }
                },
                {
                    "rank": 267,
                    "points": 176,
                    "ranking_movement": -1,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:141882",
                        "name": "Blancaneaux, Geoffrey",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "BLA"
                    }
                },
                {
                    "rank": 268,
                    "points": 175,
                    "ranking_movement": -1,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:15231",
                        "name": "Bachinger, Matthias",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "BAC"
                    }
                },
                {
                    "rank": 269,
                    "points": 175,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:59318",
                        "name": "Galovic, Viktor",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "GAL"
                    }
                },
                {
                    "rank": 270,
                    "points": 173,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:17985",
                        "name": "Clezar, Guilherme",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "CLE"
                    }
                },
                {
                    "rank": 271,
                    "points": 172,
                    "ranking_movement": 0,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:63438",
                        "name": "Mcdonald, Mackenzie",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "MCD"
                    }
                },
                {
                    "rank": 272,
                    "points": 171,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:52286",
                        "name": "Sekiguchi, Shuichi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SEK"
                    }
                },
                {
                    "rank": 273,
                    "points": 170,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16553",
                        "name": "Ward, James",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "WAR"
                    }
                },
                {
                    "rank": 274,
                    "points": 166,
                    "ranking_movement": 9,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:218538",
                        "name": "Kotov, Pavel",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KOT"
                    }
                },
                {
                    "rank": 275,
                    "points": 166,
                    "ranking_movement": -1,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:47296",
                        "name": "Ortega-Olmedo, Roberto",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ORT"
                    }
                },
                {
                    "rank": 276,
                    "points": 164,
                    "ranking_movement": -1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:89314",
                        "name": "Aragone, JC",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ARA"
                    }
                },
                {
                    "rank": 277,
                    "points": 163,
                    "ranking_movement": -1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:38793",
                        "name": "Quiroz, Roberto",
                        "nationality": "Ecuador",
                        "country_code": "ECU",
                        "abbreviation": "QUI"
                    }
                },
                {
                    "rank": 278,
                    "points": 163,
                    "ranking_movement": 0,
                    "tournaments_played": 41,
                    "player": {
                        "id": "sr:competitor:57759",
                        "name": "Oliveira, Goncalo",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "OLI"
                    }
                },
                {
                    "rank": 279,
                    "points": 162,
                    "ranking_movement": -2,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:124916",
                        "name": "Gojo, Borna",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "GOJ"
                    }
                },
                {
                    "rank": 280,
                    "points": 159,
                    "ranking_movement": -1,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:226036",
                        "name": "Tseng, Chun Hsin",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "TSE"
                    }
                },
                {
                    "rank": 281,
                    "points": 157,
                    "ranking_movement": -1,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:117866",
                        "name": "Mukund, Sasikumar",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "MUK"
                    }
                },
                {
                    "rank": 282,
                    "points": 155,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:16057",
                        "name": "Arnaboldi, Andrea",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "ARN"
                    }
                },
                {
                    "rank": 283,
                    "points": 154,
                    "ranking_movement": -1,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:132834",
                        "name": "Barrios Vera, Marcelo Tomas",
                        "nationality": "Chile",
                        "country_code": "CHL",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 284,
                    "points": 151,
                    "ranking_movement": 3,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:359602",
                        "name": "Musetti, Lorenzo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "MUS"
                    }
                },
                {
                    "rank": 285,
                    "points": 150,
                    "ranking_movement": 3,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:352776",
                        "name": "Draper, Jack",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "DRA"
                    }
                },
                {
                    "rank": 286,
                    "points": 150,
                    "ranking_movement": -2,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:53213",
                        "name": "King, Kevin",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KIN"
                    }
                },
                {
                    "rank": 287,
                    "points": 149,
                    "ranking_movement": -2,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:195516",
                        "name": "Brooksby, Jenson",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 288,
                    "points": 148,
                    "ranking_movement": -2,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:16282",
                        "name": "Kavcic, Blaz",
                        "nationality": "Slovenia",
                        "country_code": "SVN",
                        "abbreviation": "KAV"
                    }
                },
                {
                    "rank": 289,
                    "points": 144,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:16146",
                        "name": "Bellucci, Thomaz",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "BEL"
                    }
                },
                {
                    "rank": 290,
                    "points": 143,
                    "ranking_movement": 0,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:17038",
                        "name": "Smith, John-Patrick",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "SMI"
                    }
                },
                {
                    "rank": 291,
                    "points": 142,
                    "ranking_movement": 1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:198790",
                        "name": "Hernandez-Fernandez, Jose",
                        "nationality": "Dominican Republic",
                        "country_code": "DOM",
                        "abbreviation": "HER"
                    }
                },
                {
                    "rank": 292,
                    "points": 142,
                    "ranking_movement": -1,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:145130",
                        "name": "Molcan, Alex",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "MOL"
                    }
                },
                {
                    "rank": 293,
                    "points": 142,
                    "ranking_movement": 1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:78793",
                        "name": "Miedler, Lucas",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "MIE"
                    }
                },
                {
                    "rank": 294,
                    "points": 141,
                    "ranking_movement": -1,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:16409",
                        "name": "Ebden, Matthew",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "EBD"
                    }
                },
                {
                    "rank": 295,
                    "points": 140,
                    "ranking_movement": 0,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:15530",
                        "name": "Giraldo, Santiago",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "GIR"
                    }
                },
                {
                    "rank": 296,
                    "points": 140,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:177686",
                        "name": "Barranco Cosano, Javier",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "BAR"
                    }
                },
                {
                    "rank": 297,
                    "points": 140,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:65576",
                        "name": "Sakamoto, Pedro",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "SAK"
                    }
                },
                {
                    "rank": 298,
                    "points": 139,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:145112",
                        "name": "Huesler, Marc-Andrea",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "HUE"
                    }
                },
                {
                    "rank": 299,
                    "points": 139,
                    "ranking_movement": 1,
                    "tournaments_played": 35,
                    "player": {
                        "id": "sr:competitor:90110",
                        "name": "Serdarusic, Nino",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "SER"
                    }
                },
                {
                    "rank": 300,
                    "points": 138,
                    "ranking_movement": -1,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:23056",
                        "name": "Wu, Di",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "WUD"
                    }
                },
                {
                    "rank": 301,
                    "points": 137,
                    "ranking_movement": 0,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:111195",
                        "name": "Luz, Orlando",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "LUZ"
                    }
                },
                {
                    "rank": 302,
                    "points": 137,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:121182",
                        "name": "Guinard, Manuel",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "GUI"
                    }
                },
                {
                    "rank": 303,
                    "points": 136,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:95801",
                        "name": "Vavassori, Andrea",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "VAV"
                    }
                },
                {
                    "rank": 304,
                    "points": 136,
                    "ranking_movement": 0,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:66874",
                        "name": "Imai, Shintaro",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "IMA"
                    }
                },
                {
                    "rank": 305,
                    "points": 136,
                    "ranking_movement": 0,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:223998",
                        "name": "Zuk, Kacper",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "ZUK"
                    }
                },
                {
                    "rank": 306,
                    "points": 135,
                    "ranking_movement": 3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:163636",
                        "name": "Klein, Lukas",
                        "nationality": "Slovakia",
                        "country_code": "SVK",
                        "abbreviation": "KLE"
                    }
                },
                {
                    "rank": 307,
                    "points": 135,
                    "ranking_movement": -1,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:15737",
                        "name": "Young, Donald",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "YOU"
                    }
                },
                {
                    "rank": 308,
                    "points": 135,
                    "ranking_movement": -1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:79429",
                        "name": "Bourchier, Harry",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "BOU"
                    }
                },
                {
                    "rank": 309,
                    "points": 134,
                    "ranking_movement": -1,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:18066",
                        "name": "Basic, Mirza",
                        "nationality": "Bosnia & Herzegovina",
                        "country_code": "BIH",
                        "abbreviation": "BAS"
                    }
                },
                {
                    "rank": 310,
                    "points": 133,
                    "ranking_movement": 0,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:95829",
                        "name": "Ocleppo, Julian",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "OCL"
                    }
                },
                {
                    "rank": 311,
                    "points": 132,
                    "ranking_movement": 0,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:149100",
                        "name": "Sultanov, Khumoyun",
                        "nationality": "Uzbekistan",
                        "country_code": "UZB",
                        "abbreviation": "SUL"
                    }
                },
                {
                    "rank": 312,
                    "points": 132,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:56017",
                        "name": "Ritschard, Alexander",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "RIT"
                    }
                },
                {
                    "rank": 313,
                    "points": 132,
                    "ranking_movement": 0,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:82579",
                        "name": "Uchida, Kaichi",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "UCH"
                    }
                },
                {
                    "rank": 314,
                    "points": 129,
                    "ranking_movement": 0,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:23546",
                        "name": "Jahn, Jeremy",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "JAH"
                    }
                },
                {
                    "rank": 315,
                    "points": 129,
                    "ranking_movement": 0,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:250231",
                        "name": "Shimizu, Yuta",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SHI"
                    }
                },
                {
                    "rank": 316,
                    "points": 129,
                    "ranking_movement": 0,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:43636",
                        "name": "Eriksson, Markus",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "ERI"
                    }
                },
                {
                    "rank": 317,
                    "points": 128,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:51009",
                        "name": "Kuzmanov, Dimitar",
                        "nationality": "Bulgaria",
                        "country_code": "BGR",
                        "abbreviation": "KUZ"
                    }
                },
                {
                    "rank": 318,
                    "points": 127,
                    "ranking_movement": 0,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:407573",
                        "name": "Alcaraz Garfia, Carlos",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ALC"
                    }
                },
                {
                    "rank": 319,
                    "points": 127,
                    "ranking_movement": 4,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:25457",
                        "name": "Nedovyesov, Aleksandr",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "NED"
                    }
                },
                {
                    "rank": 320,
                    "points": 127,
                    "ranking_movement": -1,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:210526",
                        "name": "Kopriva, Vit",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "KOP"
                    }
                },
                {
                    "rank": 321,
                    "points": 126,
                    "ranking_movement": -1,
                    "tournaments_played": 35,
                    "player": {
                        "id": "sr:competitor:169496",
                        "name": "Etcheverry, Tomas Martin",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "ETC"
                    }
                },
                {
                    "rank": 322,
                    "points": 125,
                    "ranking_movement": -1,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:60688",
                        "name": "Safranek, Vaclav",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "SAF"
                    }
                },
                {
                    "rank": 323,
                    "points": 124,
                    "ranking_movement": 20,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:34265",
                        "name": "Kelly, Dayne",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "KEL"
                    }
                },
                {
                    "rank": 324,
                    "points": 123,
                    "ranking_movement": 9,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:38275",
                        "name": "de Greef, Arthur",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "DEG"
                    }
                },
                {
                    "rank": 325,
                    "points": 123,
                    "ranking_movement": -3,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:16066",
                        "name": "Sijsling, Igor",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "SIJ"
                    }
                },
                {
                    "rank": 326,
                    "points": 123,
                    "ranking_movement": -2,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:53308",
                        "name": "Nedelko, Ivan",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "NED"
                    }
                },
                {
                    "rank": 327,
                    "points": 122,
                    "ranking_movement": 3,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:126402",
                        "name": "Denolly, Corentin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "DEN"
                    }
                },
                {
                    "rank": 328,
                    "points": 121,
                    "ranking_movement": 3,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:78879",
                        "name": "Pecotic, Matija",
                        "nationality": "Croatia",
                        "country_code": "HRV",
                        "abbreviation": "PEC"
                    }
                },
                {
                    "rank": 329,
                    "points": 121,
                    "ranking_movement": -1,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:72230",
                        "name": "Celikbilek, Altug",
                        "nationality": "Turkey",
                        "country_code": "TUR",
                        "abbreviation": "CEL"
                    }
                },
                {
                    "rank": 330,
                    "points": 121,
                    "ranking_movement": -5,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:43261",
                        "name": "Lindell, Christian",
                        "nationality": "Sweden",
                        "country_code": "SWE",
                        "abbreviation": "LIN"
                    }
                },
                {
                    "rank": 331,
                    "points": 121,
                    "ranking_movement": -5,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:42164",
                        "name": "Bangoura, Sekou",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BAN"
                    }
                },
                {
                    "rank": 332,
                    "points": 120,
                    "ranking_movement": -5,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:105607",
                        "name": "Choinski, Jan",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "CHO"
                    }
                },
                {
                    "rank": 333,
                    "points": 120,
                    "ranking_movement": -4,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16248",
                        "name": "Kravchuk, Konstantin",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "KRA"
                    }
                },
                {
                    "rank": 334,
                    "points": 120,
                    "ranking_movement": 1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:17732",
                        "name": "Torebko, Peter",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "TOR"
                    }
                },
                {
                    "rank": 335,
                    "points": 119,
                    "ranking_movement": -3,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:71702",
                        "name": "Alvarez, Nicolas",
                        "nationality": "Peru",
                        "country_code": "PER",
                        "abbreviation": "ALV"
                    }
                },
                {
                    "rank": 336,
                    "points": 119,
                    "ranking_movement": 1,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:96239",
                        "name": "Durasovic, Viktor",
                        "nationality": "Norway",
                        "country_code": "NOR",
                        "abbreviation": "DUR"
                    }
                },
                {
                    "rank": 337,
                    "points": 117,
                    "ranking_movement": 2,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:44709",
                        "name": "Arguello, Facundo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "ARG"
                    }
                },
                {
                    "rank": 338,
                    "points": 116,
                    "ranking_movement": -4,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:99587",
                        "name": "Chung, Yunseong",
                        "nationality": "Republic of Korea",
                        "country_code": "KOR",
                        "abbreviation": "CHU"
                    }
                },
                {
                    "rank": 339,
                    "points": 116,
                    "ranking_movement": -3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:49660",
                        "name": "Peliwo, Filip",
                        "nationality": "Canada",
                        "country_code": "CAN",
                        "abbreviation": "PEL"
                    }
                },
                {
                    "rank": 340,
                    "points": 116,
                    "ranking_movement": 14,
                    "tournaments_played": 34,
                    "player": {
                        "id": "sr:competitor:142898",
                        "name": "Crepatte, Baptiste",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "CRE"
                    }
                },
                {
                    "rank": 341,
                    "points": 115,
                    "ranking_movement": -3,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:93597",
                        "name": "Pellegrino, Andrea",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "PEL"
                    }
                },
                {
                    "rank": 342,
                    "points": 113,
                    "ranking_movement": 5,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:81677",
                        "name": "Haerteis, Johannes",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HAE"
                    }
                },
                {
                    "rank": 343,
                    "points": 113,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:121172",
                        "name": "Okala, Jules",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "OKA"
                    }
                },
                {
                    "rank": 344,
                    "points": 113,
                    "ranking_movement": -3,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:58713",
                        "name": "Redlicki, Michael",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "RED"
                    }
                },
                {
                    "rank": 345,
                    "points": 113,
                    "ranking_movement": 23,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:258735",
                        "name": "Cerundolo, Juan Manuel",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "CER"
                    }
                },
                {
                    "rank": 346,
                    "points": 112,
                    "ranking_movement": -4,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:102411",
                        "name": "van Rijthoven, Tim",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 347,
                    "points": 112,
                    "ranking_movement": 1,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:51100",
                        "name": "Roca Batalla, Oriol",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ROC"
                    }
                },
                {
                    "rank": 348,
                    "points": 111,
                    "ranking_movement": -4,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:17016",
                        "name": "Yang, Tsung-Hua",
                        "nationality": "Chinese Taipei",
                        "country_code": "TPE",
                        "abbreviation": "YAN"
                    }
                },
                {
                    "rank": 349,
                    "points": 111,
                    "ranking_movement": -4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:158748",
                        "name": "Meligeni Rodrigues Alves, Felipe",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "MEL"
                    }
                },
                {
                    "rank": 350,
                    "points": 111,
                    "ranking_movement": -4,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:66912",
                        "name": "Hamou, Maxime",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HAM"
                    }
                },
                {
                    "rank": 351,
                    "points": 110,
                    "ranking_movement": 4,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:39712",
                        "name": "Saville, Luke",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "SAV"
                    }
                },
                {
                    "rank": 352,
                    "points": 110,
                    "ranking_movement": 4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:124732",
                        "name": "Leshem, Edan",
                        "nationality": "Israel",
                        "country_code": "ISR",
                        "abbreviation": "LES"
                    }
                },
                {
                    "rank": 353,
                    "points": 110,
                    "ranking_movement": -4,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:54383",
                        "name": "Bega, Alessandro",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BEG"
                    }
                },
                {
                    "rank": 354,
                    "points": 109,
                    "ranking_movement": -4,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:108767",
                        "name": "Hassan, Benjamin",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HAS"
                    }
                },
                {
                    "rank": 355,
                    "points": 109,
                    "ranking_movement": -4,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:257721",
                        "name": "Baez, Sebastian",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "BAE"
                    }
                },
                {
                    "rank": 356,
                    "points": 109,
                    "ranking_movement": -4,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:199196",
                        "name": "Sanchez-Izquierdo, Nikolas",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 357,
                    "points": 108,
                    "ranking_movement": -4,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:77289",
                        "name": "Vanneste, Jeroen",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 358,
                    "points": 108,
                    "ranking_movement": 0,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:66002",
                        "name": "Lokoli, Laurent",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "LOK"
                    }
                },
                {
                    "rank": 359,
                    "points": 107,
                    "ranking_movement": 4,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:180946",
                        "name": "Roumane, Rayane",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "ROU"
                    }
                },
                {
                    "rank": 360,
                    "points": 107,
                    "ranking_movement": -3,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:172482",
                        "name": "Dougaz, Aziz",
                        "nationality": "Tunisia",
                        "country_code": "TUN",
                        "abbreviation": "DOU"
                    }
                },
                {
                    "rank": 361,
                    "points": 106,
                    "ranking_movement": 65,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:16360",
                        "name": "Klein, Brydan",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "KLE"
                    }
                },
                {
                    "rank": 362,
                    "points": 105,
                    "ranking_movement": -3,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:81077",
                        "name": "Vivero Gonzalez, Pablo",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "VIV"
                    }
                },
                {
                    "rank": 363,
                    "points": 105,
                    "ranking_movement": 1,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:54975",
                        "name": "Casanova, Hernan",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "CAS"
                    }
                },
                {
                    "rank": 364,
                    "points": 105,
                    "ranking_movement": -2,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:50847",
                        "name": "Yevseyev, Denis",
                        "nationality": "Kazakhstan",
                        "country_code": "KAZ",
                        "abbreviation": "YEV"
                    }
                },
                {
                    "rank": 365,
                    "points": 104,
                    "ranking_movement": -5,
                    "tournaments_played": 12,
                    "player": {
                        "id": "sr:competitor:76491",
                        "name": "Nguyen, Daniel",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "NGU"
                    }
                },
                {
                    "rank": 366,
                    "points": 104,
                    "ranking_movement": -5,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:52263",
                        "name": "Hidalgo, Diego",
                        "nationality": "Ecuador",
                        "country_code": "ECU",
                        "abbreviation": "HID"
                    }
                },
                {
                    "rank": 367,
                    "points": 103,
                    "ranking_movement": 0,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:63090",
                        "name": "Fatic, Nerman",
                        "nationality": "Bosnia & Herzegovina",
                        "country_code": "BIH",
                        "abbreviation": "FAT"
                    }
                },
                {
                    "rank": 368,
                    "points": 103,
                    "ranking_movement": 2,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:17007",
                        "name": "Ignatik, Uladzimir",
                        "nationality": "Belarus",
                        "country_code": "BLR",
                        "abbreviation": "IGN"
                    }
                },
                {
                    "rank": 369,
                    "points": 102,
                    "ranking_movement": 31,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:310974",
                        "name": "de Jong, Jesper",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "DEJ"
                    }
                },
                {
                    "rank": 370,
                    "points": 102,
                    "ranking_movement": -5,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:204117",
                        "name": "Ugo Carabelli, Camilo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "UGO"
                    }
                },
                {
                    "rank": 371,
                    "points": 101,
                    "ranking_movement": -5,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:298122",
                        "name": "Zeppieri, Giulio",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "ZEP"
                    }
                },
                {
                    "rank": 372,
                    "points": 101,
                    "ranking_movement": 24,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:73987",
                        "name": "Cachin, Pedro",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "CAC"
                    }
                },
                {
                    "rank": 373,
                    "points": 101,
                    "ranking_movement": 28,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:106559",
                        "name": "Doumbia, Sadio",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "DOU"
                    }
                },
                {
                    "rank": 374,
                    "points": 101,
                    "ranking_movement": -2,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:23821",
                        "name": "Maamoun, Karim-Mohamed",
                        "nationality": "Egypt",
                        "country_code": "EGY",
                        "abbreviation": "MAA"
                    }
                },
                {
                    "rank": 375,
                    "points": 101,
                    "ranking_movement": -6,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:80725",
                        "name": "Altamirano, Collin",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ALT"
                    }
                },
                {
                    "rank": 376,
                    "points": 100,
                    "ranking_movement": -5,
                    "tournaments_played": 10,
                    "player": {
                        "id": "sr:competitor:71660",
                        "name": "Marterer, Maximilian",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 377,
                    "points": 99,
                    "ranking_movement": -4,
                    "tournaments_played": 20,
                    "player": {
                        "id": "sr:competitor:163438",
                        "name": "Sun, Fajing",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "SUN"
                    }
                },
                {
                    "rank": 378,
                    "points": 99,
                    "ranking_movement": -4,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:51300",
                        "name": "Satral, Jan",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "SAT"
                    }
                },
                {
                    "rank": 379,
                    "points": 99,
                    "ranking_movement": 0,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:195458",
                        "name": "Added, Dan",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "ADD"
                    }
                },
                {
                    "rank": 380,
                    "points": 99,
                    "ranking_movement": -5,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:49663",
                        "name": "Escoffier, Antoine",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "ESC"
                    }
                },
                {
                    "rank": 381,
                    "points": 98,
                    "ranking_movement": -5,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:45399",
                        "name": "Sarmiento, Raymond",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SAR"
                    }
                },
                {
                    "rank": 382,
                    "points": 98,
                    "ranking_movement": 0,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:59324",
                        "name": "Pavlasek, Adam",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "PAV"
                    }
                },
                {
                    "rank": 383,
                    "points": 98,
                    "ranking_movement": -6,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:123694",
                        "name": "Brancaccio, Raul",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BRA"
                    }
                },
                {
                    "rank": 384,
                    "points": 97,
                    "ranking_movement": -6,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:56361",
                        "name": "Sels, Jelle",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "SEL"
                    }
                },
                {
                    "rank": 385,
                    "points": 97,
                    "ranking_movement": -5,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:81275",
                        "name": "Gutierrez, Oscar Jose",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "GUT"
                    }
                },
                {
                    "rank": 386,
                    "points": 96,
                    "ranking_movement": -5,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:77007",
                        "name": "Kozlov, Stefan",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KOZ"
                    }
                },
                {
                    "rank": 387,
                    "points": 96,
                    "ranking_movement": -4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:94487",
                        "name": "Heyman, Christopher",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "HEY"
                    }
                },
                {
                    "rank": 388,
                    "points": 96,
                    "ranking_movement": 28,
                    "tournaments_played": 38,
                    "player": {
                        "id": "sr:competitor:251091",
                        "name": "Noguchi, Rio",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "NOG"
                    }
                },
                {
                    "rank": 389,
                    "points": 95,
                    "ranking_movement": -5,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:41371",
                        "name": "Sock, Jack",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SOC"
                    }
                },
                {
                    "rank": 390,
                    "points": 95,
                    "ranking_movement": -5,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:17065",
                        "name": "Chazal, Maxime",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "CHA"
                    }
                },
                {
                    "rank": 391,
                    "points": 94,
                    "ranking_movement": -5,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:69362",
                        "name": "Mansouri, Skander",
                        "nationality": "Tunisia",
                        "country_code": "TUN",
                        "abbreviation": "MAN"
                    }
                },
                {
                    "rank": 392,
                    "points": 94,
                    "ranking_movement": 39,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:47967",
                        "name": "Simon, Tobias",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "SIM"
                    }
                },
                {
                    "rank": 393,
                    "points": 93,
                    "ranking_movement": -6,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:37209",
                        "name": "Ehrat, Sandro",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "EHR"
                    }
                },
                {
                    "rank": 394,
                    "points": 93,
                    "ranking_movement": -6,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:91240",
                        "name": "Peniston, Ryan",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "PEN"
                    }
                },
                {
                    "rank": 395,
                    "points": 93,
                    "ranking_movement": -6,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:59165",
                        "name": "Slobodchikov, Ronald",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "SLO"
                    }
                },
                {
                    "rank": 396,
                    "points": 93,
                    "ranking_movement": -6,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:85877",
                        "name": "Villanueva, Gonzalo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "VIL"
                    }
                },
                {
                    "rank": 397,
                    "points": 93,
                    "ranking_movement": -6,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:169486",
                        "name": "Olivieri, Genaro Alberto",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "OLI"
                    }
                },
                {
                    "rank": 398,
                    "points": 92,
                    "ranking_movement": -6,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:38389",
                        "name": "Zhang, Ze",
                        "nationality": "China",
                        "country_code": "CHN",
                        "abbreviation": "ZHA"
                    }
                },
                {
                    "rank": 399,
                    "points": 92,
                    "ranking_movement": 4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:310970",
                        "name": "Zakharov, Alexey",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "ZAK"
                    }
                },
                {
                    "rank": 400,
                    "points": 92,
                    "ranking_movement": 13,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:279295",
                        "name": "Jianu, Filip Cristian",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "JIA"
                    }
                },
                {
                    "rank": 401,
                    "points": 91,
                    "ranking_movement": -8,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:18067",
                        "name": "Struvay, Eduardo",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "STR"
                    }
                },
                {
                    "rank": 402,
                    "points": 91,
                    "ranking_movement": 53,
                    "tournaments_played": 25,
                    "player": {
                        "id": "sr:competitor:371476",
                        "name": "Diaz Acosta, Facundo",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "DIA"
                    }
                },
                {
                    "rank": 403,
                    "points": 91,
                    "ranking_movement": -9,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:202361",
                        "name": "Oliel, Yshai",
                        "nationality": "Israel",
                        "country_code": "ISR",
                        "abbreviation": "OLI"
                    }
                },
                {
                    "rank": 404,
                    "points": 90,
                    "ranking_movement": -9,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:103625",
                        "name": "Geerts, Michael",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "GEE"
                    }
                },
                {
                    "rank": 405,
                    "points": 90,
                    "ranking_movement": -3,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:295508",
                        "name": "Vrbensky, Michael",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "VRB"
                    }
                },
                {
                    "rank": 406,
                    "points": 89,
                    "ranking_movement": -9,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:115463",
                        "name": "Tyurnev, Evgeny",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "TYU"
                    }
                },
                {
                    "rank": 407,
                    "points": 89,
                    "ranking_movement": -9,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:23899",
                        "name": "King, Evan",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KIN"
                    }
                },
                {
                    "rank": 408,
                    "points": 89,
                    "ranking_movement": 4,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:50795",
                        "name": "Heller, Peter",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "HEL"
                    }
                },
                {
                    "rank": 409,
                    "points": 89,
                    "ranking_movement": -10,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:54733",
                        "name": "Bonadio, Riccardo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BON"
                    }
                },
                {
                    "rank": 410,
                    "points": 88,
                    "ranking_movement": -2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:57885",
                        "name": "Sarkissian, Alexander",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SAR"
                    }
                },
                {
                    "rank": 411,
                    "points": 88,
                    "ranking_movement": -6,
                    "tournaments_played": 37,
                    "player": {
                        "id": "sr:competitor:114073",
                        "name": "Pena Lopez, Manuel",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "PEN"
                    }
                },
                {
                    "rank": 412,
                    "points": 86,
                    "ranking_movement": -8,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:154570",
                        "name": "Orlov, Vladyslav",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "ORL"
                    }
                },
                {
                    "rank": 413,
                    "points": 86,
                    "ranking_movement": -7,
                    "tournaments_played": 42,
                    "player": {
                        "id": "sr:competitor:67264",
                        "name": "Ornago, Fabrizio",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "ORN"
                    }
                },
                {
                    "rank": 414,
                    "points": 85,
                    "ranking_movement": -7,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:223714",
                        "name": "Piros, Zsombor",
                        "nationality": "Hungary",
                        "country_code": "HUN",
                        "abbreviation": "PIR"
                    }
                },
                {
                    "rank": 415,
                    "points": 85,
                    "ranking_movement": -6,
                    "tournaments_played": 22,
                    "player": {
                        "id": "sr:competitor:109951",
                        "name": "Caruana, Liam",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "CAR"
                    }
                },
                {
                    "rank": 416,
                    "points": 85,
                    "ranking_movement": -6,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:177644",
                        "name": "Takahashi, Yusuke",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "TAK"
                    }
                },
                {
                    "rank": 417,
                    "points": 85,
                    "ranking_movement": 16,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:96859",
                        "name": "Lock, Benjamin",
                        "nationality": "Zimbabwe",
                        "country_code": "ZWE",
                        "abbreviation": "LOC"
                    }
                },
                {
                    "rank": 418,
                    "points": 84,
                    "ranking_movement": 61,
                    "tournaments_played": 14,
                    "player": {
                        "id": "sr:competitor:105375",
                        "name": "Chrysochos, Petros",
                        "nationality": "Cyprus",
                        "country_code": "CYP",
                        "abbreviation": "CHR"
                    }
                },
                {
                    "rank": 419,
                    "points": 84,
                    "ranking_movement": -8,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:14794",
                        "name": "Gimeno-Traver, Daniel",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GIM"
                    }
                },
                {
                    "rank": 420,
                    "points": 83,
                    "ranking_movement": 9,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:106153",
                        "name": "Dalla Valle, Enrico",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "DAL"
                    }
                },
                {
                    "rank": 421,
                    "points": 82,
                    "ranking_movement": -7,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:51836",
                        "name": "Arevalo-Gonzalez, Marcelo",
                        "nationality": "El Salvador",
                        "country_code": "SLV",
                        "abbreviation": "ARE"
                    }
                },
                {
                    "rank": 422,
                    "points": 82,
                    "ranking_movement": -7,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:186546",
                        "name": "Dubrivnyy, Artem",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "DUB"
                    }
                },
                {
                    "rank": 423,
                    "points": 82,
                    "ranking_movement": 17,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:145122",
                        "name": "Martineau, Matteo",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MAR"
                    }
                },
                {
                    "rank": 424,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 11,
                    "player": {
                        "id": "sr:competitor:16087",
                        "name": "Dutra Silva, Rogerio",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "DUT"
                    }
                },
                {
                    "rank": 425,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 16,
                    "player": {
                        "id": "sr:competitor:64920",
                        "name": "Myneni, Saketh",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "MYN"
                    }
                },
                {
                    "rank": 426,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:77005",
                        "name": "Tepavac, Marko",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "TEP"
                    }
                },
                {
                    "rank": 427,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:43587",
                        "name": "Velotti, Augustin",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "VEL"
                    }
                },
                {
                    "rank": 428,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:16972",
                        "name": "Gomez-Herrera, Carlos",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "GOM"
                    }
                },
                {
                    "rank": 429,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:113221",
                        "name": "Niklas-Salminen, Patrik",
                        "nationality": "Finland",
                        "country_code": "FIN",
                        "abbreviation": "NIK"
                    }
                },
                {
                    "rank": 430,
                    "points": 81,
                    "ranking_movement": -7,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:39580",
                        "name": "Santanna, Bruno",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "SAN"
                    }
                },
                {
                    "rank": 431,
                    "points": 80,
                    "ranking_movement": -7,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:16198",
                        "name": "Escobar, Gonzalo",
                        "nationality": "Ecuador",
                        "country_code": "ECU",
                        "abbreviation": "ESC"
                    }
                },
                {
                    "rank": 432,
                    "points": 80,
                    "ranking_movement": -7,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:180446",
                        "name": "Wessels, Louis",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "WES"
                    }
                },
                {
                    "rank": 433,
                    "points": 80,
                    "ranking_movement": -6,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:97367",
                        "name": "Pervolarakis, Michail",
                        "nationality": "Greece",
                        "country_code": "GRC",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 434,
                    "points": 80,
                    "ranking_movement": -6,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:345576",
                        "name": "Michalski, Daniel",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "MIC"
                    }
                },
                {
                    "rank": 435,
                    "points": 80,
                    "ranking_movement": -5,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:138528",
                        "name": "Mejia, Nicolas",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "MEJ"
                    }
                },
                {
                    "rank": 436,
                    "points": 79,
                    "ranking_movement": -4,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:387066",
                        "name": "Forejtek, Jonas",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "FOR"
                    }
                },
                {
                    "rank": 437,
                    "points": 79,
                    "ranking_movement": 10,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:58703",
                        "name": "Chappell, Nick",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "CHA"
                    }
                },
                {
                    "rank": 438,
                    "points": 78,
                    "ranking_movement": 7,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:65608",
                        "name": "Rawat, Sidharth",
                        "nationality": "India",
                        "country_code": "IND",
                        "abbreviation": "RAW"
                    }
                },
                {
                    "rank": 439,
                    "points": 78,
                    "ranking_movement": -5,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:16325",
                        "name": "Gonzalez, Alejandro",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "GON"
                    }
                },
                {
                    "rank": 440,
                    "points": 78,
                    "ranking_movement": 6,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:56295",
                        "name": "Ojeda Lara, Ricardo",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "OJE"
                    }
                },
                {
                    "rank": 441,
                    "points": 77,
                    "ranking_movement": -6,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:50627",
                        "name": "Quinzi, Gianluigi",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "QUI"
                    }
                },
                {
                    "rank": 442,
                    "points": 77,
                    "ranking_movement": -4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:106357",
                        "name": "Gerch, Lucas",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "GER"
                    }
                },
                {
                    "rank": 443,
                    "points": 77,
                    "ranking_movement": -7,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:182967",
                        "name": "Ochi, Makoto",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "OCH"
                    }
                },
                {
                    "rank": 444,
                    "points": 76,
                    "ranking_movement": 9,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:81271",
                        "name": "Hemery, Calvin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "HEM"
                    }
                },
                {
                    "rank": 445,
                    "points": 76,
                    "ranking_movement": -3,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:82931",
                        "name": "Hoyt, Evan",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "HOY"
                    }
                },
                {
                    "rank": 446,
                    "points": 76,
                    "ranking_movement": -9,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:252239",
                        "name": "Forti, Francesco",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "FOR"
                    }
                },
                {
                    "rank": 447,
                    "points": 76,
                    "ranking_movement": -8,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:148970",
                        "name": "Perchicot, Mathieu",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "PER"
                    }
                },
                {
                    "rank": 448,
                    "points": 75,
                    "ranking_movement": -7,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:63248",
                        "name": "Podzus, Martins",
                        "nationality": "Latvia",
                        "country_code": "LVA",
                        "abbreviation": "POD"
                    }
                },
                {
                    "rank": 449,
                    "points": 74,
                    "ranking_movement": -6,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:54387",
                        "name": "Mott, Blake",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "MOT"
                    }
                },
                {
                    "rank": 450,
                    "points": 74,
                    "ranking_movement": -6,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:247607",
                        "name": "Shimabukuro, Sho",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "SHI"
                    }
                },
                {
                    "rank": 451,
                    "points": 74,
                    "ranking_movement": -3,
                    "tournaments_played": 36,
                    "player": {
                        "id": "sr:competitor:116047",
                        "name": "Brymer, Gage",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "BRY"
                    }
                },
                {
                    "rank": 452,
                    "points": 73,
                    "ranking_movement": -3,
                    "tournaments_played": 9,
                    "player": {
                        "id": "sr:competitor:22900",
                        "name": "Harrison, Ryan",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "HAR"
                    }
                },
                {
                    "rank": 453,
                    "points": 73,
                    "ranking_movement": -3,
                    "tournaments_played": 8,
                    "player": {
                        "id": "sr:competitor:52202",
                        "name": "Nys, Hugo",
                        "nationality": "Monaco",
                        "country_code": "MCO",
                        "abbreviation": "NYS"
                    }
                },
                {
                    "rank": 454,
                    "points": 73,
                    "ranking_movement": -3,
                    "tournaments_played": 10,
                    "player": {
                        "id": "sr:competitor:321667",
                        "name": "Mayot, Harold",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "MAY"
                    }
                },
                {
                    "rank": 455,
                    "points": 73,
                    "ranking_movement": -3,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:59131",
                        "name": "Glasspool, Lloyd",
                        "nationality": "Great Britain",
                        "country_code": "GBR",
                        "abbreviation": "GLA"
                    }
                },
                {
                    "rank": 456,
                    "points": 72,
                    "ranking_movement": 9,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:98981",
                        "name": "Jecan, Mircea-Alexandru",
                        "nationality": "Romania",
                        "country_code": "ROU",
                        "abbreviation": "JEC"
                    }
                },
                {
                    "rank": 457,
                    "points": 72,
                    "ranking_movement": -3,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:48199",
                        "name": "Robert, Quentin",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "ROB"
                    }
                },
                {
                    "rank": 458,
                    "points": 72,
                    "ranking_movement": -2,
                    "tournaments_played": 30,
                    "player": {
                        "id": "sr:competitor:76251",
                        "name": "Bobrov, Bogdan",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "BOB"
                    }
                },
                {
                    "rank": 459,
                    "points": 71,
                    "ranking_movement": 16,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:220588",
                        "name": "Hsu, Yu Hsiou",
                        "nationality": "Taiwan",
                        "country_code": "TWN",
                        "abbreviation": "HSU"
                    }
                },
                {
                    "rank": 460,
                    "points": 70,
                    "ranking_movement": -3,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:155684",
                        "name": "Tokuda, Renta",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "TOK"
                    }
                },
                {
                    "rank": 461,
                    "points": 70,
                    "ranking_movement": 2,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:77481",
                        "name": "Kalenichenko, Danylo",
                        "nationality": "Ukraine",
                        "country_code": "UKR",
                        "abbreviation": "KAL"
                    }
                },
                {
                    "rank": 462,
                    "points": 70,
                    "ranking_movement": -3,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:238030",
                        "name": "Avidzba, Alen",
                        "nationality": "Russia",
                        "country_code": "RUS",
                        "abbreviation": "AVI"
                    }
                },
                {
                    "rank": 463,
                    "points": 70,
                    "ranking_movement": -5,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:60614",
                        "name": "Poljak, David",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "POL"
                    }
                },
                {
                    "rank": 464,
                    "points": 69,
                    "ranking_movement": -4,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:44637",
                        "name": "Rodriguez, Cristian",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "ROC"
                    }
                },
                {
                    "rank": 465,
                    "points": 69,
                    "ranking_movement": 16,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:63959",
                        "name": "Esteve Lobato, Eduard",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "EST"
                    }
                },
                {
                    "rank": 466,
                    "points": 69,
                    "ranking_movement": -5,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:214156",
                        "name": "Miladinovic, Marko",
                        "nationality": "Serbia",
                        "country_code": "SRB",
                        "abbreviation": "MIL"
                    }
                },
                {
                    "rank": 467,
                    "points": 69,
                    "ranking_movement": -5,
                    "tournaments_played": 24,
                    "player": {
                        "id": "sr:competitor:114197",
                        "name": "Moundir, Adam",
                        "nationality": "Morocco",
                        "country_code": "MAR",
                        "abbreviation": "MOU"
                    }
                },
                {
                    "rank": 468,
                    "points": 69,
                    "ranking_movement": -4,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:74699",
                        "name": "Nejedly, Pavel",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "NEJ"
                    }
                },
                {
                    "rank": 469,
                    "points": 69,
                    "ranking_movement": 0,
                    "tournaments_played": 32,
                    "player": {
                        "id": "sr:competitor:79469",
                        "name": "Grills, Jacob",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "GRI"
                    }
                },
                {
                    "rank": 470,
                    "points": 68,
                    "ranking_movement": -4,
                    "tournaments_played": 3,
                    "player": {
                        "id": "sr:competitor:22953",
                        "name": "Janowicz, Jerzy",
                        "nationality": "Poland",
                        "country_code": "POL",
                        "abbreviation": "JAN"
                    }
                },
                {
                    "rank": 471,
                    "points": 68,
                    "ranking_movement": -4,
                    "tournaments_played": 15,
                    "player": {
                        "id": "sr:competitor:56989",
                        "name": "Artunedo Martinavarro, Andres",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "ART"
                    }
                },
                {
                    "rank": 472,
                    "points": 68,
                    "ranking_movement": 12,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:101157",
                        "name": "Rybakov, Alex",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "RYB"
                    }
                },
                {
                    "rank": 473,
                    "points": 68,
                    "ranking_movement": -5,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:25839",
                        "name": "Mertens, Yannick",
                        "nationality": "Belgium",
                        "country_code": "BEL",
                        "abbreviation": "MER"
                    }
                },
                {
                    "rank": 474,
                    "points": 67,
                    "ranking_movement": 47,
                    "tournaments_played": 21,
                    "player": {
                        "id": "sr:competitor:71950",
                        "name": "Fanselow, Sebastian",
                        "nationality": "Germany",
                        "country_code": "DEU",
                        "abbreviation": "FAN"
                    }
                },
                {
                    "rank": 475,
                    "points": 67,
                    "ranking_movement": 22,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:126400",
                        "name": "Catarina, Lucas",
                        "nationality": "Monaco",
                        "country_code": "MCO",
                        "abbreviation": "CAT"
                    }
                },
                {
                    "rank": 476,
                    "points": 67,
                    "ranking_movement": -6,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:95259",
                        "name": "Kirchheimer, Strong",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "KIR"
                    }
                },
                {
                    "rank": 477,
                    "points": 66,
                    "ranking_movement": -6,
                    "tournaments_played": 13,
                    "player": {
                        "id": "sr:competitor:179160",
                        "name": "Laurent, Thomas",
                        "nationality": "France",
                        "country_code": "FRA",
                        "abbreviation": "LAU"
                    }
                },
                {
                    "rank": 478,
                    "points": 66,
                    "ranking_movement": -6,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:15864",
                        "name": "Gil, Fred",
                        "nationality": "Portugal",
                        "country_code": "PRT",
                        "abbreviation": "GIL"
                    }
                },
                {
                    "rank": 479,
                    "points": 66,
                    "ranking_movement": 4,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:110707",
                        "name": "Pichler, David",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "PIC"
                    }
                },
                {
                    "rank": 480,
                    "points": 65,
                    "ranking_movement": -7,
                    "tournaments_played": 4,
                    "player": {
                        "id": "sr:competitor:15310",
                        "name": "Bolelli, Simone",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BOL"
                    }
                },
                {
                    "rank": 481,
                    "points": 65,
                    "ranking_movement": -7,
                    "tournaments_played": 6,
                    "player": {
                        "id": "sr:competitor:15929",
                        "name": "Smyczek, Tim",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SMY"
                    }
                },
                {
                    "rank": 482,
                    "points": 65,
                    "ranking_movement": -6,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:105973",
                        "name": "Yamasaki, Jumpei",
                        "nationality": "Japan",
                        "country_code": "JPN",
                        "abbreviation": "YAM"
                    }
                },
                {
                    "rank": 483,
                    "points": 65,
                    "ranking_movement": -6,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:76263",
                        "name": "Matos, Rafael",
                        "nationality": "Brazil",
                        "country_code": "BRA",
                        "abbreviation": "MAT"
                    }
                },
                {
                    "rank": 484,
                    "points": 65,
                    "ranking_movement": -4,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:46371",
                        "name": "Estevez, Maximiliano",
                        "nationality": "Argentina",
                        "country_code": "ARG",
                        "abbreviation": "EST"
                    }
                },
                {
                    "rank": 485,
                    "points": 65,
                    "ranking_movement": 4,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:58981",
                        "name": "Toledo Bague, Pol",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "TOL"
                    }
                },
                {
                    "rank": 486,
                    "points": 65,
                    "ranking_movement": -8,
                    "tournaments_played": 33,
                    "player": {
                        "id": "sr:competitor:152898",
                        "name": "Gengel, Marek",
                        "nationality": "Czech Republic",
                        "country_code": "CZE",
                        "abbreviation": "GEN"
                    }
                },
                {
                    "rank": 487,
                    "points": 64,
                    "ranking_movement": 3,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:15467",
                        "name": "Setkic, Aldin",
                        "nationality": "Bosnia & Herzegovina",
                        "country_code": "BIH",
                        "abbreviation": "SET"
                    }
                },
                {
                    "rank": 488,
                    "points": 63,
                    "ranking_movement": 32,
                    "tournaments_played": 17,
                    "player": {
                        "id": "sr:competitor:110837",
                        "name": "Lopez San Martin, Alvaro",
                        "nationality": "Spain",
                        "country_code": "ESP",
                        "abbreviation": "LOP"
                    }
                },
                {
                    "rank": 489,
                    "points": 63,
                    "ranking_movement": 17,
                    "tournaments_played": 19,
                    "player": {
                        "id": "sr:competitor:54381",
                        "name": "Fayziev, Sanjar",
                        "nationality": "Uzbekistan",
                        "country_code": "UZB",
                        "abbreviation": "FAY"
                    }
                },
                {
                    "rank": 490,
                    "points": 63,
                    "ranking_movement": 2,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:104967",
                        "name": "Brouwer, Gijs",
                        "nationality": "Netherlands",
                        "country_code": "NLD",
                        "abbreviation": "BRO"
                    }
                },
                {
                    "rank": 491,
                    "points": 63,
                    "ranking_movement": -9,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:221538",
                        "name": "Berrettini, Jacopo",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "BER"
                    }
                },
                {
                    "rank": 492,
                    "points": 63,
                    "ranking_movement": -5,
                    "tournaments_played": 28,
                    "player": {
                        "id": "sr:competitor:51401",
                        "name": "Song, Evan",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "SON"
                    }
                },
                {
                    "rank": 493,
                    "points": 62,
                    "ranking_movement": -8,
                    "tournaments_played": 18,
                    "player": {
                        "id": "sr:competitor:17832",
                        "name": "Vanni, Luca",
                        "nationality": "Italy",
                        "country_code": "ITA",
                        "abbreviation": "VAN"
                    }
                },
                {
                    "rank": 494,
                    "points": 62,
                    "ranking_movement": 8,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:114831",
                        "name": "Erler, Alexander",
                        "nationality": "Austria",
                        "country_code": "AUT",
                        "abbreviation": "ERL"
                    }
                },
                {
                    "rank": 495,
                    "points": 62,
                    "ranking_movement": -9,
                    "tournaments_played": 26,
                    "player": {
                        "id": "sr:competitor:37880",
                        "name": "Gomez, Alejandro",
                        "nationality": "Colombia",
                        "country_code": "COL",
                        "abbreviation": "GOM"
                    }
                },
                {
                    "rank": 496,
                    "points": 62,
                    "ranking_movement": 7,
                    "tournaments_played": 27,
                    "player": {
                        "id": "sr:competitor:47789",
                        "name": "Banes, Maverick",
                        "nationality": "Australia",
                        "country_code": "AUS",
                        "abbreviation": "BAN"
                    }
                },
                {
                    "rank": 497,
                    "points": 62,
                    "ranking_movement": -9,
                    "tournaments_played": 29,
                    "player": {
                        "id": "sr:competitor:101093",
                        "name": "Arconada, Jordi",
                        "nationality": "USA",
                        "country_code": "USA",
                        "abbreviation": "ARC"
                    }
                },
                {
                    "rank": 498,
                    "points": 62,
                    "ranking_movement": -7,
                    "tournaments_played": 31,
                    "player": {
                        "id": "sr:competitor:54529",
                        "name": "Panta Herreros, Jorge Brian",
                        "nationality": "Peru",
                        "country_code": "PER",
                        "abbreviation": "PAN"
                    }
                },
                {
                    "rank": 499,
                    "points": 61,
                    "ranking_movement": -6,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:38278",
                        "name": "Cuevas, Martin",
                        "nationality": "Uruguay",
                        "country_code": "URY",
                        "abbreviation": "CUE"
                    }
                },
                {
                    "rank": 500,
                    "points": 61,
                    "ranking_movement": -6,
                    "tournaments_played": 23,
                    "player": {
                        "id": "sr:competitor:114885",
                        "name": "Nikles, Johan",
                        "nationality": "Switzerland",
                        "country_code": "CHE",
                        "abbreviation": "NIK"
                    }
                }
            ]
        }
    ]
}
"""

let decoder = JSONDecoder()
let tournamentsData: Data? = playerProfile.data(using: .utf8)
let responseObject: PlayerRankings = try decoder.decode(PlayerRankings.self, from: tournamentsData!)
print("response is ==> \(responseObject)")
