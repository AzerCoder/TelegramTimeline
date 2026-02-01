//
//  CoordinatorStack.swift
//  SwiftUICoordinator
//
//  Created by A'zamjon Abdumuxtorov on 24/06/25.
//

import SwiftUI

struct CoordinatorStack<CoordinatorPage:Coordinatable>: View {
    
    let root:CoordinatorPage
    
    init(_ root: CoordinatorPage) {
        self.root = root
    }
    
    @StateObject private var coordinator = NavCoordinator<CoordinatorPage>()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            root
                .navigationDestination(for: CoordinatorPage.self) { $0 }
                .sheet(item: $coordinator.sheet) { $0 }
                .fullScreenCover(item: $coordinator.fullScreen) { $0 }
        }
        .environmentObject(coordinator)
    }
}

