//
//  License.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import Foundation

struct License: Identifiable {
    let id = UUID()
    let text: String
    let destination: String
}

struct licenseInfo {
    let licenseInfo:[License] = [
        License(text: "이모티콘: Desingned by Flaticon", destination: "https://www.flaticon.com/kr/free-icon/birthday_817754?term=%EA%B3%B5%EB%A3%A1&page=1&position=10&origin=search&related_id=817754"),
        License(text: "폰트: Pretendard", destination: "https://cactus.tistory.com/306"),
    ]
}
