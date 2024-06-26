//
//  TodoPreView.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/26/24.
//

import SwiftUI
import SwiftData

struct TodoPreView: View {
    @Query private var todoModel: [Todo]
    @Environment(\.modelContext) var modelContext: ModelContext
    
    // 생성시간 오래된 순으로 정렬
    var sortedTodoModel: [Todo] {
        return todoModel.sorted(by: { $0.createdAt < $1.createdAt })
    }
    
    var body: some View {
        NavigationLink(destination: TodoView(modelContext: modelContext)) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.containerColor)
                    .frame(width: 350, height: 200)
                    .cornerRadius(15.0)
                VStack(alignment: .leading) {
                    // MARK: - Todo 미리보기 헤더
                    HStack(spacing: 230) {
                        Text("오늘 뭐해?")
                        .font(.pretendardBold_17)
                        .foregroundStyle(.base)

                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.base)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)

                    Divider()
                        .frame(width: 350)
                        .padding(.top, 5)
                
                    // MARK: - Todo 미리보기 바디
                    
                    Spacer()
                        .frame(height: todoModel.count == 0 ? 140 : 0)

                    ForEach(sortedTodoModel.prefix(3)) { list in
                            HStack {
                                Button {
                                    TodoView(modelContext: modelContext).toggleCompleted(list)
                                } label: {    // 완료여부에 따라 이미지 변경
                                    Image(systemName: list.completed ? "checkmark.circle.fill" : "circle")
                                }
                                .buttonStyle(PlainButtonStyle())
                                .foregroundStyle(list.completed ? Color.green : Color.base)
                                Spacer()
                                Text("\(list.title)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                    .font(.pretendardSemiBold_15)
                                    .foregroundStyle(list.completed ? Color.gray : Color.base)
                            }
                            .padding(.leading, 20)
                            .offset(y: 25)
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -20)
                        Spacer()
                            .frame(height: todoModel.count == 1 ? 110 : (todoModel.count == 2 ? 60 : 10))
                }
            }
        }
    }
}


#Preview {
    TodoPreView()
}

