//
//  TaskList.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Task.dataCriacao, order: .reverse) var tarefas: [Task]
    
    @StateObject var viewModel = PomodoroViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                if tarefas.isEmpty {
                    ZStack {
                        Image("imageBackground")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        Text("Nenhuma Tarefa Adicionada!")
                            .foregroundStyle(.red)
                    }
                    .listRowBackground(Color.clear)
                } else {
                    ForEach(tarefas) { tarefa in
                        CardList(nomeTarefa: tarefa.nomeTarefa,
                                 tempoTarefa: viewModel.formatarSegundos(tarefa.tempoTarefa),
                                 tempoDescanso: viewModel.formatarSegundos(tarefa.tempoDescanso)
                        )
                        .listRowBackground(Color.clear)
                    }
                    .onDelete { posicao in
                        posicao.forEach{ index in
                            let tarefa = tarefas[index]
                            context.delete(tarefa)
                        }
                    }
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
        .modelContainer(for: Task.self)
}
