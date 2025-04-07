//
//  Home.swift
//  AnimatedSFTabBar
//
//  Created by Ngoni Katsidzira  on 7/4/2025.
//

import SwiftUI

struct Home: View {
    /// View properties
    @State private var activeTab: Tab = .photos
    
    /// All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                /// Your TAB Views
                
                /// First View
                NavigationStack {
                    ContentUnavailableView {
                        Label("Photos", systemImage: "photo.stack.fill")
                    }
                    .navigationTitle(Tab.photos.title)
                }
                .setupTab(.photos)
                
                /// Second View
                NavigationStack {
                    ContentUnavailableView {
                        Label("Chat", systemImage: "bubble.left.and.text.bubble.right")
                    }
                    .navigationTitle(Tab.chat.title)
                }
                .setupTab(.chat)
                
                /// Third View
                NavigationStack {
                    ContentUnavailableView {
                        Label("Apps", systemImage: "square.stack.3d.up")
                    }
                    .navigationTitle(Tab.apps.title)
                }
                .setupTab(.apps)
                
                /// Fourth View
                NavigationStack {
                    ContentUnavailableView {
                        Label("Notifications", systemImage: "bell.and.waves.left.and.right")
                    }
                    .navigationTitle(Tab.notifications.title)
                }
                .setupTab(.notifications)
                
                /// Fifth View
                NavigationStack {
                    ContentUnavailableView {
                        Label("Profile", systemImage: "person.2.crop.square.stack.fill")
                    }
                    .navigationTitle(Tab.profile.title)
                }
                .setupTab(.profile)
            }
            
            CustomTabBar()
        }
    }
    
    /// Custom Tab Bar
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.down.byLayer, options: .nonRepeating, value: animatedTab.isAnimating)
                    
                    Text(tab.title)
                        .font(.caption)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                /// You can also choose to use Button if you want.
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    } completion: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            animatedTab.isAnimating = nil
                        }
                    }
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func setupTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}







