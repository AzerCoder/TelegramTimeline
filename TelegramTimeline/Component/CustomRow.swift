//
//  CustomRow.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 22/01/26.
//

import SwiftUI

// MARK: - Custom Row
struct CustomRow: View {
    @Binding var selectedTab: ChatType
    @Binding var offset: CGFloat
    let index: Int
    
    @GestureState private var dragState = DragState.inactive
    
    private let rowHeight: CGFloat = 70
    private let sideWidth: CGFloat = 50
    private let swipeThreshold: CGFloat = 100.0
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // Leading side
            Rectangle()
                .fill(.red)
                .frame(width: sideWidth, height: rowHeight)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        print("Edit - Row \(index)")
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
            
            // Main content with drag gesture
            Rectangle()
                .fill(.blue)
                .frame(height: rowHeight)
                .frame(maxWidth: .infinity)
                .overlay(
                    Text("Row \(index)")
                        .foregroundColor(.white)
                )
                .highPriorityGesture(
                    createDragGesture()
                )
            
            // Trailing side
            Rectangle()
                .fill(.red)
                .frame(width: sideWidth, height: rowHeight)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        print("Delete - Row \(index)")
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                    
                    Button {
                        print("Edit - Row \(index)")
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .tint(.orange)
                }
        }
    }
    
    // MARK: - Drag Gesture
    private func createDragGesture() -> some Gesture {
        DragGesture(minimumDistance: 20, coordinateSpace: .global)
            .updating($dragState) { value, state, _ in
                // Horizontal yoki vertical harakatni aniqlash
                let horizontalDistance = abs(value.translation.width)
                let verticalDistance = abs(value.translation.height)
                
                // Agar horizontal harakat vertical dan ancha katta bo'lsa
                if horizontalDistance > verticalDistance * 1.5 {
                    state = .dragging(translation: value.translation)
                    handleDragChanged(value)
                }
            }
            .onEnded { value in
                let horizontalDistance = abs(value.translation.width)
                let verticalDistance = abs(value.translation.height)
                
                // Faqat horizontal drag bo'lgan bo'lsa handleEnded ni chaqirish
                if horizontalDistance > verticalDistance * 1.5 {
                    handleDragEnded(value)
                }
            }
    }
    
    private func handleDragChanged(_ value: DragGesture.Value) {
        let translation = value.translation.width
        
        // Chegaralarni tekshirish
        let canSwipeLeft = translation < 0 && !selectedTab.isLast
        let canSwipeRight = translation > 0 && !selectedTab.isFirst
        
        if canSwipeLeft || canSwipeRight {
            offset = translation
        }
    }
    
    private func handleDragEnded(_ value: DragGesture.Value) {
        let dragAmount = value.translation.width
        
        // Tab o'zgartirish
        if dragAmount < -swipeThreshold, let nextTab = selectedTab.next {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                selectedTab = nextTab
            }
        } else if dragAmount > swipeThreshold, let previousTab = selectedTab.previous {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                selectedTab = previousTab
            }
        }
        
        // Offset ni reset qilish
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            offset = 0
        }
    }
}
