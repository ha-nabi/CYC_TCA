//
//  ProgressTextView.swift
//  CYC_TCA
//
//  Created by 강치우 on 5/4/24.
//

import SwiftUI

struct ProgressTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: -10) {
            Text("커밋 챌린지 \(LoginManager.shared.commitDay)일째\n")
                .font(.pretendardBold_17)
            
            Text("너 만나러 커밋 하는 중...")
                .font(.pretendardSemiBold_15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
}
