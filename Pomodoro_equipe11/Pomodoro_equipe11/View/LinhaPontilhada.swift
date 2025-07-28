//
//  LinhaPontilhada.swift
//  Pomodoro_equipe11
//
//  Created by Eliardo Venancio on 21/07/25.
//
import SwiftUI

struct LinhaPontilhada: View {
    var pontos: [CGPoint]
    
    var body: some View {
        Canvas { context, size in
            let pontosValidos = pontos.filter { $0 != .zero }
            guard pontosValidos.count > 1 else { return }
            var path = Path()
            
            path.move(to: pontosValidos[0])
            
            for i in 1..<pontosValidos.count {
                path.addLine(to: pontosValidos[i])
            }
            
            context.stroke(
                path,
                with: .color(.white),
                style: StrokeStyle(lineWidth: 10, dash: [20, 19])
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
