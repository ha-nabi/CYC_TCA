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
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case settingButtonTapped
        case path(StackAction<Path.State, Path.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                state.path.append(.settingView(SettingFeature.State()))
                return .none
                
            case let .path(action):
                switch action {
                default:
                    return .none
                }
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension MainFeature {
    @Reducer
    struct Path {
        @ObservableState
        enum State {
            case settingView(SettingFeature.State)
        }
        
        enum Action {
            case settingView(SettingFeature.Action)

        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.settingView, action: \.settingView) {
                SettingFeature()
            }
        }
    }
}
