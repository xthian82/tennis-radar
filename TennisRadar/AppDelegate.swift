//
//  AppDelegate.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        checkIfFirstLaunch()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func checkIfFirstLaunch() {
        if !UserDefaults.standard.bool(forKey: Constants.hasLaunchedBefore) {
            print("App Launching for the first time, saving defaults ...")
            UserDefaults.standard.set(true, forKey: Constants.hasLaunchedBefore)
            setValueForKey(true, forKeys: TournamentManager.wtaCategoriesSingles)
            setValueForKey(true, forKeys: TournamentManager.atpCategoriesSingles)
            setValueForKey(true, forKeys: TournamentManager.tourSingles)
            setValueForKey(false, forKeys: TournamentManager.tourDoubles)
            setValueForKey(false, forKeys: TournamentManager.wtaCategoriesDoubles)
            setValueForKey(false, forKeys: TournamentManager.atpCategoriesDoubles)
            
            UserDefaults.standard.synchronize()
        } else {
            print("Relaunching app...")
        }
    }
    
    private func setValueForKey(_ value: Bool, forKeys: [String]) {
        for key in forKeys {
            CoreDataUtil.addTourType(name: key, isOn: value)
        }
    }
}

