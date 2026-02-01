//
//  TabCoordinator.swift
//  UzWorksV2
//
//  Created by A'zamjon Abdumuxtorov on 26/12/25.
//

import SwiftUI
import Combine

enum AppTab: CaseIterable {
    case contact
    case chat
    case settings
}

class TabCoordinator: ObservableObject {
    
    @Published var selectedTab: AppTab = .chat
    @Published var isHidden: Bool = false
    
    // Each tab has its own coordinator
    let chatsCoordinator = NavCoordinator<ChatPages>()
    let settingsCoordinator = NavCoordinator<SettingsPages>()
    let contactCoordinator = NavCoordinator<ContactPages>()
    
    func switchTab(to tab: AppTab) {
        selectedTab = tab
    }
    
    func resetTab(_ tab: AppTab) {
        switch tab {
        case .contact:
            contactCoordinator.popToRoot()
        case .chat:
            chatsCoordinator.popToRoot()
        case .settings:
            settingsCoordinator.popToRoot()
        }
    }
}
