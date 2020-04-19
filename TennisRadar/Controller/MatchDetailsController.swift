//
//  MatchDetailsController.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/11/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import Foundation

class MatchDetailsController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tournamentName: UILabel!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var stageDate: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var homeAces: UILabel!
    @IBOutlet weak var awayAces: UILabel!
    @IBOutlet weak var homeDoubleFaults: UILabel!
    @IBOutlet weak var awayDoubleFaults: UILabel!
    @IBOutlet weak var homeFirstServePoints: UILabel!
    @IBOutlet weak var awayFirstServePoints: UILabel!
    @IBOutlet weak var homeSecondServicePoints: UILabel!
    @IBOutlet weak var awaySecondServicePoints: UILabel!
    @IBOutlet weak var homeBreakPoints: UILabel!
    @IBOutlet weak var awayBreakPoints: UILabel!
    @IBOutlet weak var homeFirstServe: UILabel!
    @IBOutlet weak var awayFirstServe: UILabel!
    @IBOutlet weak var homeSecondServe: UILabel!
    @IBOutlet weak var awaySecondServe: UILabel!
    @IBOutlet weak var homeTiebreak: UILabel!
    @IBOutlet weak var awayTiebreak: UILabel!
    @IBOutlet weak var homeServiceGames: UILabel!
    @IBOutlet weak var awayServiceGames: UILabel!
    @IBOutlet weak var homeReceiverPoints: UILabel!
    @IBOutlet weak var awayReceiverPoints: UILabel!
    @IBOutlet weak var homeServicePoints: UILabel!
    @IBOutlet weak var awayServicePoints: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var matchId: String?
    var playerHome: String?
    var playerAway: String?
    var headToHead: HeadToHead?
    
    func getHome() -> [String: UILabel] {
        return ["\(Constants.homePlayer)\(Constants.name)": homeName,
        "\(Constants.homePlayer)\(Constants.aces)": homeAces,
        "\(Constants.homePlayer)\(Constants.doubleFaults)": homeDoubleFaults,
        "\(Constants.homePlayer)\(Constants.firstServePoints)": homeFirstServePoints,
        "\(Constants.homePlayer)\(Constants.secondServicePoints)": homeSecondServicePoints,
        "\(Constants.homePlayer)\(Constants.breakPoints)": homeBreakPoints,
        "\(Constants.homePlayer)\(Constants.firstServe)": homeFirstServe,
        "\(Constants.homePlayer)\(Constants.secondServe)": homeSecondServe,
        "\(Constants.homePlayer)\(Constants.tiebreak)": homeTiebreak,
        "\(Constants.homePlayer)\(Constants.serviceGames)": homeServiceGames,
        "\(Constants.homePlayer)\(Constants.receiverPoints)": homeReceiverPoints,
        "\(Constants.homePlayer)\(Constants.servicePoints)": homeServicePoints]
        
    }
    
    func getAway() -> [String: UILabel] {
        return ["\(Constants.awayPlayer)\(Constants.name)": awayName,
        "\(Constants.awayPlayer)\(Constants.aces)": awayAces,
        "\(Constants.awayPlayer)\(Constants.doubleFaults)": awayDoubleFaults,
        "\(Constants.awayPlayer)\(Constants.firstServePoints)": awayFirstServePoints,
        "\(Constants.awayPlayer)\(Constants.secondServicePoints)": awaySecondServicePoints,
        "\(Constants.awayPlayer)\(Constants.breakPoints)": awayBreakPoints,
        "\(Constants.awayPlayer)\(Constants.firstServe)": awayFirstServe,
        "\(Constants.awayPlayer)\(Constants.secondServe)": awaySecondServe,
        "\(Constants.awayPlayer)\(Constants.tiebreak)": awayTiebreak,
        "\(Constants.awayPlayer)\(Constants.serviceGames)": awayServiceGames,
        "\(Constants.awayPlayer)\(Constants.receiverPoints)": awayReceiverPoints,
        "\(Constants.awayPlayer)\(Constants.servicePoints)": awayServicePoints]
    }
    
    // MARK: - Windows funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Constants.fontNavBar ?? UIFont.systemFont(ofSize: 17)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMatchResults(completion: getHeadToHeadHist(homePlayerId:awayPlayerId:))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
    
    // MARK: - Actions
    @IBAction func cancelActionTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Api calls
    func getMatchResults(completion: @escaping (_ homePlayerId: String?, _ awayPlayerId: String?) -> Void) {
        clearValues()
        guard let matchResultId = matchId else {
            ControllerUtil.presentAlert(self, title: "Error", message: "No match selected")
            return
        }
        activityIndicator.startAnimating()
        TennisApi.getMatchSummary(matchResultId) { response in
            self.loadData(matchResult: response)
            self.activityIndicator.stopAnimating()
            guard let competitors = response?.sportEvent.competitors, competitors.count == 2 else {
                ControllerUtil.presentAlert(self, title: "Error", message: "No competitors found")
                completion(nil, nil)
                return
            }
            guard let homePlayerId = competitors[0].id, let awayPlayerId = competitors[1].id else {
                ControllerUtil.presentAlert(self, title: "Error", message: "No competitors found")
                completion(nil, nil)
                return
            }
            
            completion(homePlayerId, awayPlayerId)
        }
    }
    
    func getHeadToHeadHist(homePlayerId: String?, awayPlayerId: String?) {
        guard let homePlayerId = homePlayerId, let awayPlayerId = awayPlayerId else {
            return
        }
        
        // ----
        // trial api from sport radar reject too many successive calls
        usleep(useconds_t(1_000_000))
        
        activityIndicator.startAnimating()
        TennisApi.getHeadToHead(homePlayerId, versus: awayPlayerId) { (response) in
            self.activityIndicator.stopAnimating()
            self.headToHead = response
            
            let items = self.headToHead?.lastMeetings.results.count ?? 0
            
            self.tableView.reloadData()
            if items == 0 {
                self.tableView.backgroundView = ControllerUtil.getLabel(self.view, text: "No history found", fontSize: 14.0)
            }
        }
    }
    
    // MARK: - Helpers
    func loadData(matchResult: MatchResult?) {
        guard let matchResult = matchResult else {
            return
        }
        
        let sportEvent = matchResult.sportEvent
        tournamentName.text = sportEvent.tournament?.name ?? ""
        venueName.text = matchResult.venueFullName()
        resultValue.text = matchResult.scoreResults()
        winnerName.text = matchResult.winnerName()
        let eventStatus = matchResult.sportEventStatus
        stageDate.text = "\(matchResult.tourRoundFull()) \(ControllerUtil.formatDate(dateStr: eventStatus.matchEnded, formatOrigin: Constants.timezoneDateISO, isPosixDate: true))"
        loadStatistics(getHome(), qualifier: Constants.homePlayer, matchStat: matchResult.homeStatistics())
        loadStatistics(getAway(), qualifier: Constants.awayPlayer, matchStat: matchResult.awayStatistics())
    }
    
    func loadStatistics(_ labels: [String: UILabel], qualifier: String, matchStat: MatchStat?) {
        guard let matchStatistic = matchStat else { return }
        labels["\(qualifier)\(Constants.name)"]?.text = matchStatistic.name
        
        
        labels["\(qualifier)\(Constants.doubleFaults)"]?.text = "\(matchStatistic.statistics.doubleFaults)"
        labels["\(qualifier)\(Constants.aces)"]?.text = "\(matchStatistic.statistics.aces)"
        labels["\(qualifier)\(Constants.firstServePoints)"]?.text = "\(matchStatistic.statistics.firstServePoints())%"
        labels["\(qualifier)\(Constants.secondServicePoints)"]?.text = "\(matchStatistic.statistics.secondServePoints())%"
        labels["\(qualifier)\(Constants.breakPoints)"]?.text = "\(matchStatistic.statistics.breakpoints())%"
        labels["\(qualifier)\(Constants.firstServe)"]?.text = "\(matchStatistic.statistics.firstServe())%"
        labels["\(qualifier)\(Constants.secondServe)"]?.text = "\(matchStatistic.statistics.secondServe())%"
        labels["\(qualifier)\(Constants.tiebreak)"]?.text = "\(matchStatistic.statistics.tiebreaksWon)"
        labels["\(qualifier)\(Constants.serviceGames)"]?.text = "\(matchStatistic.statistics.serviceGames())%"
        labels["\(qualifier)\(Constants.receiverPoints)"]?.text = "\(matchStatistic.statistics.receiverPointsGames())%"
        labels["\(qualifier)\(Constants.servicePoints)"]?.text = "\(matchStatistic.statistics.servicePointsGames())%"
    }
    
    func clearValues() {
        getHome().values.forEach { (label) in
            label.text = ""
        }
        
        getAway().values.forEach { (label) in
            label.text = ""
        }
    }
}

extension MatchDetailsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headToHead?.lastMeetings.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.headToHeadCellId) as! HeadToHeadCell
        if let lastMeetings = headToHead?.lastMeetings {
            cell.loadData(lastMeetings.results[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        ControllerUtil.setHeaderView(view)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Head To Head"
    }
}

