//
//  LicenseView.swift
//  CYC_TCA
//
//  Created by 강치우 on 4/19/24.
//

import ComposableArchitecture
import SwiftUI

struct LicenseView: View {
    @Environment(\.dismiss) var dismiss
    
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                // MARK: - 해더
                Text("라이센스")
                    .font(.pretendardBold_23)
                    .padding(.bottom, 5)
                Text("터치 시 라이센스 링크로 연결합니다")
                    .font(.pretendardLight_11)
                    .padding(.bottom, 20)
                
                // MARK: - 스크롤뷰(라이센스 링크)
                ForEach(store.licenseInfo) { info in
                    Link("\(info.text)", destination: URL(string: "\(info.destination)")!)
                        .font(.pretendardSemiBold_15)
                        .padding(.bottom, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.baseColor)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
        }
        .navigationTitle("라이센스")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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
            store.send(.license)
        }
    }
}
