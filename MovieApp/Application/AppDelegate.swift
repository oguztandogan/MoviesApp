//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import UIKit
import Firebase
import FirebaseAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
        RemoteConfigFetcher.fetch()
        
        let initialNavigationController = RootNavigationController()
        initialNavigationController.setRootWireframe(SplashScreenWireframe())

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = initialNavigationController
        self.window?.makeKeyAndVisible()
        

        return true
    }
}

