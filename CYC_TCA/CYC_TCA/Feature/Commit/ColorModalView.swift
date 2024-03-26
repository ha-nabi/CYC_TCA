//
//  ColorModalView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct ColorModalView: View {
    @ObservedObject private var commitViewModel = CommitViewModel.shared
    @AppStorage("colorkey") var selectedColor: Color = .green
    
    var colorsName = ["red", "green", "blue", "cyan", "orange", "indigo"]
      
    var body: some View {
        VStack {
            Picker("Choose a color", selection: $commitViewModel.selectedColorName) {
                ForEach(colorsName, id: \.self) {
                    Text($0)
                        .foregroundStyle(GrassColor[$0])
                }
            }
            .pickerStyle(.wheel)
            .cornerRadius(15)
            
            Button(action: {
                commitViewModel.showColorModal.toggle()
                selectedColor = GrassColor[commitViewModel.selectedColorName]
            }) {
                Text("저장")
                    .font(.pretendardBold_17)
                    .foregroundStyle(Color.baseColor)
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
        
    }
}

