//
//  AboutCYC.swift
//  CYC_TCA
//
//  Created by 강치우 on 4/19/24.
//

import SwiftUI

struct AboutCYC: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            // NavigationTitle 넣어야함
            ZStack {
                Color.bg.ignoresSafeArea(.all)
                ScrollView {
                    // MARK: - Intro
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image("logo1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55)
                            
                            Text("CYC는 어떤 앱인가요?")
                                .font(.pretendardBold_23)
                                .padding(.vertical, 10)
                            
                            Text("CYC(Check Your Commit)은 주인장이 커밋을 자주 잊곤 해서 다른 사람들도 이런 불편함이 있지 않을까? 해서 만들어진 앱이에요")
                                .font(.pretendardSemiBold_15)
                                .lineSpacing(3)
                                .padding(.bottom, 15)
                            
                            Text("커밋 할 때 까지 여러분들을 귀찮게 할 수도 있어요\n하지만 꾸준함을 보여주기 위해 같이 1일 1커밋 같이 해봐요")
                                .font(.pretendardSemiBold_15)
                                .lineSpacing(3)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                        
                        // MARK: - With
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("만든 사람들")
                                    .font(.pretendardBold_23)
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                                
                                NavigationLink(destination: Contributes()) {
                                    Text("더보기")
                                        .font(.pretendardSemiBold_15)
                                        .foregroundStyle(.base)
                                        .padding(.trailing, 25)
                                }
                            }
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(0..<PersonData.count, id: \.self) { person in
                                    PersonGridView(person: PersonData[person])
                                }
                            }
                            .padding()
                        }
                    }
                    .padding(.top, 5)
                }
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("CYC에 대해서")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
            }
        }
    }
}
