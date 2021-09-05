//
//  LocalUserListDataSource.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

protocol LocalUserListDataSource {
    func saveUsers(_ users: [UserList.User.Domain])
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error>
}
