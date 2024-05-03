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
    @AppStorage("isLoggedIn") var isloggedInView: Bool = false
    
    @Bindable var store: StoreOf<MainFeature>
    
    var body: some View {
        NavigationStack {
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
                            store.send(.modebuttonTapped, animation: .spring)
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
                            Text("Hi, \(LoginManager.shared.userName ?? "CYC")")
                            
                            Text("오늘 커밋 잡쉈어?")
                        }
                        .font(.pretendardBold_25)
                        .hSpacing(.leading)
                        .padding(.leading, 25)
                        
                        ProgressView(store: store.scope(state: \.progress, action: \.progrss))
                        
                        CommitView(store: store.scope(state: \.commit, action: \.commit))
                            .padding(.top, -15)
                    }
                    .scrollIndicators(.hidden)
                }
                
                DLMode(store: store)
            }
            .navigationDestination (item: $store.scope(state: \.setting, action: \.setting)) { settingStore in
                SettingView(store: settingStore)
            }
        }
        .onAppear {
            Task {
                await LoginManager.shared.getCommitData()
            }
        }
    }
}
