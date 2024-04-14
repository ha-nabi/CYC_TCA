//
//  MainView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture

import SwiftUI

struct MainView: View {
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .System
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = false
    
    @Bindable var store: StoreOf<MainFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ZStack {
                Color.bgColor.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image("logo1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                        
                        Spacer()
                        
                        Button {
                            // MARK: DLMODE
                        } label: {
                            Image(systemName: "lamp.table.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 5)
                        }
                        
                        Button {
                            store.send(.settingButtonTapped)
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal, 22)
                    .padding(.vertical)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi, Ciu")
                            
                            Text("오늘 커밋 잡쉈어?")
                        }
                        .font(.pretendardBold_25)
                        .hSpacing(.leading)
                        .padding(.leading, 25)
                        
                        ProgressView()
                        
                        CommitView()
                            .padding(.top, -15)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        } destination: { store in
            switch store.state {
            case .settingView(_):
                if let store = store.scope(state: \.settingView, action: \.settingView) {
                    SettingView()
                }
            }
        }
    }
}
