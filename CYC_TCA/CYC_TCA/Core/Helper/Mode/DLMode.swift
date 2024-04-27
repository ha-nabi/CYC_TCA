//
//  DLMode.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import ComposableArchitecture
import SwiftUI

struct DLMode: View {
    @Bindable var store: StoreOf<MainFeature>
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 270)
                        .foregroundStyle(.background)
                    VStack(spacing: 20) {
                        HStack {
                            Text("테마 설정")
                                .font(.pretendardBold_25)
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle.fill")
                        }
                        .bold()
                        .font(.title)
                        .foregroundStyle(.primary)
                        .padding(.vertical)
                        .padding(.horizontal, 23)
                        
                        HStack(spacing: 40) {
                            
                            // Light Mode
                            Button {
                                store.send(.setMode(.Light))
                            } label: {
                                UIButton(store: store, mode: .Light, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .white)
                            }
                            .tint(.primary)
                            
                            // Dark Mode
                            Button {
                                store.send(.setMode(.Dark))
                            } label: {
                                UIButton(store: store, mode: .Dark, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .black)
                            }
                            .tint(.primary)
                            
                            // System Mode
                            ZStack {
                                UIButton(store: store, mode: .System, Rbg: Color(.systemGray), Rbgi: Color(.systemGray4), ibg: .white)
                                UIButton(store: store, mode: .System, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .black)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 50, height: 200)
                                            .offset(x: -24)
                                    }
                            }
                            .onTapGesture {
                                store.send(.setMode(.System))
                            }
                        }
                    }
                }
                .padding(.horizontal, 8)
                .preferredColorScheme(AppearanceMode(rawValue: store.appearanceMode.rawValue)?.colorScheme)
                
            }
            .offset(y: store.isShowingDLModeButton ? 300 : -30)
        }
        .onTapGesture {
            store.send(.modebuttonTapped)
        }
    }
}
