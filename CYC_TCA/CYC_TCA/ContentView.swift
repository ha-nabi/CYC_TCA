//
//  ContentView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import ComposableArchitecture

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") var isloggedInView: Bool = false
    
    var body: some View {
        ZStack {
            if isloggedInView {
                MainView(store: Store(initialState: MainFeature.State(
                    commit: CommitFeature.State(),
                    progress: ProgressFeature.State())
                ) {
                    MainFeature()
                })
            } else {
                LoginView()
            }
        }
    }
}
