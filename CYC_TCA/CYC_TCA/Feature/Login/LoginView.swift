//
//  LoginView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

struct LoginView: View {
    @Bindable var store: StoreOf<OnboardingFeature>
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                VStack {
                    OnboardingTabView(store: store)
                }
                
                Button {
                    
                } label: {
                    Image("githubbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 50)
                }
                .padding()
                
                Text("2023, Check Your Commit all rights reserved.\nPowered by PJ2T2_CYC")
                    .font(.pretendardLight_11)
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}
