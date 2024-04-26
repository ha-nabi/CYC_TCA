//
//  License.swift
//  CYC_TCA
//
//  Created by 강치우 on 4/19/24.
//

import Foundation

struct LicenseModel: Equatable ,Identifiable {
    let id = UUID()
    let text: String
    let destination: String
}
