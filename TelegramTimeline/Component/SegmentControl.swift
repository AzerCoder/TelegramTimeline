//
//  Royhat.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

// MARK: - ChatType Enum
enum ChatType: Int, CaseIterable {
    case all = 0
    case personal = 1
    case groups = 2
    case channels = 3
    case bots = 4
    
    var name: String {
        switch self {
        case .all: return "All"
        case .personal: return "Personal"
        case .groups: return "Groups"
        case .channels: return "Channels"
        case .bots: return "Bots"
        }
    }
    
    var index: Int {
        return self.rawValue
    }
    
    var next: ChatType? {
        let nextIndex = self.index + 1
        return ChatType(rawValue: nextIndex)
    }
    
    var previous: ChatType? {
        let previousIndex = self.index - 1
        return ChatType(rawValue: previousIndex)
    }
    
    var isLast: Bool {
        return self == ChatType.allCases.last
    }
    
    var isFirst: Bool {
        return self == ChatType.allCases.first
    }
    
    static var count: Int {
        return ChatType.allCases.count
    }
}


struct SegmentControl: View {
    @Binding var selectedTab: ChatType
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(ChatType.allCases,id: \.self) { chat in
                    VStack(spacing: 2) {
                        Text(chat.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedTab == chat ? .blue : .gray)
                        
                        ZStack {
                            if selectedTab == chat {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.blue)
                                    .frame(height: 3)
                                    .matchedGeometryEffect(id: "UNDERLINE", in: animation)
                            } else {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.clear)
                                    .frame(height: 3)
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedTab = chat
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 34)
        .background{
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SegmentControl(selectedTab: .constant(ChatType.all))
}

