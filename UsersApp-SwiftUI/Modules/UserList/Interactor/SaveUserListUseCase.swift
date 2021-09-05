//
//  SaveUserListUseCase.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation

class SaveUserListUseCase {
    
    // Repository
    private var repository: UserListRepository
    
    // MARK: - Initializers
    
    init(repository: UserListRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(users: [UserList.User.Domain]) {
        repository.saveUsers(users)
    }
    
}
