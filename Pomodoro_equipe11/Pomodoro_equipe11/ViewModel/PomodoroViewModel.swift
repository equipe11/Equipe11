//
//  PomodoroViewModel.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 24/07/25.
//

import Foundation
import Combine

class PomodoroViewModel: ObservableObject {
    @Published var tempoTarefa: Date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @Published var tempoDescanso: Date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @Published var tempoRestante: Int = 0
    private var contador: Timer?
    
    func minutosSegundos(from date: Date) -> (minutos: Int, segundos: Int) {
        let calendar = Calendar.current
        let minutos = calendar.component(.hour, from: date)
        let segundos = calendar.component(.minute, from: date)
        return (minutos, segundos)
    }
    
    func totalSegundos(from date: Date) -> Int {
        let (minutos, segundos) = minutosSegundos(from: date)
        return minutos * 60 + segundos
    }
    
    func formatarTempo(_ totalSegundos: Int) -> String {
        let minutos = totalSegundos / 60
        let segundos = totalSegundos % 60
        return String(format: "%02d:%02d", minutos, segundos)
    }
    
    func iniciarContagem(tempo tempo: Int) {
        tempoRestante = tempo
        contador?.invalidate()
        
        contador = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.tempoRestante > 0 {
                self.tempoRestante -= 1
            }else {
                self.contador?.invalidate()
            }
        }
    }
}
