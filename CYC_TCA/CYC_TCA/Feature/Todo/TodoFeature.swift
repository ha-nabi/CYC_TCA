//
//  TodoFeature.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct TodoFeature {
    @ObservableState
    struct State {
        
    }
    
    enum Action: Equatable {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
