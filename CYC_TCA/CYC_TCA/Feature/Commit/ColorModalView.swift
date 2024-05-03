//
//  ColorModalView.swift
//  CYC_TCA
//
//  Created by 강치우 on 5/2/24.
//

import ComposableArchitecture
import SwiftUI

struct ColorModalView: View {
    @AppStorage("colorkey") var selectedColor: Color = .green
    
    @Bindable var store: StoreOf<CommitFeature>
    
    let colorsName = ["red", "green", "blue", "cyan", "orange", "indigo"]
      
    var body: some View {
        VStack {
            Picker("Choose a color", selection: Binding(
                get: { store.selectedColorName },
                set: { store.send(.colorSelected($0)) }
            )) {
                ForEach(colorsName, id: \.self) {
                    Text($0)
                        .foregroundStyle(GrassColor[$0])
                }
            }
            .pickerStyle(.wheel)
            .cornerRadius(15)
            
            Button {
                store.send(.toggleColorModal)
                selectedColor = GrassColor[store.selectedColorName]
            } label: {
                Text("저장")
            }
            .font(.pretendardBold_17)
            .foregroundStyle(Color.baseColor)
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
        
    }
}
