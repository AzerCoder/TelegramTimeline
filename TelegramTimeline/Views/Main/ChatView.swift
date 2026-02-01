//
//  ContentView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

// MARK: - Main Chat View
struct ChatView: View {
    @State private var selectedTab: ChatType = .all
    @State private var offset: CGFloat = 0
    @State private var editMode: EditMode = .inactive
 
    var body: some View {
        VStack(spacing: 0) {
            
            SegmentControl(selectedTab: $selectedTab)
            
            GeometryReader { geometry in
                ZStack {
                    ForEach(ChatType.allCases, id: \.self) { chatType in
                        TabContentView(
                            selectedTab: $selectedTab,
                            offset: $offset,
                            editMode: $editMode,
                            chatType: chatType,
                            width: geometry.size.width
                        )
                        
                    }
                }
                
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    editMode = editMode.isEditing ? .inactive : .active
                } label: {
                    Text(editMode.isEditing ? "Done" : "Edit")
                }

            }
            
            ToolbarItem(placement: .principal) {
                Text("Chats")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                   
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    
    }
}

