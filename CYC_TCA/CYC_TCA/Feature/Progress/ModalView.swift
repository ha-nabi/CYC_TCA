//
//  ModalView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var loginModel = LoginModel.shared
    @ObservedObject var progressViewModel = ProgressViewModel.shared

    var body: some View {
        VStack {
            Picker("Your D-day", selection: $progressViewModel.goal) {
                ForEach(1...365, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            Button {
                progressViewModel.showSheet = false
                moveDinosaur()
                progressViewModel.updateGoal(newGoal: progressViewModel.goal)
            } label: {
                Text("저장")
                    .font(.pretendardBold_17)
                    .foregroundStyle(Color.baseColor)
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
    }
    
    // Animation에 대한 함수는 뷰에서만 정의 가능
    func moveDinosaur() {
        Task {
            for i in 0...loginModel.commitDay {
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                withAnimation {
                    progressViewModel.progress = i
                }
            }
        }
    }
    
}

