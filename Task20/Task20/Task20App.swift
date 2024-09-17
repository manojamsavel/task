//
//  Task20App.swift
//  Task20
//
//  Created by Arun Skyraan on 17/09/24.
//

import SwiftUI

@main
struct Task20App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    PermissionView()
                    Divider().padding()
                    WebSocketView()
                }
                .navigationTitle("WebSocket & Contacts")
            }
        }
    }
}
