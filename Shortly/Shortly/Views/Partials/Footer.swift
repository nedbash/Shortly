//
//  Footer.swift
//  Shortly
//
//  Created by Nedim Basic on 13. 9. 2021..
//

import SwiftUI

struct Footer: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        VStack(spacing: 10) {
            RoundedTextField(
                value: $viewModel.enteredUrl,
                placeholder: "Shorten a link here ...",
                errorText: viewModel.errorText
            )
                
            RoundedButton(
                action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    viewModel.shorten(url: viewModel.enteredUrl)
                },
                title: "SHORTEN IT!"
            )
            .frame(height: 50)
        }
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(
            Image("footerBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 260, height: 130, alignment: .topTrailing)
            ,
            alignment: .topTrailing)
        .background(Color.DarkViolet)
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
