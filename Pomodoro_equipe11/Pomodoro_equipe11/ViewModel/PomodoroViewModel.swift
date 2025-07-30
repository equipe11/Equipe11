//
//  PomodoroViewModel.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 24/07/25.
//

import Foundation
import Combine

class PomodoroViewModel: ObservableObject {
    @Published var tempoRestante: Int = 0
    private var contador: Timer?
    
    func animacaoTexto(_ dica: String, dicaPadrao: String = "00", foco: Bool) -> String {
        if foco && dica == dicaPadrao {
            return ""
        } else if !foco && dica.isEmpty {
            return dicaPadrao
        }
        
        return dica
    }
    
    func limitarCaracteres(_ tempo: String) -> String{
        return String(tempo.prefix(2))
    }
    
    func totalSegundos(minutos: String, segundos: String) -> Int {
        var minutosInt: Int = Int(minutos) ?? 0
        var segundosInt: Int = Int(segundos) ?? 0
        
        return minutosInt * 60 + segundosInt
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
