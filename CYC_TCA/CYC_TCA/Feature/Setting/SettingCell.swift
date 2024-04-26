//
//  SettingCell.swift
//  CYC_TCA
//
//  Created by 강치우 on 4/26/24.
//

import SwiftUI

struct SettingCell: View {
    var imageName: String
    var settingTittle: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(settingTittle)
                .font(.pretendardMedium_17)
                .padding(.leading, 10)
            
        }
        .foregroundStyle(.base)
        .padding(.vertical, 8)
    }
}
