//
//  ContentView.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var min: Int = 1
    @State var sec: Int = 00
    
    var body: some View {
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

#Preview {
    ContentView()
}
