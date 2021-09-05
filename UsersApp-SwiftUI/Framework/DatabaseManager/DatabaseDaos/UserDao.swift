//
//  UserDao.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation
import CoreData

enum LoginErrors: Error {
    case badUsername
    case badPassword
}

class UserDao {
    
    private var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    // Create
    
    func saveUsers(_ users: [UserList.User.Domain]) throws {
        deleteUsers()
        
        users.forEach {
            let user = UserCoreData(context: managedContext)
            
            $0.toCoreDataUser(user)
        }
        try saveContext()
    }
    
    // Read
    
    func getUsers() throws -> [UserCoreData] {
        let fetchRequest: NSFetchRequest<UserCoreData> = UserCoreData.fetchRequest()
        
        do {
            let coreDataUsers = try managedContext.fetch(fetchRequest)
            
            return coreDataUsers
        } catch {
            throw error
        }
    }
    
    // Delete
    
    func deleteUsers() {
        let fetchRequest: NSFetchRequest<UserCoreData> = UserCoreData.fetchRequest()
        
        do {
            let coreDataUsers = try managedContext.fetch(fetchRequest)
            
            coreDataUsers.forEach {
                managedContext.delete($0)
            }
            
            try managedContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}

private extension UserDao {
    
    func saveContext() throws {
        do {
            try managedContext.save()
        } catch {
            throw error
        }
    }
    
}
