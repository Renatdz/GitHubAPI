//
//  AppDelegate.swift
//  GitHubAPI
//
//  Created by renato.mendes on 30/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ListRespositoriesController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

