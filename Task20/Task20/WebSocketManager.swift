//
//  WebSocketManager.swift
//  Task20
//
//  Created by Arun Skyraan on 17/09/24.
//

import Foundation

class WebSocketManager: ObservableObject {
    @Published var receivedMessage: String = ""
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connectWebSocket() {
        guard let url = URL(string: "ws://localhost:8080") else { return }
        let session = URLSession(configuration: .default)
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        receiveMessage()
    }
    
    func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    DispatchQueue.main.async {
                        self?.receivedMessage = text
                    }
                case .data(let data):
                    DispatchQueue.main.async {
                        self?.receivedMessage = "Received binary data: \(data)"
                    }
                @unknown default:
                    break
                }
            case .failure(let error):
                print("WebSocket error: \(error)")
            }
            self?.receiveMessage() // Continue receiving messages
        }
    }
    
    func sendMessage(message: String) {
        webSocketTask?.send(.string(message)) { error in
            if let error = error {
                print("WebSocket send error: \(error)")
            }
        }
    }

    func disconnectWebSocket() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}
