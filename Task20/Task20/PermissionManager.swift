//
//  PermissionManager.swift
//  Task20
//
//  Created by Arun Skyraan on 17/09/24.
//

import Foundation
import Contacts

class PermissionManager: ObservableObject {
    @Published var hasContactsAccess = false
    
    func requestContactsPermission() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { [weak self] granted, error in
            DispatchQueue.main.async {
                self?.hasContactsAccess = granted
            }
        }
    }
}
