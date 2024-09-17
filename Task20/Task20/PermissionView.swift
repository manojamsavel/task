//
//  PermissionView.swift
//  Task20
//
//  Created by Arun Skyraan on 17/09/24.
//

import SwiftUI

struct PermissionView: View {
    @ObservedObject var permissionManager = PermissionManager()
    
    var body: some View {
        VStack {
            if permissionManager.hasContactsAccess {
                Text("Access to Contacts Granted")
            } else {
                Button("Request Contacts Access") {
                    permissionManager.requestContactsPermission()
                }
            }
        }
    }
}

#Preview {
    PermissionView()
}
