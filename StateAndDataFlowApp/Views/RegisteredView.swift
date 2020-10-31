//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//  Modified by Vladimir Stepanchikov on 25.10.2020.

import SwiftUI

struct RegisteredView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            UserNameTF(name: $userManager.user.name, nameIsValid: userManager.nameIsValid)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
}

extension RegisteredView {
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered = true
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct UserNameTF: View {
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Text("\(name.count)")
                .foregroundColor(nameIsValid ? .green : .red)
                .padding()
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
