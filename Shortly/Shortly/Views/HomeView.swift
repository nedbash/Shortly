//
//  ContentView.swift
//  Shortly
//
//  Created by Nedim Basic on 2. 9. 2021..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                if (viewModel.historyItems.count == 0) {
                    EmptyListView()
                }
                else {
                    HistoryItemsListView()
                }
                Footer()
            }
            .disabled(viewModel.inProgress)
            
            if(viewModel.inProgress) {
                ProgressView("Please wait..")
                    .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(30)
            }
        }
        .onAppear(perform: {
            viewModel.fetchData()
        })
        .environmentObject(viewModel)
        .ignoresSafeArea(.container, edges: .all)
    }
}

struct HistoryItemsListView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 50)
            
            Text("Your Link History")
                .font(.shortlySubtitle)
                .padding(.vertical, 20)
            
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(
                            Array(viewModel.historyItems.enumerated()),
                            id: \.1.objectID
                        ) { (index, item) in
                            
                            HistoryItemCell(
                                item: item,
                                isCopied: viewModel.copiedItemId == item.objectID,
                                onDelete: {
                                    viewModel.deleteItem(atIndex: index)
                                },
                                onCopy: {
                                    UIPasteboard.general.string = item.shortUrl
                                    viewModel.copiedItemId = item.objectID
                                }
                            )
                            .padding(.horizontal, 25)
                        }
                    }
                    .padding(.bottom, 50)
                }
                Image("fadeBorder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color.OffWhite)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPhone 12 Pro")
            HomeView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
