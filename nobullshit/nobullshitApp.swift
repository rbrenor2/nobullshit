//
//  nobullshitApp.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

// 56F835A4-1B4C-4D84-BB4D-0D7E5EC3B1FD
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
      let providerFactory = AppCheckDebugProviderFactory()
      AppCheck.setAppCheckProviderFactory(providerFactory)
      
      FirebaseApp.configure()

    return true
  }
}

@main
struct nobullshitApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
          NavigationView {
            ContentView()
          }
        }
    }
}
