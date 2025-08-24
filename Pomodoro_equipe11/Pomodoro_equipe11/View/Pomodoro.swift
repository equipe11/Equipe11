//
//  Pomodoro.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 24/07/25.
//

import SwiftUI

struct Pomodoro: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = PomodoroViewModel()

    @Binding var ativa: Bool
    @State var inicia: Bool = false
    @State var tempo: Timer?
    var tempoTarefa: Int = 0
    var tempoDescanso: Int = 0

    var body: some View {
        NavigationView {
            ZStack {
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Planeta.lazu.image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 350)
                            .padding(.top, 10)
                        
                        if inicia { Text(viewModel.formatarTempo(viewModel.tempoRestante))
                                .font(.system(size: 65, weight: .bold))
                                .foregroundStyle(.red)
                        }
                    }
                    
                    if !inicia {
                        Button(action: {
                            inicia = true
                            viewModel.iniciarContagem(
                                tempo: tempoTarefa,
                                descanso: tempoDescanso
                            )
                        }) {
                            Text("Iniciar")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: 130, minHeight: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top, 100)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            
            .alert(
                "O Tempo de Tarefa Terminou",
                isPresented: $viewModel.mostraAlertaTempoDescanso
            ) {
                Button("Iniciar Tempo de Descanso") {
                    viewModel.iniciarContagem(
                        tempo: tempoDescanso,
                        descansoAtivo: true
                    )
                }
                Button("Cancelar", role: .cancel) {
                    viewModel.paraContagem()
                }
            } message: {
                Text("Deseja Iniciar o Tempo de Descanso?")
            }
            
            .alert(
                "Ciclo Terminado!",
                isPresented: $viewModel.voltaTelaInicialAlert
            ){
                Button("Repetir Ciclo"){
                    inicia = true
                    viewModel.iniciarContagem(
                        tempo: tempoTarefa,
                        descanso: tempoDescanso
                    )
                }
                
                Button("Voltar a Tela Inicial") {
                    ativa = false
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 2
                    ) {
                        dismiss()
                    }
                }
            } message: {
                Text("Deseja Repetir o Ciclo ou Voltar para a Tela Inicial?")
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        ativa = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            dismiss()
                        }
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Voltar")
                        }
                    }
                    .disabled(inicia)
                    .opacity(inicia ? 0.5 : 1.0)
                }
            }
        }
    }
}

#Preview {
    Pomodoro(ativa: .constant(false), tempoTarefa: 0, tempoDescanso: 0)
}
