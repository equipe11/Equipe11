//
//  AddTime.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//

import SwiftUI

struct AddTime: View {
    @Environment(\.dismiss) var dismiss
    
    @State var nomeTarefa: String = ""
    @State var tempoTarefa = Date()
    @State var tempoDescanso = Date()
    @State var som: Bool = true
    @State var guardaTarefa: Bool = false
    
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
                            selection: $tempoTarefa,
                            displayedComponents: [.hourAndMinute]
                            
                        )
                    }
                    
                    Section {
                        DatePicker(
                            "Tempo de descanso",
                            selection: $tempoDescanso,
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
                    Button(action: {
                        print("clicando")
                    }) {
                        Text("Iniciar")
                    }
                }
            }
        }
    }
}

#Preview {
    AddTime()
}
