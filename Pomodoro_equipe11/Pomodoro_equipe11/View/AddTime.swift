//
//  AddTime.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//

import SwiftUI
import SwiftData

struct AddTime: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @StateObject var viewModel = PomodoroViewModel()
    @Binding var ativa:Bool
    
    @State var minutosTarefa: String = "00"
    @State var segundosTarefa: String = "00"
    @State var minutosDescanso: String = "00"
    @State var segundosDescanso: String = "00"
    
    var podeIniciar: Bool {
        (minutosTarefa != "00" || segundosTarefa != "00") &&
        (minutosDescanso != "00" || segundosDescanso != "00")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Nome:")
                            TextField("Nome da Tarefa", text: $viewModel.nomeTarefa)
                                .frame(minHeight: 40)
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("Tempo da Tarefa:")
                            
                            Spacer()
                            
                            TextField("", text: $minutosTarefa, onEditingChanged: { clicado in
                                DispatchQueue.main.async {
                                    minutosTarefa = viewModel.animacaoTexto(minutosTarefa, foco: clicado)
                                }
                            })
                            .keyboardType(.numberPad)
                            .frame(width:50 ,height: 40)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .onChange(of: minutosTarefa){
                                if !minutosTarefa.isEmpty && minutosTarefa != "00"{
                                    minutosTarefa = viewModel.limitarCaracteres(minutosTarefa)
                                }
                            }
                            
                            Text(":")
                            
                            TextField("", text: $segundosTarefa, onEditingChanged: { clicado in
                                DispatchQueue.main.async {
                                    segundosTarefa = viewModel.animacaoTexto(segundosTarefa, foco: clicado)
                                }
                            })
                            .keyboardType(.numberPad)
                            .frame(width:50 ,height: 40)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                            .onChange(of: segundosTarefa){
                                if !segundosTarefa.isEmpty && segundosTarefa != "00" {
                                    segundosTarefa = viewModel.limitarCaracteres(segundosTarefa)
                                }
                            }
                        }
                    }
                    
                    
                    Section {
                        HStack {
                            Text("Tempo de Descanso:")
                            
                            Spacer()
                            
                            TextField("", text: $minutosDescanso, onEditingChanged: {clicado in
                                DispatchQueue.main.async {
                                    minutosDescanso = viewModel.animacaoTexto(minutosDescanso, foco: clicado)
                                }
                            })
                            .keyboardType(.numberPad)
                            .frame(width:50 ,height: 40)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                            .onChange(of: minutosDescanso) {
                                if !minutosDescanso.isEmpty && minutosDescanso != "00" {
                                    minutosDescanso = viewModel.limitarCaracteres(minutosDescanso)
                                }
                            }
                            
                            Text(":")
                            
                            TextField("", text: $segundosDescanso, onEditingChanged: {clicado in
                                DispatchQueue.main.async {
                                    segundosDescanso = viewModel.animacaoTexto(segundosDescanso, foco: clicado)
                                }
                            })
                            .keyboardType(.numberPad)
                            .frame(width:50 ,height: 40)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                            .onChange(of: segundosDescanso){
                                if !segundosDescanso.isEmpty && segundosDescanso != "00" {
                                    segundosDescanso = viewModel.limitarCaracteres(segundosDescanso)
                                }
                            }
                        }
                    }
                    
                    Section {
                        Toggle("Som", isOn: $viewModel.som)
                        Toggle("Guarda Tarefa", isOn: $viewModel.guardaTarefa)
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
                        viewModel.salvarTarefa(
                            minutoTarefa: Int(minutosTarefa) ?? 0,
                            segundoTarefa: Int(segundosTarefa) ?? 0,
                            minutoDescanso: Int(minutosDescanso) ?? 0,
                            segundoDescanso: Int(segundosDescanso) ?? 0,
                            context: context
                        )
                        
                            viewModel.checkNavegarPomodoro()
                    }
                    .disabled(!podeIniciar)
                }
            }
            .alert("Atenção", isPresented: $viewModel.alertaGuardaTarefa){
                Button("OK", role: .cancel){}
            } message: {
                Text("Insira o Nome da Tarefa para Guardá-la")
            }
            .fullScreenCover(isPresented: $viewModel.navegarPomodoro
            ){
                Pomodoro(
                    ativa: $ativa,
                    inicia: false,
                    tempoTarefa: viewModel.totalSegundos(minutos: minutosTarefa, segundos: segundosTarefa),
                    tempoDescanso: viewModel.totalSegundos(minutos: minutosDescanso, segundos: segundosDescanso)
                )
            }
        }
    }
}

#Preview {
    AddTime( ativa: .constant(false))
}
