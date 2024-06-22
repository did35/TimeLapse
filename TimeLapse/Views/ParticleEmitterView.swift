//
//  ParticleEmitterView.swift
//  TimeLapse
//
//  Created by Didier Delhaisse on 22/06/2024.
//

import SwiftUI
import QuartzCore

struct ParticleEmitterView: UIViewRepresentable {
    var isActive: Bool
    
    class Coordinator: NSObject {
        var emitterLayer: CAEmitterLayer?
        
        func setupEmitter(in view: UIView) {
            let emitterLayer = CAEmitterLayer()
            emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10)
            emitterLayer.emitterShape = .line
            emitterLayer.emitterSize = CGSize(width: view.bounds.size.width, height: 1)
            emitterLayer.emitterCells = [createEmitterCell()]
            
            view.layer.addSublayer(emitterLayer)
            self.emitterLayer = emitterLayer
        }
        
        private func createEmitterCell() -> CAEmitterCell {
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: "particle")?.cgImage
            cell.birthRate = 100
            cell.lifetime = 5.0
            cell.velocity = 50
            cell.velocityRange = 20
            //cell.emissionLongitude = .pi
            cell.emissionRange = .pi
            cell.scale = 0.1
            cell.scaleRange = 0.02
            return cell
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = TouchTransparentView()
        view.isUserInteractionEnabled = false
        context.coordinator.setupEmitter(in: view)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.emitterLayer?.birthRate = isActive ? 1 : 0
    }
}

class TouchTransparentView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let coordinator = (superview?.next as? ParticleEmitterView)?.makeCoordinator() {
            coordinator.setupEmitter(in: self)
        }
    }
}



