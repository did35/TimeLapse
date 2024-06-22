//
//  TestImageView.swift
//  TimeLapse
//
//  Created by Didier Delhaisse on 22/06/2024.
//

import SwiftUI

struct TestImageView: View {
    var body: some View {
        VStack {
            if let image = UIImage(named: "particle") {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 50, height: 50)
            } else {
                Text("Image not found")
            }
        }
    }
}

#Preview {
    TestImageView()
}
