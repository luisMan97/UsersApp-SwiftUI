//
//  DatabaseManager.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import UIKit
import CoreData

class DatabaseManager {
        
    private var persistentContainer: NSPersistentContainer!
    
    var managedContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init() {
        saveAutomatically()
    }
    
    func prepare(modelName: String) {
        let container = NSPersistentContainer(name: modelName)
        persistentContainer = container
        container.loadPersistentStores { (storesDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    private func saveAutomatically() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification

        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            self.saveContext()
        }
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            try managedContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
}
