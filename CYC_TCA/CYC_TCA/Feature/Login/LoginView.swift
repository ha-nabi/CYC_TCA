//
//  LoginView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var isloggedInView: Bool = false

    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                // MARK: - 중간 온보딩 뷰
                VStack {
                    Onboarding()
                }
                
                // MARK: - Github 소셜 로그인
                Link(destination: LoginManager.shared.loginURL ?? URL(string: "")!,
                     label: {
                    Image("githubbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 50)
                })
                .padding()
                .onOpenURL(perform: { url in
                    Task{
                        let success = await LoginManager.shared.handleCodeFromURL(url)
                            if success{
                                await LoginManager.shared.get_access_token()
                                isloggedInView = true
                            }
                        }
                })

                Text("2024, Check Your Commit all rights reserved.\nPowered by 4T2F")
                    .font(.pretendardLight_11)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
