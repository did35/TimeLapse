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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(vm.someText)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
