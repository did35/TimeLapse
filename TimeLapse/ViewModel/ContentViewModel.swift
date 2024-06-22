//
//  ContentViewModel.swift
//  TimeLapse
//
//  Created by Didier Delhaisse on 22/06/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var isRunning = false
    @Published var elapsedSeconds: Double = 0.0
    
    private var timer: Timer?
    
    func startStop() {
        isRunning.toggle()
        if isRunning {
            startTimer()
        } else {
            stopTimer()
        }
    }
    
    func reset() {
        elapsedSeconds = 0.0
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            self?.elapsedSeconds += 0.01
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
