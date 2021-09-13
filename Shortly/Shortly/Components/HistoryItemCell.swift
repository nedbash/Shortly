//
//  HistoryItemCell.swift
//  Shortly
//
//  Created by Nedim Basic on 8. 9. 2021..
//

import SwiftUI

struct HistoryItemCell: View {

    var item: LinkItem
    var isCopied = false
    var onDelete: () -> Void = {}
    var onCopy: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(item.longUrl ?? "")
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.shortlyCellText)
                    .foregroundColor(Color.DarkViolet)
                    .padding(.leading, 20)
                Spacer()
                Button( action: {
                    onDelete()
                }) {
                    Image("delete")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                    
                }
                .padding(.horizontal, 23)
                .padding(.bottom, 15)
                .padding(.top, 23)
            }
            
            Divider()
                .background(Color.LightGray)
            HStack {
                Text(item.shortUrl ?? "")
                    .font(.shortlyCellText)
                    .foregroundColor(Color.Cyan)
            }
            .padding(.horizontal, 23)
            .padding(.top, 12)
            
            RoundedButton(
                action: {
                    onCopy()
                },
                title: "COPY",
                clickedTitle: "COPIED!",
                state: isCopied ? .clicked : .notClicked
            )
            .frame(height: 40)
            .padding(23)
        }
        .frame(maxWidth: .infinity)
        .background(Color.White)
        .cornerRadius(8)
    }
}

struct HistoryItemCell_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItemCell(item: Persistance.shared.getMockItem())
            .previewLayout(.fixed(width: 370.0, height: 250.0))
    }
}
