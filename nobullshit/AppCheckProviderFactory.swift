//
//  AppCheckFirebaseFactory.swift
//  nobullshit
//
//  Created by Breno R R on 15/06/2024.
//

import FirebaseAppCheck
import Firebase

class CustomAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
  func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
    if #available(iOS 14.0, *) {
      return AppAttestProvider(app: app)
    } else {
      return DeviceCheckProvider(app: app)
    }
  }
}
