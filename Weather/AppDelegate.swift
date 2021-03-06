//
//  AppDelegate.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithOpaqueBackground()
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      navBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
      UINavigationBar.appearance().standardAppearance = navBarAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
      
      
      let button = UIBarButtonItemAppearance(style: .plain)
      let doneButton = UIBarButtonItemAppearance(style: .done)
      
      button.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
      doneButton.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
      
      navBarAppearance.buttonAppearance = button
      navBarAppearance.doneButtonAppearance = doneButton
      
    } else {
      UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
      UIBarButtonItem.appearance().tintColor = UIColor.white
    }
    
    setupDefaultSettings()
    
    return true
  }
  
  private func setupDefaultSettings() {
    let userDefaults = UserDefaults.standard
    
    if userDefaults.value(forKey: "unit") == nil {
      userDefaults.set(Unit.fahrenheit.rawValue, forKey: "unit")
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

