//
//  RoundedButton.swift
//  Shortly
//
//  Created by Nedim Basic on 2. 9. 2021..
//

import SwiftUI

enum RoundedButtonState {
    case clicked
    case notClicked
}

struct RoundedButton: View {
    
    var action = {}
    var title = ""
    var clickedTitle: String? = nil
    var state: RoundedButtonState = .notClicked
    
    var body: some View {
        let backgroundColor = state == .clicked ? Color.DarkViolet : Color.Cyan
        
        Button(action: {
            if state == .notClicked {
                action()
            }
        }) {
            Text(getButtonTitle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .textCase(.uppercase)
                .accentColor(Color.white)
                .font(.shortlyButtonTitle)
        }
        .background(backgroundColor)
        .cornerRadius(3)
    }
    
    private func getButtonTitle() -> String {
        if state == .clicked && clickedTitle != nil {
            return clickedTitle!
        }
        return title
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Title")
            .frame(height: 40)
    }
}
