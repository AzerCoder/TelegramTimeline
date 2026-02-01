//
//  CoordinatorPages.swift
//  SwiftUICoordinator
//
//  Created by A'zamjon Abdumuxtorov on 24/06/25.
//

import SwiftUI

enum ChatPages:Coordinatable {
    
    var id: Self { self }
    
    case root
    case chatDetails
    case addStory
    case newMessage
    
    @ViewBuilder
    var body: some View{
        switch self {
        case .root:
            ChatView()
        case .chatDetails:
            EmptyView()
        case .addStory:
            EmptyView()
        case .newMessage:
            EmptyView()
        }
    }
}


enum SettingsPages: Coordinatable {
    var id: Self { self }
    
    case root
    case showQrcode
    case myProfile
    case wallet
    case savedMessages
    
    @ViewBuilder
    var body: some View{
        switch self {
        case .root:
            SettingView()
        case .showQrcode:
            EmptyView()
        case .myProfile:
            EmptyView()
        case .wallet:
            EmptyView()
        case .savedMessages:
            EmptyView()
        }
    }
}

enum ContactPages: Coordinatable {
    var id: Self { self }
    
    case root
    case addContact
    case contactDetails
    
    @ViewBuilder
    var body: some View{
        switch self {
        case .root:
            ContactView()
        case .addContact:
            EmptyView()
        case .contactDetails:
            EmptyView()
        }
    }
}





