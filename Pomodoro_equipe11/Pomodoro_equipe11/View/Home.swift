//
//  Home.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var fogueteVM: FogueteViewModel
    
    @State var viewTarefa: Bool = false
    @State var posicaoPlaneta: [CGPoint] = Array(repeating: .zero, count: Planeta.allCases.count)
    
    var planetas: [Planeta] = Planeta.allCases
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("imageBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                LinhaPontilhada(pontos: posicaoPlaneta)
                    .rotationEffect(.degrees(180))
                    .offset(y: 70)
                
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
                                .background (
                                    GeometryReader { geo in
                                        Color.clear
                                            .onChange(of: geo.frame(in: .named("Scroll"))) { newFrame in
                                                DispatchQueue.main.async {
                                                    let adjustedCenter = CGPoint(x: newFrame.midX, y: newFrame.midY)
                                                    posicaoPlaneta[index] = adjustedCenter
//                                                    /*print("Planeta \(index) center: \(adjus*/tedCenter)")
                                                }
                                            }
                                    }
                                )
                                .offset(alinhamentoPlaneta(index: index))
                        }
                    }
                    .padding(.top, 220)
                    .padding(.bottom, 680)
                    .padding(.horizontal)
                    
                }
                .coordinateSpace(name: "Scroll")
                .rotationEffect(.degrees(180))
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    fogueteVM.fogueteSelecionadoPerfil.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .padding(.bottom, 25)
                        .rotationEffect(.degrees(-45))
                    
                }
                
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
                AddTime(ativa: $viewTarefa)
                    .presentationDetents([.fraction(0.7), .large])
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
            .environmentObject(FogueteViewModel())
    }
}
