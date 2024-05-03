//
//  CommitFeature.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct CommitFeature {
    @ObservableState
    struct State {
        var showColorModal: Bool = false
        var selectedColorName: String = "red"
        var selectedColor: Color = .green
    }
    
    enum Action: Equatable {
        case toggleColorModal
        case colorSelected(String)
        case saveColor
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .toggleColorModal:
                state.showColorModal = true
                return .none
                
            case let .colorSelected(colorName):
                state.selectedColorName = colorName
                state.selectedColor = GrassColor[colorName]
                return .none
                
            case .saveColor:
                state.showColorModal = false
                state.selectedColor = GrassColor[state.selectedColorName]
                return .none
            }
        }
    }
}
