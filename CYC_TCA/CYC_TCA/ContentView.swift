//
//  ContentView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = false
    
    @Bindable var store: StoreOf<OnboardingFeature>
    
    var body: some View {
        ZStack {
            if isloggedInVIew {
                MainView()
            } else {
                LoginView(store: store)
            }
        }
    }
}
