//
//  AppDelegate.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var firebaseConfig = FirebaseConfiguration()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        firebaseConfig.configuration(self)
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

