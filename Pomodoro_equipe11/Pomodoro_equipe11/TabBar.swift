//
//  TabBar.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//

import SwiftUI
import UIKit

struct TabBar: View {
    @State var selection = 1
    
    init() {
        let appearance = UITabBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = .clear

                appearance.stackedLayoutAppearance.normal.iconColor = .white
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

                appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color("ColorIconTabBar"))
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color("ColorIconTabBar"))]

                UITabBar.appearance().standardAppearance = appearance
    }
    var body: some View {
        
        TabView(selection: $selection) {
            Tab("Lista", systemImage: "list.bullet.clipboard", value: 0) {
                TaskList()
            }
            
            
            Tab("Inicio", systemImage: "house", value: 1) {
                Home()
                    .background(Color.clear)
                
            }

            
            Tab("Perfil", systemImage: "person.circle", value: 2) {
                Profile()
                    .background(Color.clear)
                
            }
            
        }
        .background(Color.clear)
        .toolbarBackground(.hidden, for: .tabBar)
    }
}
