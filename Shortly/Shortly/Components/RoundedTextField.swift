//
//  RoundedTextField.swift
//  Shortly
//
//  Created by Nedim Basic on 2. 9. 2021..
//

import SwiftUI

struct RoundedTextField: View {
    
    @Binding var value: String
    var placeholder = ""
    var errorText: String?
    
//    @State private var focused = false
    
    
    var body: some View {
        ZStack {
//            if !focused {
//                Text(getPlaceholder())
//                    .foregroundColor(errorText != nil ? Color.Red : Color.LightGray)
//            }
            
            TextField(
                getPlaceholder(),
                text: $value
//                ,
//                onEditingChanged: { changed in
//                    focused = changed
//                }
                
            )
            .multilineTextAlignment(.center)
            .frame(alignment: .center)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(
                        errorText != nil ? Color.Red : Color.clear,
                        lineWidth: 2)
            )
        }
        .background(Color.white)
        .cornerRadius(4)
    }
    
    private func getPlaceholder() -> String {
//        if focused {
//            return ""
//        }
        if errorText != nil {
            return errorText!
        }
        return placeholder
    }
}

struct RoundedTextField_Previews: PreviewProvider {
    static var previews: some View {
        RoundedTextField(value: .constant(""))
    }
}
