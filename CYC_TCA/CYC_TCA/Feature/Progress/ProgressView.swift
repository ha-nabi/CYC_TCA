//
//  ProgressView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/27/24.
//

import ComposableArchitecture
import SwiftUI

struct ProgressView: View {
    @Bindable var store: StoreOf<ProgressFeature>
    
    var body: some View {
        VStack {
            ProgressTextView()
            HStack(alignment: .center) {
                ProgressBarView()
                    .onAppear {
                        store.send(.updateProgress)
//                        ModalView().moveDinosaur()
                    }
                
                // pink dinosaur button view
                ZStack(alignment: .top) {
                    Button {
                        // progressModel.showSheet.toggle()
                    } label: {
                        VStack {
                            Text("D-\(store.goal)")
                                .font(.pretendardSemiBold_12)
                                .foregroundStyle(Color.baseColor)
                            
                            Image(.kissPink)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                            
                        }
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    //                    .sheet(isPresented: $progressModel.showSheet) {
                    //                        ModalView()
                    //                    }
                }
                .padding(.top, -15)
            }
            .padding(.horizontal, 5)
        }
        .padding(.top, 20)
        .background(Color.bgColor)
    }
}
