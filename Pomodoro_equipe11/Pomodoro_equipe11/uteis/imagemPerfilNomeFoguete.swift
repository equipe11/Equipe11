//
//  image.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//
import SwiftUI

enum imagemPerfilNomeFoguete: String, CaseIterable {
    case galatico = "galatico"
    case austrico = "austrico"
    case meterito = "meterito"
    case lamanuto = "lamanuto"
    
    var image: Image {
        Image(self.rawValue)
    }
}
