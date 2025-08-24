//
//  Pomodoro_equipe11App.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 27/05/25.
//

import SwiftUI
import SwiftData

@main
struct Pomodoro_equipe11App: App {
    @StateObject var fogueteVM = FogueteViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fogueteVM)
        }
        .modelContainer(for: Task.self)
    }
}
