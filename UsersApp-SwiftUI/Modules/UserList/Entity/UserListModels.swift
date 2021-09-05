//
//  UserListModels.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation

enum UserList {
    
    enum User {
        
        struct Request {
            
        }
        
        struct Response: Decodable {
            let id: Int?
            let name: String?
            let phone: String?
            let email: String?
        }
        
        struct Domain: Equatable, Identifiable {
            let id: Int
            let name: String
            let phone: String
            let email: String
        }
        
    }
    
}

extension UserList.User.Response {
    
    func toDomain() -> UserList.User.Domain {
        .init(id: id ?? -1,
              name: name ?? "",
              phone: phone ?? "",
              email: email ?? ""
        )
    }
    
}

extension UserList.User.Domain {
    
    func toCoreDataUser(_ user: UserCoreData) {
        user.id = Int16(id)
        user.name = name
        user.phone = phone
        user.email = email
    }
    
}

