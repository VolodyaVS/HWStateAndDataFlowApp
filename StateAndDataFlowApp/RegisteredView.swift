//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//  Modified by Vladimir Stepanchikov on 25.10.2020.

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(changeColorTF(name.count))
                    .padding()
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(disableButton())
        }
    }
}

extension RegisteredView {
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            UserDefaults.standard.set(true, forKey: "Register")
            UserDefaults.standard.set(name, forKey: "UserName")
        }
    }
    
    private func changeColorTF(_ count: Int) -> Color {
        let color = name.count > 2 ? Color.green : Color.red
        return color
    }
    
    private func disableButton() -> Bool {
        let hidden = name.count < 3 ? true : false
        return hidden
    }
    
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
