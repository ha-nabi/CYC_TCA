//
//  Color+Extension.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import SwiftUI

extension Color {
    static let bgColor = Color("bgColor")
    static let containerColor = Color("containerColor")
    static let logoutColor = Color("logoutColor")
    static let progressBarColor = Color("progressBarColor")
    static let baseColor = Color("baseColor")
}

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else{
            self = .green
            return
        }
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) ?? .green
            self = Color(color)
        } catch {
            self = .green
        }
    }
    
    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
            
        } catch {
            
            return ""
        }
    }
}
