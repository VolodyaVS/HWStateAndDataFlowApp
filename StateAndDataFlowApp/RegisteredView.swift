//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            UserDefaults.standard.set(name, forKey: "UserName")
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
