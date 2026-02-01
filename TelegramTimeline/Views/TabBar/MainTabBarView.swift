//
//  HomeView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 29/09/24.
//

import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var tabCoordinator : TabCoordinator
    var body: some View {
        TabView(selection: $tabCoordinator.selectedTab) {
            CoordinatorStack(ContactPages.root)
                .tabItem{Label(AppTab.contact.name, systemImage: AppTab.contact.image)}
                .tag(AppTab.contact)
            
            CoordinatorStack(ChatPages.root)
                .tabItem{Label(AppTab.chat.name, systemImage: AppTab.chat.image)}
                .tag(AppTab.chat)
            
            CoordinatorStack(SettingsPages.root)
                .tabItem{Label(AppTab.settings.name, systemImage: AppTab.settings.image)}
                .tag(AppTab.settings)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainTabBarView()
}
