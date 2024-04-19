//
//  SettingView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = true
    
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(store.setting, id: \.self) { setting in
                        NavigationLink(destination: setting.destination) {
                            HStack {
                                Image("\(setting.imageName)")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("\(setting.name)")
                                    .font(.pretendardMedium_17)
                                    .padding(.leading, 10)
                                
                            }
                            .foregroundStyle(.base)
                            .padding(.vertical, 8)
                        }
                        
                    }
                    
                    // MARK: - 로그아웃
                    Button {
                        store.send(.showingAlert(true))
                    } label: {
                        HStack(spacing: 18) {
                            Image("trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text("로그아웃")
                        }
                        .font(.pretendardMedium_17)
                        .foregroundStyle(.logout)
                        .padding(.top, 8)
                    }
                    .alert("정말 로그아웃 하시겠어요?", isPresented: $store.isShowingAlert.sending(\.showingAlert)) {
                        Button("로그아웃", role: .destructive) {
                            
                        }
                        
                        Button("닫기", role: .cancel) {
                            
                        }
                    }
                }
                .padding(.leading, 15)
                .hSpacing(.leading)
            }
            .padding(.top, 5)
            
            // MARK: - Powered by PJ2T2_CYC
            VStack(spacing: 8) {
                Text("2023, Check Your Commit all rights reserved.")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.pretendardLight_11)
                Text("Powered by PJ2T2_CYC")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.pretendardLight_11)
            }
            .vSpacing(.bottom)
        }
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
            }
        }
        .onAppear {
            store.send(.getSetting)
        }
    }
}
