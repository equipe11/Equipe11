//
//  Planeta.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 16/07/25.
//

import SwiftUI

enum Planeta: String, CaseIterable {
    
    case lazu
    case marzuno
    case nanu
    case netaziro
    case plutido
    case urion
    case velanuzano
    
    var image: Image {
        Image(self.rawValue)
    }
}
