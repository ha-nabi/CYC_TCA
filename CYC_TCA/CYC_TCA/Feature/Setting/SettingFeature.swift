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
        var licenseInfo: IdentifiedArrayOf<LicenseModel> = []
        var isShowingAlert: Bool = false
    }
    
    enum Action {
        case showingAlert(Bool)
        case license
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .showingAlert(input):
                state.isShowingAlert = input
                return .none
                
            case .license:
                state.licenseInfo = [
                    LicenseModel(text: "이모티콘: Desingned by Flaticon", destination: "https://www.flaticon.com/kr/free-icon/birthday_817754?term=%EA%B3%B5%EB%A3%A1&page=1&position=10&origin=search&related_id=817754"),
                    LicenseModel(text: "폰트: Pretendard", destination: "https://cactus.tistory.com/306"),
                ]
                return .none
            }
        }
    }
}
