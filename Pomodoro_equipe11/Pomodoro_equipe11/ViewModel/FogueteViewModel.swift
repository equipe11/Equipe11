//
//  FogueteViewModel.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 18/07/25.
//
import SwiftUI
import SwiftData

@MainActor
class FogueteViewModel: ObservableObject {
    @Published var fogueteSelecionadoPerfil: ImagemPerfilNomeFoguete = .lurico
    
    func carregarFoguete(_ foguetes: [Foguete]){
        if let salvo = foguetes.first,
           let foguete = ImagemPerfilNomeFoguete(rawValue: salvo.nome){
            self.fogueteSelecionadoPerfil = foguete
        }
    }
    
    func salvarFoguete(context: ModelContext, foguete: ImagemPerfilNomeFoguete){
        let antigoFoguete = FetchDescriptor<Foguete>()
        if let existentes = try? context.fetch(antigoFoguete){
            for item in existentes {
                context.delete(item)
            }
        }
        
        let novoFoguete = Foguete(nome: foguete.rawValue)
        context.insert(novoFoguete)
        
        do {
            try context.save()
            
            self.fogueteSelecionadoPerfil = foguete
        }catch {
            print("algo de errado aconteceu")
        }
        
    }
}
