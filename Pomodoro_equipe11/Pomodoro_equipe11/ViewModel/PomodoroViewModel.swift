//
//  PomodoroViewModel.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 24/07/25.
//

import SwiftData
import Foundation
import Combine

class PomodoroViewModel: ObservableObject {
    @Published var tempoRestante: Int = 0
    @Published var tempoDescanso: Int = 0
    @Published var emDescanso: Bool = false
    @Published var voltaTelaInicialAlert: Bool = false
    
    @Published var alertaGuardaTarefa: Bool = false
    
    @Published var navegarPomodoro: Bool = false
    
    @Published var nomeTarefa: String = ""
    @Published var som: Bool = true
    @Published var guardaTarefa: Bool = false
    
    @Published var mostraAlertaTempoDescanso: Bool = false
    
    @Published var tempoDeVolta: Int = 5
    
    private var contador: Timer?
    private var contadorVolta: Timer?
    
    func checkNavegarPomodoro(){
        if nomeTarefa.isEmpty && guardaTarefa {
            alertaGuardaTarefa = true
            return
        }
        
        return navegarPomodoro = true
    }
    
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
    
    func iniciarContagem(tempo tempo: Int, descanso: Int = 0, descansoAtivo: Bool = false) {
        tempoRestante = tempo
        tempoDescanso = descanso
        emDescanso = descansoAtivo
        
        contador?.invalidate()
        
        contador = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.tempoRestante > 0 {
                self.tempoRestante -= 1
            }else if self.tempoRestante == 0 {
                DispatchQueue.main.async {
                    self.mostraAlertaTempoDescanso = true
                }
            }
            
            if self.emDescanso {
                if self.tempoRestante > 0 {
                    self.tempoRestante -= 1
                }else if self.tempoRestante == 0 {
                    DispatchQueue.main.async {
                        self.mostraAlertaTempoDescanso = false
                        self.voltaTelaInicialAlert = true
                    }
                }
            }
        }
    }
    
    func paraContagem(){
        contador?.invalidate()
        contador = nil
    }
    
    func formatarSegundos(_ tempo: String) -> String{
        let dados = tempo.split(separator: ":")
        guard dados.count == 2,
        let minutos = dados.first,
        let segundos = dados.last else { return tempo }
        
        let segundoFormatados = String(format: "%02d", Int(segundos) ?? 0)
        
        return "\(minutos):\(segundoFormatados)"
    }
    
    func salvarTarefa(
        minutoTarefa: Int,
        segundoTarefa: Int,
        minutoDescanso: Int,
        segundoDescanso: Int,
        context: ModelContext
        
    ){
        guard guardaTarefa, !nomeTarefa.isEmpty else { return }
        
        let tarefaSalvar = Task(
            nomeTarefa: nomeTarefa,
            tempoTarefa: "\(minutoTarefa):\(segundoTarefa)",
            tempoDescanso: "\(minutoDescanso):\(segundoDescanso)",
            som: som
        )
        context.insert(tarefaSalvar)
    }
}
