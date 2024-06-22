//
//  AnimatedTextView.swift
//  TimeLapse
//
//  Created by Didier Delhaisse on 22/06/2024.
//

import SwiftUI
import QuartzCore // Not required to import explicitly

/* UIViewRepresentable is to bridge between SwiftUI and CoreAnimation.
 
 In a Swift project, CoreAnimation is part of the QuartzCore framework.
 While you don't need to import explicitly in most cases when working within SwiftUI
 and UIRepresentable (because these frameworks already import necessary components), it's
 good practices to import QuartzCore directly when you are dealing with specific CoreAnimation features.
 CATransition() class and other CoreAnimation features are part of QuartzCore framework.
 
 */

struct AnimatedTextView: UIViewRepresentable {
    var text: String
    
    class Coordinator: NSObject {
        var lastText = ""
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 80, weight: .bold)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if context.coordinator.lastText != text {
            UIView.transition(with: uiView, duration: 0.2, options: .transitionCrossDissolve) {
                uiView.text = text
            }
            context.coordinator.lastText = text
        }
    }
}
