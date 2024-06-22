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
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .cyan, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                AnimatedTextView(text: String(format: "%.2f", vm.elapsedSeconds))
                    .frame(width: 200, height: 200)
                
                HStack(spacing: 20) {
                    Button(action: {vm.startStop()}) {
                        Text(vm.isRunning ? "Stop": "Start")
                            .padding()
                            .background(vm.isRunning ? Color.red: Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button(action: {vm.reset()}) {
                        Text("Reset")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
