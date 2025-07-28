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
                        viewModel.iniciarContagem(tempo: tempoTarefa)
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
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
    Pomodoro(tempoTarefa: 0, tempoDescanso: 0)
}
