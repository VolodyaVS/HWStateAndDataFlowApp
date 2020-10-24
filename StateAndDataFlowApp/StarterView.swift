//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            
            if user.isRegister {
//            if let userName = UserDefaults.standard.value(forKey: "UserName")
                ContentView()
//                user.name = userName as! String
            } else {
                RegisteredView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
