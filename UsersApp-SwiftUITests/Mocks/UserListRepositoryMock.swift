//
//  UserListRepositoryMock.swift
//  UsersApp-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine
@testable import UsersApp_SwiftUI

class UserListRepositoryMock: UserListRepositoryProtocol {
    
    let usersSub = PassthroughSubject<[UserList.User.Domain]?, Error>()
    let postsSub = PassthroughSubject<[PostList.Post.Domain]?, Error>()
    
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error>? {
        usersSub.eraseToAnyPublisher()
    }
    
    func getPost(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error>? {
        postsSub.eraseToAnyPublisher()
    }
    
    func saveUsers(_ users: [UserList.User.Domain]) { }
    
}
