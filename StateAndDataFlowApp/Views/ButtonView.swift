//
//  ButtonView.swift
//  StateAndDataFlowApp
//
//  Created by Vladimir Stepanchikov on 25.10.2020.
//

import SwiftUI

struct ButtonView: View {
    @Binding var isRegistered: Bool
    @Binding var userName: String
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color)
    }
    
    init(title: String, color: Color, isRegistered: Binding<Bool> = .constant(false), userName: Binding<String> = .constant(""), action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self._isRegistered = isRegistered
        self._userName = userName
        self.action = action
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "button", color: .black, action: {})
    }
}
