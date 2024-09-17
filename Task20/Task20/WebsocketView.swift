//
//  WebsocketView.swift
//  Task20
//
//  Created by Arun Skyraan on 17/09/24.
//

import SwiftUI

struct WebSocketView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    
    var body: some View {
        VStack {
            Text("Received Message:")
                .font(.headline)
            Text(webSocketManager.receivedMessage)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()

            Button("Connect to WebSocket") {
                webSocketManager.connectWebSocket()
            }
            .padding()

            Button("Send Message") {
                webSocketManager.sendMessage(message: "Hello from SwiftUI!")
            }
            .padding()

            Button("Disconnect WebSocket") {
                webSocketManager.disconnectWebSocket()
            }
            .padding()
        }
        .onAppear {
            webSocketManager.connectWebSocket()
        }
    }
}

#Preview {
    WebSocketView()
}
