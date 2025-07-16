//
//  CardPerfil.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//
import SwiftUI

struct CardPerfil: View {
    var foguete: ImagemPerfilNomeFoguete
    var selecionado: Bool
    var selecionar: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(width: 125, height: 180)
                .overlay(
                    Rectangle()
                        .stroke(selecionado ? Color.bordaCardPerfilSelecionada : Color.bordaCardPerfil, lineWidth: 3)
                )
            
            VStack(spacing: 8){
                foguete.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                Text(foguete.rawValue.capitalized)
                    .foregroundStyle(.white)
            }
        }
        .onTapGesture {
            selecionar()
        }
    }
}

#Preview{
    CardPerfil(foguete: .lamanuto, selecionado: false, selecionar: {})
}
