//
//  ScrollViewCoordinator.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 24/01/26.
//

import SwiftUI

// UIScrollView Coordinator
class ScrollViewCoordinator: NSObject, UIScrollViewDelegate {
    var scrollOffset: Binding<CGFloat>
    
    init(scrollOffset: Binding<CGFloat>) {
        self.scrollOffset = scrollOffset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        withAnimation {
            scrollOffset.wrappedValue = scrollView.contentOffset.y
        }
    }
}

// Custom ScrollView with offset tracking
struct TrackableScrollView<Content: View>: UIViewRepresentable {
    let content: Content
    @Binding var scrollOffset: CGFloat
    
    init(scrollOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._scrollOffset = scrollOffset
        self.content = content()
    }
    
    func makeCoordinator() -> ScrollViewCoordinator {
        ScrollViewCoordinator(scrollOffset: $scrollOffset)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = UIColor.systemGroupedBackground
        
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostingController.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
}
