//
//  AppDelegate.swift
//  uikit-playground
//
//  Created by dgsw8th71 on 3/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            return true
        }
        
        window = UIWindow()
        window?.rootViewController = StackUIView() // 초기 ViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // save
        // background로 갈때
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // restore
        // foreground로 올때
    }
    
}

