//
//  AppDelegate.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 31/10/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ChuckCategoriesViewController())
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}
