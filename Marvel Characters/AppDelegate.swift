//
//  AppDelegate.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let main = HomeRouter.createModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = main
        window?.makeKeyAndVisible()
        
        return true
    }

}

