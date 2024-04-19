//
//  SettingFeature.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct SettingFeature {
    @ObservableState
    struct State: Equatable {
        var setting: IdentifiedArrayOf<Setting> = []
        var isShowingAlert: Bool = false
    }
    
    enum Action {
        case getSetting
        case showingAlert(Bool)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getSetting:
                state.setting = [
                    Setting(id: UUID(), name: "CYC에 대해서", imageName: "about", destination: { AnyView(AboutCYC()) }),
                    Setting(id: UUID(), name: "알림설정", imageName: "bells", destination: { AnyView(NotificationView()) }),
                    Setting(id: UUID(), name: "라이센스", imageName: "docs", destination: { AnyView(LicenseView()) })
                ]
                return .none
                
            case let .showingAlert(input):
                state.isShowingAlert = input
                return .none
            }
        }
    }
}
