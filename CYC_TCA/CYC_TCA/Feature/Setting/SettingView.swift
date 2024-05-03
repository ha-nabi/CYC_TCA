//
//  SettingView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

struct SettingView: View {
    @AppStorage("isLoggedIn") var isloggedInView: Bool = true
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading) {
                    NavigationLink(destination: AboutCYC()) {
                        SettingCell(imageName: "about", settingTittle: "CYC에 대해서")
                    }
                    
                    NavigationLink(destination: NotificationView()) {
                        SettingCell(imageName: "bells", settingTittle: "알림설정")
                    }
                    
                    NavigationLink(destination: LicenseView(store: store)) {
                        SettingCell(imageName: "docs", settingTittle: "라이센스")
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
                            LoginManager.shared.logout()
                            isloggedInView = false
                        }
                        
                        Button("닫기", role: .cancel) {
                            dismiss()
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
    }
}
