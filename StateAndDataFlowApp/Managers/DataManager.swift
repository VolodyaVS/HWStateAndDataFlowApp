//
//  DataManager.swift
//  StateAndDataFlowApp
//
//  Created by Vladimir Stepanchikov on 30.10.2020.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData = Data()
    
    private init() {}
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        self.userData = userData
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        UserDefaults.standard.removeObject(forKey: "user")
    }
    
}
