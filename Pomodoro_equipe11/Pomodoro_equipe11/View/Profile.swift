//
//  Profile.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct Profile: View {
    @State var fogueteSelecionado: imagemPerfilNomeFoguete? = nil
    
    let colunas: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colunas, spacing: 30){
                ForEach(imagemPerfilNomeFoguete.allCases, id: \.self) {foguete in
                    CardPerfil(foguete: foguete, selecionado: fogueteSelecionado == foguete) {
                        fogueteSelecionado = foguete
                    }
                }
            }
            .padding()
        }
        .background(
            Image("imageBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    Profile()
}
