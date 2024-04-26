//
//  Setting.swift
//  CYC_TCA
//
//  Created by 강치우 on 4/19/24.
//

import SwiftUI

struct Setting: Identifiable, Hashable {
    let id: UUID
    let name: String
    let imageName: String
    
    // MARK: - Equatable 프로토콜
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: - Hashable 프로토콜
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
