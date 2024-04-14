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
    
    var body: some View {
        ZStack {
            if isloggedInVIew {
                MainView(store: Store(initialState: MainFeature.State()) {
                    MainFeature()
                })
            } else {
                LoginView()
            }
        }
    }
}
