//
//  Arrow.swift
//  nobullshit
//
//  Created by Breno R R on 31/05/2024.
//

import SwiftUI

struct ThinArrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let centerX = rect.midX
        let topY = rect.minY
        let bottomY = rect.maxY - 200
        
        // Arrow line with curves
        path.move(to: CGPoint(x: centerX, y: topY))
        path.addCurve(to: CGPoint(x: centerX, y: bottomY - 20),
                      control1: CGPoint(x: centerX + 30, y: (topY + bottomY) / 3),
                      control2: CGPoint(x: centerX - 30, y: 2 * (topY + bottomY) / 3))
        
//        // Arrow head
//        path.move(to: CGPoint(x: centerX - 5, y: bottomY - 20))
//        path.addLine(to: CGPoint(x: centerX, y: bottomY))
//        path.addLine(to: CGPoint(x: centerX + 5, y: bottomY - 20))
        
        return path
    }
}
