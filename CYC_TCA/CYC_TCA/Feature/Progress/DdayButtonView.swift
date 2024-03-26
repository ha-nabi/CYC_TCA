//
//  DdayButtonView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct DdayButtonView: View {
    @Binding var goal: Int
    
    var body: some View {
        VStack {
            Text("D-\(goal)")
                .font(.pretendardSemiBold_12)
                .foregroundStyle(Color.baseColor)

            Image(.kissPink)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            
        }
    }
}
