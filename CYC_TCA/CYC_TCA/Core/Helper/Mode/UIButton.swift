//
//  UIButton.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import ComposableArchitecture
import SwiftUI

enum AppearanceMode: Int {
    case System = 0
    case Light = 1
    case Dark = 2
    
    var colorScheme: ColorScheme? {
        switch self {
        case .System:
            return .none
        case .Light:
            return .light
        case .Dark:
            return .dark
        }
    }
}

struct UIButton: View {
    @Bindable var store: StoreOf<MainFeature>
    
    var mode: AppearanceMode
    var Rbg: Color
    var Rbgi: Color
    var ibg: Color
    
    var body: some View {
        VStack(spacing: 20 ) {
            VStack {
                Circle()
                    .frame(width: 20, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 49, height: 6)
                VStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                }
                .frame(width: 55, height: 50)
                .background(ibg, in: RoundedRectangle(cornerRadius: 5))
            }
            .foregroundStyle(Rbgi)
            .padding(8)
            .overlay {
                if store.appearanceMode == mode {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .padding(-3)
                }
            }
            
            .background(Rbg, in: RoundedRectangle(cornerRadius: 7))
            
            Text(String(describing: mode).capitalized)
                .foregroundStyle(.primary)
                .font(.pretendardSemiBold_17)
                .frame(width: 88, height: 25)
                .background(.bg, in: RoundedRectangle(cornerRadius: 10))
            
        }
        .scaleEffect(store.appearanceMode == mode ? 1.0 : 0.9)
        .animation(.default, value: store.appearanceMode)
    }
}
