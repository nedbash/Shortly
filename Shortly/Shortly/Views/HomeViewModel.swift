//
//  HomeViewVM.swift
//  Shortly
//
//  Created by Nedim Basic on 8. 9. 2021..
//

import Foundation
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var enteredUrl = ""
    @Published var errorText: String? 
    @Published var hasError = false
    @Published var inProgress = false
    @Published var copiedItemId: NSManagedObjectID?

    @Published var historyItems: [LinkItem] = []
    
    func shorten(url: String) {
        hasError = false
        inProgress = true
        
        RequestHandler.requestShortening(url: enteredUrl) { result in
            self.inProgress = false
            
            switch result {
            case .success(let shortUrl):
                self.handleSucess(url: url, shortUrl: shortUrl)
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    func deleteItem(atIndex index: Int) {
        let linkItem = historyItems[index]
        Persistance.shared.delete(item: linkItem)
        historyItems.remove(at: index)
    }
    
    func fetchData() {
        inProgress = true
        historyItems = Persistance.shared.get()
        inProgress = false
    }
    
    private func handleSucess(url: String, shortUrl: String) {
        enteredUrl = ""
        let linkItem = Persistance.shared.save(longUrl: url, shortUrl: shortUrl)
        self.historyItems.append(linkItem)
    }
    
    private func handleError(error: ShortError) {
        hasError = true
        enteredUrl = ""
        switch error {
        case .empty:
            errorText = "Please add a link here"
        case .invalidUrl:
            errorText = "The entered URL seems to be invalid"
        case .serverError:
            errorText = "Error, check url and try again"
        }
    }
}
