//
//  AddTime.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//

import SwiftUI

struct AddTime: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = PomodoroViewModel()
    @Binding var ativa:Bool
    
    @State var nomeTarefa: String = ""
    @State var som: Bool = true
    @State var guardaTarefa: Bool = false
    @State var navegarPomodoro: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Digite o nome da tarefa")
                        
                        TextField("", text: $nomeTarefa)
                    }
                    
                    Section {
                        DatePicker(
                            "Tempo de tarefa",
                            selection: $viewModel.tempoTarefa,
                            displayedComponents: [.hourAndMinute]
                            
                        )
                    }
                    
                    Section {
                        DatePicker(
                            "Tempo de descanso",
                            selection: $viewModel.tempoDescanso,
                            displayedComponents: [.hourAndMinute]
                            
                        )
                    }
                    
                    Section {
                        Toggle("som", isOn: $som)
                        Toggle("Guarda tarefa", isOn: $guardaTarefa)
                    }
                }
            }
            .navigationTitle("Pomodoro")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancelar")
                            .foregroundStyle(Color.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Iniciar"){
                        navegarPomodoro = true
                    }
                }
            }
            .fullScreenCover(isPresented: $navegarPomodoro,
                             onDismiss: { ativa = false }
            ){
                Pomodoro(
                    inicia: false,
                    tempoTarefa: viewModel.totalSegundos(from: viewModel.tempoTarefa),
                    tempoDescanso: viewModel.totalSegundos(from: viewModel.tempoDescanso)
                )
            }
        }
    }
}

#Preview {
    AddTime( ativa: .constant(false))
}
