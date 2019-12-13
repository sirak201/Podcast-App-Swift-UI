//
//  ProgressBar.swift
//  Podcast
//
//  Created by Sirak on 12/12/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation
import SwiftUI
class AnimationListen  : ObservableObject {
    @Published var startAnimation = false
}

struct ProgressCircle : View {
    
    @ObservedObject var startAnimation : AnimationListen


    var body : some View {
        
        GeometryReader {
            geometry in
            Path {
                path in
                path.addArc(center: .init(x: geometry.size.width / 2, y:  geometry.size.height / 2), radius: geometry.size.width / 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
            }
            .trim(from: self.startAnimation.startAnimation ? 1/0.99 : 0, to: self.startAnimation.startAnimation ? 1/0.99 : 1)
            .stroke(lineWidth: 2.5)
            .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
            
            
        }

            
        }
    
}
    
    
