//
//  SwiftUIView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 25/01/26.
//

import SwiftUI

struct SwiftUIView: View {
    private let columns = [
        GridItem(.fixed(UIScreen.main.bounds.width)),
        GridItem(.fixed(UIScreen.main.bounds.width)),
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 100)
                        .overlay(
                            Text("Item \(index)")
                                .foregroundColor(.white)
                        )
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
