//
//  EmptyListView.swift
//  Shortly
//
//  Created by Nedim Basic on 13. 9. 2021..
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 70)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 35)
            
            Spacer()
            
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Text("Let's get started!")
                .font(.shortlyTitle)
                .foregroundColor(Color.DarkViolet)
            
            Text("Paste your first link into the field to shorten it")
                .multilineTextAlignment(.center)
                .font(.shortlyText)
                .foregroundColor(Color.DarkViolet)
                .padding(.horizontal, 75)
            
            Spacer(minLength: 70)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.OffWhite)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
