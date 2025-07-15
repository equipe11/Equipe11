//
//  CardList.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//
import SwiftUI

struct CardList: View {
    var title: String
    var description: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .foregroundColor(.red)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.red)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 130, alignment: .topLeading)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    CardList(title: "ola mundo", description: "textando descricao")
}
