//
//  Task.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 08/07/25.
//
import Foundation
import SwiftData

@Model
class Task {
    var id = UUID()
    var nomeTarefa: String
    var tempoTarefa: String
    var tempoDescanso: String
    var som: Bool
    var dataCriacao: Date
    
    init(
        id: UUID = UUID(),
        nomeTarefa: String,
        tempoTarefa: String,
        tempoDescanso: String,
        som: Bool = false,
        dataCriacao: Date = Date()
    ) {
            self.id = id
            self.nomeTarefa = nomeTarefa
            self.tempoTarefa = tempoTarefa
            self.tempoDescanso = tempoDescanso
            self.som = false
            self.dataCriacao = dataCriacao
    }
}
