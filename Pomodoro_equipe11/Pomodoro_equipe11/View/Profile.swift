//
//  Profile.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack{
         Image("imageBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack {
                Text("Profile")
            }
        }
    }
}

#Preview {
    Profile()
}
