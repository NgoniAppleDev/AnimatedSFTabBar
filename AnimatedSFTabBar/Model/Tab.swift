//
//  Tab.swift
//  AnimatedSFTabBar
//
//  Created by Ngoni Katsidzira  on 7/4/2025.
//

import Foundation

/// Tab's
enum Tab: String, CaseIterable {
    case photos = "photo.stack"
    case chat = "bubble.left.and.text.bubble.right"
    case apps = "square.3.layers.3d"
    case notifications = "bell.and.waves.left.and.right"
    case profile = "person.2.crop.square.stack.fill"
    
    var title: String {
        switch self {
        case .photos:
            "Photos"
        case .chat:
            "Chat"
        case .apps:
            "Apps"
        case .notifications:
            "Notifications"
        case .profile:
            "Profile"
        }
    }
}

/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}








