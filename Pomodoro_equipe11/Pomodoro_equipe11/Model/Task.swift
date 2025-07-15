//
//  Task.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//
import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var nomeTarefa: String
    var tempoTarefa: String
    var tempoDescanso: String
}
