//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//  Modified by Vladimir Stepanchikov on 25.10.2020.

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack(spacing: 100) {
            Text("Hi, \(userManager.user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                Spacer()
                ButtonView(
                    title: "Log out",
                    color: .blue,
                    isRegistered: $userManager.user.isRegistered,
                    userName: $userManager.user.name) {
                    DataManager.shared.clear(userManager: userManager)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

