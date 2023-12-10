//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = TabBarController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}
