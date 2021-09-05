//
//  UserResponseServer.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation

struct UserResponseServer: Decodable {
    let user: [UserList.User.Response]?
}

extension UserResponseServer {
    
    func toUserDomainList() -> [UserList.User.Domain]? {
        user?.map {
            $0.toDomain()
        }
    }
    
}
