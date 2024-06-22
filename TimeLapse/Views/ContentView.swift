//
//  ContentView.swift
//  TimeLapse
//
//  Created by Didier Delhaisse on 22/06/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @StateObject private var vm = ContentViewModel()
    @State private var particleIsActive = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .cyan, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                Spacer()
                AnimatedTextView(text: String(format: "%.2f", vm.elapsedSeconds))
                    .frame(width: 200, height: 200)
                    .padding()
                Spacer()
                HStack(spacing: 20) {
                    buttonLeft
                    buttonRight
                }
                .padding()
                Spacer()
            }
            ParticleEmitterView(isActive: particleIsActive)
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

// MARK: - Extension
extension ContentView {
    var buttonLeft: some View {
        Button(action: {
            vm.startStop()
            particleIsActive = vm.isRunning
        }) {
            Text(vm.isRunning ? "Stop": "Start")
                .frame(width: 68, height: 30)
                .padding()
                .background(vm.isRunning ? Color.red: Color.green)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
        }
    }
    
    var buttonRight: some View {
        Button(action: {
            vm.reset()
            particleIsActive = false
        }) {
            Text("Reset")
                .frame(width: 68, height: 30)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
        }
    }
}
