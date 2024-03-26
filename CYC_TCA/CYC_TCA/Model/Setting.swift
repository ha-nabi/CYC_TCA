//
//  Setting.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct SettingModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let destination: () -> AnyView
    
    // MARK: - Equatable 프로토콜
    static func == (lhs: SettingModel, rhs: SettingModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: - Hashable 프로토콜
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
}

struct Setting {
    let settings: [SettingModel] = [
        SettingModel(name: "CYC에 대해서", imageName: "about", destination: { AnyView(AboutCYC()) }),
        SettingModel(name: "알림설정", imageName: "bells", destination: { AnyView(NotificationView()) }),
        SettingModel(name: "라이센스", imageName: "docs",destination: { AnyView(LicenseView()) }),
    ]
    
}

