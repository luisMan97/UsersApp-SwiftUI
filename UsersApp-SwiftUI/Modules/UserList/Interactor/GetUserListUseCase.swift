//
//  GetUserListUseCase.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

class GetUserListUseCase: ObservableObject {
    
    // Repository
    private var repository: UserListRepositoryProtocol
    
    // MARK: - Initializers
    
    init(repository: UserListRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke() -> AnyPublisher<[UserList.User.Domain]?, Error>? {
        repository.getUsers()
    }

}
