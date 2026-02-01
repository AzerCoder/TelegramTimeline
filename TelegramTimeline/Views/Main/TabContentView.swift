//
//  TabContentView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 22/01/26.
//

import SwiftUI

// MARK: - Tab Content View
struct TabContentView: View {
    @Binding var selectedTab: ChatType
    @Binding var offset: CGFloat
    @Binding var editMode: EditMode
    
    let chatType: ChatType
    let width: CGFloat
    
    var body: some View {
        List {
            ForEach(0..<20, id: \.self) { index in
                CustomRow(
                    selectedTab: $selectedTab,
                    offset: $offset,
                    index: index
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
        }
        .environment(\.editMode, $editMode)
        .listStyle(.plain)
        .frame(width: width)
        .offset(x: CGFloat(chatType.index - selectedTab.index) * width + offset)
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: selectedTab)
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: offset)
    }
}
