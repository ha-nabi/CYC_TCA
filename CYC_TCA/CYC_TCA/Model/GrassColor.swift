//
//  GrassColor.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct GrassColor {
    static subscript(name: String) -> Color {
        switch name {
            case "red":
                return Color.red
            case "green":
                return Color.green
            case "blue":
                return Color.blue
            case "cyan":
                return Color.cyan
            case "orange":
                return Color.orange
            case "indigo":
                return Color.indigo
            default:
                return Color.accentColor
        }
    }
}
