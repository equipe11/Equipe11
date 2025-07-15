//
//  Home.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct Home: View {
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
                    HStack {
                        Text(String(format: "%02d", min))
                            .foregroundStyle(Color.red)
                        Text(":")
                        Text(String(format: "%02d", sec))
                            .foregroundStyle(Color.red)
                    }
                    
                    Button(action: {
                        if sec > 0 {
                            sec -= 1
                        } else if  min > 0 {
                            min -= 1
                            sec = 59
                        }
                    }) {
                        Text("Diminuindo valor")
                    }
                }
                .padding()
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
        }
        .sheet(isPresented: $viewTarefa){
            AddTime()
        }

    }
    
}

#Preview {
    Home()
}
