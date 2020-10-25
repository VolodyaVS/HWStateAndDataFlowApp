//
//  ButtonView.swift
//  StateAndDataFlowApp
//
//  Created by Vladimir Stepanchikov on 25.10.2020.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack(spacing: 100) {
            Button(action: { timer.startTimer() }) {
                Text("\(timer.buttonTitle)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(Color.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
            
            Button(action: deleteUser) {
                Text("Log Out")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
        }
    }
}

extension ButtonView {
    private func deleteUser() {
        user.name = ""
        user.isRegister = false
        UserDefaults.standard.set(false, forKey: "Register")
        UserDefaults.standard.removeObject(forKey: "UserName")
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(timer: TimeCounter())
    }
}
