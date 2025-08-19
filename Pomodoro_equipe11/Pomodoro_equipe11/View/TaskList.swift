//
//  TaskList.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct TaskList: View {
    
    let mockTask: [Task] = [
//        Task(nomeTarefa: "toma banho", tempoTarefa: "10:00", tempoDescanso: "50:00"),
//        Task(nomeTarefa: "toma cha", tempoTarefa: "10:00", tempoDescanso: "50:00"),
//        Task(nomeTarefa: "toma agua", tempoTarefa: "10:00", tempoDescanso: "50:00"),
    ]
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(mockTask) { item in
                    CardList(nomeTarefa: item.nomeTarefa, tempoTarefa: item.tempoTarefa, tempoDescanso: item.tempoDescanso)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
                
                
                if mockTask.isEmpty {
                    ZStack {
                        Image("imageBackground")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        Text("Nenhuma Tarefa Adicionada!")
                            .foregroundStyle(.red)
                    }
                    .listRowBackground(Color.clear)
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Text("Tarefas")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}


#Preview {
    TaskList()
}
