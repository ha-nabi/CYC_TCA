//
//  ProgressView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct ProgressView: View {
    @ObservedObject private var loginModel = LoginModel.shared
    @ObservedObject private var progressViewModel = ProgressViewModel.shared
    
    var body: some View {
        VStack {
            ProgressTextView()
            HStack(alignment: .center) {
                ProgressBarView()
                    .onAppear {
                        progressViewModel.progress = loginModel.commitDay
                        ModalView().moveDinosaur()
                    }
                
                // pink dinosaur button view
                ZStack(alignment: .top) {
                    Button {
                        progressViewModel.showSheet.toggle()
                    } label: {
                        DdayButtonView(goal: $progressViewModel.goal)
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $progressViewModel.showSheet) {
                        ModalView()
                    }
                }
                .padding(.top, -15)
            }
            .padding(.horizontal, 5)
        }
        .padding(.top, 20)
        .background(Color.bgColor)
    }
}

#Preview {
    ProgressView()
}



