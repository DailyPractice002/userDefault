//
//  AppDelegate.swift
//  userDefault
//
//  Created by macbook on 02/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.splashscreen()
         return true
    }

    private func splashscreen(){
        
        let ls = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
        let rootvc = ls.instantiateViewController(withIdentifier: "sp")
        self.window?.rootViewController = rootvc
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(dissmiss), userInfo: nil, repeats: false)
    }
    @objc func dissmiss(){
        let val =   UserDefaults.standard.isLoggedIn()
            if val {
                  let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                   let rootvc = storyboard.instantiateViewController(withIdentifier: "hm") as! HomeScreen
                self.window?.rootViewController = rootvc
                self.window?.makeKeyAndVisible()
           }else  {
//               let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//               let rootvc = storyboard.instantiateViewController(withIdentifier: "login") as! ViewController
//            self.window?.rootViewController = rootvc
//            self.window?.makeKeyAndVisible()
           }
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
     

}

