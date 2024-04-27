//
//  MainFeature.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct MainFeature {
    @ObservableState
    struct State {
        @Presents var setting: SettingFeature.State?
        var isShowingDLModeButton: Bool = true
        var appearanceMode: AppearanceMode = .System
    }
    
    enum Action {
        case setting(PresentationAction<SettingFeature.Action>)
        case setMode(AppearanceMode)
        case settingButtonTapped
        case modebuttonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                state.setting = SettingFeature.State()
                return .none
                
            case let .setMode(mode):
                state.appearanceMode = mode
                return .none
                
            case .setting(_):
                return .none
                
            case .modebuttonTapped:
                state.isShowingDLModeButton.toggle()
                return .none
            }
        }
        .ifLet(\.$setting, action: \.setting) {
            SettingFeature()
        }
    }
}
