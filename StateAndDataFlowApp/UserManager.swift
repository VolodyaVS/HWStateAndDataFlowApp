//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//  Modified by Vladimir Stepanchikov on 25.10.2020.

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegister = UserDefaults.standard.value(forKey: "Register") as? Bool ?? false
    
    var name = UserDefaults.standard.value(forKey: "UserName") as? String ?? ""
}
