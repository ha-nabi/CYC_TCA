//
//  CommitView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import SwiftUI

struct CommitView: View {
    @AppStorage("colorkey") var selectedColor: Color = .green
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.containerColor)
                .cornerRadius(15.0)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            
            
            VStack(alignment: .leading) {
                Text("커밋 기록")
                    .font(.pretendardBold_17)
                    .foregroundStyle(.base)
                    .padding(.bottom, 10)
                ZStack {
//                    GrassView(loginModel.testCase, row: 4, col: 10, cellColor: selectedColor)
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundStyle(Color(white: 1.0, opacity: 0.001))
                        .padding(.horizontal, 10)
                    
                }
//                .gesture(
//                    TapGesture()
//                        .onEnded { _ in
//                            commitModel.showColorModal.toggle()
//                        })
//                .sheet(isPresented: $commitModel.showColorModal) {
//                    ColorModalView()
//                }
            }
            .padding(40)
        }
    }
}

#Preview {
    CommitView()
}
