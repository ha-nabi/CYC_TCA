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
        case showingAlert(Bool)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .showingAlert(input):
                state.isShowingAlert = input
                return .none
            }
        }
    }
}
