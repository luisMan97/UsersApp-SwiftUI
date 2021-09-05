//
//  UserListRepository.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

protocol UserListRepositoryProtocol {
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error>?
    func getPost(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error>?
    func saveUsers(_ users: [UserList.User.Domain])
}

class UserListRepository: UserListRepositoryProtocol, ObservableObject {
    
    private var dataSource: RemoteUserListDataSource
    private var localDataSource: LocalUserListDataSource
    
    init(dataSource: RemoteUserListDataSource,
         localDataSource: LocalUserListDataSource
    ) {
        self.dataSource = dataSource
        self.localDataSource = localDataSource
    }
    
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error>? {
        guard ApiTool.isConnected else {
            return localDataSource.getUsers()
        }
        
        return dataSource.getUsers()
            .eraseToAnyPublisher()
    }
    
    func getPost(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error>? {
        dataSource.getPost(request: request)
            .eraseToAnyPublisher()
    }
    
    func saveUsers(_ users: [UserList.User.Domain]) {
        localDataSource.saveUsers(users)
    }
    
}
