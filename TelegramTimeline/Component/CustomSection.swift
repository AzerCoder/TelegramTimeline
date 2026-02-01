//
//  CustomSection.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 24/01/26.
//

import SwiftUI

struct CustomSection: View {
    let content: [AnyView]
    init(@ViewArrayBuilder content: () -> [AnyView]) { self.content = content() }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<content.count, id: \.self) { index in
                content[index]
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.secondarySystemGroupedBackground))
                if index < content.count - 1 {
                    Divider().padding(.leading, 50)
                }
            }
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}


@resultBuilder
struct ViewArrayBuilder {
    static func buildBlock(_ components: AnyView...) -> [AnyView] { return components }
    static func buildExpression<Content: View>(_ content: Content) -> AnyView { return AnyView(content) }
}

