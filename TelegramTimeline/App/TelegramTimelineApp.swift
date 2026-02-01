//
//  TelegramTimelineApp.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 26/12/23.
//

import SwiftUI

@main
struct TelegramTimelineApp: App {
    @StateObject private var tabCoordinator = TabCoordinator()
    var body: some Scene {
        WindowGroup {
            SwiftUIView()
                .environmentObject(tabCoordinator)
        }
    }
}
