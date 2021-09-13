//
//  Persistance.swift
//  Shortly
//
//  Created by Nedim Basic on 13. 9. 2021..
//

import CoreData

struct Persistance {
    
    static let shared = Persistance()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "PersistanceModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error creating persistant container: \(error.localizedDescription)")
            }
        }
    }
    
    func save(longUrl: String, shortUrl: String) -> LinkItem {
        let entity = LinkItem(context: container.viewContext)
        entity.longUrl = longUrl
        entity.shortUrl = shortUrl
        
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
        return entity
    }
    
    func get() -> [LinkItem] {
        
        let fetchRequest: NSFetchRequest<LinkItem> = LinkItem.fetchRequest()
        
        guard let linkItems = try? container.viewContext.fetch(fetchRequest) else {
            return []
        }
        
        return linkItems
    }
    
    func delete(item: LinkItem) {
        container.viewContext.delete(item)
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func getMockItem() -> LinkItem {
        let entity = LinkItem(context: container.viewContext)
        entity.longUrl = "Mock url"
        entity.shortUrl = "Mock short  URL"
        return entity
    }
}
