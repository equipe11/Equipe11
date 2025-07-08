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
    
    var body: some View {
        ZStack{
            Image("imageBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(String(format: "%02d", min))
                    Text(":")
                    Text(String(format: "%02d", sec))
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
    }
    
}

#Preview {
    Home()
}
