//
//  PersonGridView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI

struct PersonGridView: View {
    var person: Person
    
    var body: some View {
        Link(destination: URL(string: person.link)!) {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 170,height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .foregroundStyle(person.color)
                        .shadow(color: .black, radius: 0.8)
                    
                    VStack {
                        Text(person.name)
                            .font(.pretendardBold_20)
                        Text(person.subtitle)
                            .font(.pretendardSemiBold_12)
                        
                        Image(person.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    PersonGridView(person: Person(name: "Ciu", subtitle: "iOS Developer", image: "angry", color: .blue, link: "https://github.com/kangciu"))
}
