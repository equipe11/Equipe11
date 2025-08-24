//
//  CardList.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//
import SwiftUI

struct CardList: View {
    var nomeTarefa: String
    var tempoTarefa: String
    var tempoDescanso: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(nomeTarefa)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
//                Button(action: {
//                    print("inicar tarefa novamente")
//                }){
//                    Image(systemName: "play")
//                        .foregroundStyle(.green)
//                        .padding(.trailing, 15)
//                }
            }
            
            HStack {
                Text("Tempo de tarefa:")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text("\(tempoTarefa)")
                    .foregroundStyle(.green)
            }
            
            HStack {
                Text("Tempo de descanso:")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text("\(tempoDescanso)")
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 130, alignment: .topLeading)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    CardList(nomeTarefa: "cachorro", tempoTarefa: "10:00", tempoDescanso: "50:60")
}
