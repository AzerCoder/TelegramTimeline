//
//  HomeView.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 29/09/24.
//

import SwiftUI

struct HomeView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var selection = 1
    var body: some View {
        TabView(selection:$selection){
            NavigationView {
                ContactView(selection: $selection)
            }
            .tag(0)
            
            NavigationView {
                ContentView(selection: $selection)
            }
            .tag(1)
            NavigationView {
                SettingView(selection: $selection)
            }
            .tag(2)
            
        }
        
    }
}

#Preview {
    HomeView()
}
