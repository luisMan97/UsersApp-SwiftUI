//
//  UserListCoreDataDataSource.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine
import CoreData

class UserListCoreDataDataSource: LocalUserListDataSource {
    
    var dao: UserDao
    
    init(dao: UserDao) {
        self.dao = dao
    }
    
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error> {
        do {
            return try Just(dao.getUsers().compactMap({ $0.toDomain() }))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    func saveUsers(_ users: [UserList.User.Domain]) {
        do {
            try dao.saveUsers(users)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
