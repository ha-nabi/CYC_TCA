//
//  CYC_TCAApp.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import SwiftUI
import SwiftData
import UserNotifications
import ComposableArchitecture

@main
struct CYC_TCAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    static let store = Store(initialState: OnboardingFeature.State()) {
        OnboardingFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView(store: CYC_TCAApp.store)
        }
    }
}
