//
//  ProgressViewModel.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import Foundation

class ProgressViewModel: ObservableObject{
    @Published var containerWidth: CGFloat = 0
    @Published var showSheet: Bool = false
    
    // MARK: 커밋 변수
    @Published var progress: Int = 0
    @Published var goal: Int
    
    static let shared = ProgressViewModel()
    
    init() {
        // UserDefaults에서 이전에 저장된 값이 있는지 확인
        if let savedGoal = UserDefaults.standard.object(forKey: "goal") as? Int {
            self.goal = savedGoal
        } else {
            // UserDefaults에 저장된 값이 없는 경우, 초기값으로 100 설정
            self.goal = 100
            UserDefaults.standard.set(self.goal, forKey: "goal")
        }
    }
    
    // 사용자가 goal 값을 변경할 때마다 호출되는 메서드
    func updateGoal(newGoal: Int) {
        self.goal = newGoal
        UserDefaults.standard.set(self.goal, forKey: "goal")
    }
}

