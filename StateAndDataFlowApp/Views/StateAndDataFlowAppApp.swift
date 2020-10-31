//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
