//
//  GetPostListUseCase.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

class GetPostListUseCase: ObservableObject {
    
    // Repository
    private var repository: UserListRepositoryProtocol
    
    // MARK: - Initializers
    
    init(repository: UserListRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error>? {
        repository.getPost(request: request)
    }

}
