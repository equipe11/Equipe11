//
//  TaskList.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct TaskList: View {
    
    let mockTask: [Task] = [
        Task(title: "cachorro passear", description: "leva o cachorro pra passear jaja"),
        Task(title: "comer", description: "lembrar de comer"),
        Task(title: "jantar", description: "lembrar de jantar"),
        Task(title: "dorme", description: "lembrar de dorme")
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(mockTask) { item in
                    CardList(title: item.title, description: item.description)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                }
            }
            .scrollContentBackground(.hidden)
            .background(
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .listStyle(PlainListStyle())
        }
    }
}


#Preview {
    TaskList()
}
