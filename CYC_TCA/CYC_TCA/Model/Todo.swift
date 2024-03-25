//
//  Model.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import SwiftUI
import SwiftData

@Model
final class Todo: Identifiable {
    var id = UUID()
    var title: String
    var createdAt = Date()
    var completed = false

    init(title: String = "") {
        self.title = title
    }
}
