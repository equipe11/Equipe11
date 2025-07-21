//
//  image.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 15/07/25.
//
import SwiftUI

enum ImagemPerfilNomeFoguete: String, CaseIterable {
    case galatico 
    case austrico
    case meterito
    case lamanuto
    case lurico
    
    var image: Image {
        Image(self.rawValue)
    }
}
