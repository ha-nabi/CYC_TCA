//
//  CommitViewModel.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

class CommitViewModel: ObservableObject{
    @Published var showColorModal = false
    @Published var selectedColorName: String = "red"
    
    static let shared = CommitViewModel()
}
