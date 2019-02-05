//
//  AppDelegate.swift
//  GitHubAPI
//
//  Created by renato.mendes on 30/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

}

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = AppCoordinator()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator?.start()
        window?.makeKeyAndVisible()

        return true
    }
}
