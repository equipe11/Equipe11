//
//  Home.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct Home: View {
    var foguete: ImagemPerfilNomeFoguete = .lurico
    var planetas: [Planeta] = Planeta.allCases
    
    @State var min: Int = 1
    @State var sec: Int = 00
    @State var date = Date()
    
    @State var viewTarefa: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("\(foguete)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .padding(.bottom, 25)
                        .rotationEffect(.degrees(-45))
                    
                }
                //a ideia inicial para que o foguete encoste em cada planeta
                //er girar o foguete com animacao e depois muda o padding da scroll
                //para abaixa o planeta ate o foguete ou leva o planeta ate a posicao
                //do planeta se ele ja estiver visivel na tela se nao usar o padding
                //da scroll para mostrar o planeta mudamos a posicao do planeta na tela
                //de acordo com a posicao do planeta ja temos a funcao da cordenada do planeta
                
                
                //scroll esta invertida
                ScrollView {
                    LazyVStack(spacing: 40) {
                        ForEach(planetas.indices, id: \.self) { index in
                            planetas[index].image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(alinhamentoPlaneta(index: index))
                        }
                    }
                    .padding(.top, 220)
                    .padding(.bottom, 680)
                    .padding(.horizontal)

                }
                .rotationEffect(.degrees(180))
                .ignoresSafeArea()
                
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {
                            viewTarefa.toggle()
                        }) {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                
            }
            .sheet(isPresented: $viewTarefa){
                AddTime()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            
        }
    }
    
    func alinhamentoPlaneta(index: Int) -> CGSize {
        let horizontal: CGFloat = index % 2 == 0 ? 120 : -120
        let vertical: CGFloat = index % 3 == 0 ? -10 : 20
        return CGSize(width: horizontal, height: vertical)
    }
}

#Preview {
    NavigationView{
        Home()
    }
}
