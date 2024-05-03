//
//  ProgressFeature.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ProgressFeature {
    @ObservableState
    struct State {
        var containerWidth: CGFloat = 0
        var showSheet: Bool = false
        var progress: Int = 0
        var goal: Int = 100
    }
    
    enum Action: Equatable {
        case updateGoal(Int)
        case loadInitialGoal
        case toggleSheet
        case updateProgress
        case setProgress(Int)
        case loadDinosaurDaysCount
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case let .updateGoal(newGoal):
                state.goal = newGoal
                // UserDefaults에 목표 저장
                UserDefaults.standard.set(newGoal, forKey: "goal")
                return .none
                
            case .loadInitialGoal:
                // UserDefaults에서 목표 불러오기
                state.goal = UserDefaults.standard.integer(forKey: "goal")
                if state.goal == 0 { state.goal = 100 }
                return .none
                
            case .toggleSheet:
                state.showSheet.toggle()
                return .none
                
            case .updateProgress:
                // 비동기적으로 commitDay를 로드
                return .run { send in
                    await send(.setProgress(LoginManager.shared.commitDay))
                }
                
            case let .setProgress(progress):
                state.progress = progress
                return .none
                
            case .loadDinosaurDaysCount:
                return .none
            }
        }
    }
}
