//
//  AppTab.swift
//  TelegramTimeline
//
//  Created by A'zamjon Abdumuxtorov on 10/01/26.
//

import SwiftUI

extension AppTab {
    var name: String {
        switch self {
        case .contact:
            return "Contacts"
        case .chat:
            return "Chats"
        case .settings:
            return "Settings"
        }
    }
    
    var image:String{
        switch self {
        case .contact:
            return "person.circle"
        case .chat:
            return "message"
        case .settings:
            return "gear.circle"
        }
    }
}
