//
//  Profile.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftData
import SwiftUI

struct Profile: View {
    @EnvironmentObject var fogueteVM: FogueteViewModel
    @Environment(\.modelContext) private var context
    @Query var foguetes: [Foguete]

    let colunas: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 30) {
                    ForEach(ImagemPerfilNomeFoguete.allCases, id: \.self) {
                        foguete in
                        CardPerfil(
                            foguete: foguete,
                            selecionado: fogueteVM.fogueteSelecionadoPerfil
                                == foguete
                        ) {
                            fogueteVM.fogueteSelecionadoPerfil = foguete
                            fogueteVM.salvarFoguete(
                                context: context,
                                foguete: foguete
                            )
                        }
                    }
                }
                .padding()
                .onAppear {

                    if let salvo = foguetes.first,
                        let foguete = ImagemPerfilNomeFoguete(
                            rawValue: salvo.nome
                        )
                    {
                        fogueteVM.fogueteSelecionadoPerfil = foguete
                    }
                }
            }
            .background(
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )

            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Perfil")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        Profile()
            .environmentObject(FogueteViewModel())
    }
}
