//
//  ContentView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 25/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    var body: some View {
        Group {
            if isLoggedIn {
                MainTabBarView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
