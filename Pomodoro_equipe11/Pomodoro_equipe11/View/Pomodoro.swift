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
        NavigationView{
            ZStack {
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Planeta.lazu.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                
                
                if !inicia {
                    Button(action: {
                        inicia = true
                        viewModel.iniciarContagem(tempo: tempoTarefa, descanso: tempoDescanso)
                    }) {
                        Image(systemName: "play")
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(.green)
                            .frame(width: 60, height: 60)
                    }
                } else {
                    Text(viewModel.formatarTempo(viewModel.tempoRestante))
                        .font(.system(size: 65, weight: .bold))
                        .foregroundStyle(.red)
                }
            }
            .alert("O Tempo de Tarefa Terminou", isPresented: $viewModel.mostraAlertaTempoDescanso){
                Button("Iniciar Tempo de Descanso"){
                    viewModel.iniciarContagem(tempo: tempoDescanso, descansoAtivo: true)
                }
                Button("Cancelar", role: .cancel) {
                    viewModel.paraContagem()
                }
            } message: {
                Text("Deseja Iniciar o Tempo de Desncanso?")
            }
            .overlay(
                Group {
                    if viewModel.voltaTelaInicialAlert {
                        VStack {
                            Text("Voltando para a tela inicial em \(viewModel.tempoDeVolta)")
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.3))
                        .transition(.opacity)
                        .onChange(of: viewModel.tempoDeVolta) { novoValor in
                            if novoValor == 0 {
                                ativa = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                    dismiss()
                                }
                            }
                        }
                    }
                }
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        ativa = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            dismiss()
                        }
                    }){
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Voltar")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Pomodoro(ativa: .constant(false), tempoTarefa: 0, tempoDescanso: 0)
}
