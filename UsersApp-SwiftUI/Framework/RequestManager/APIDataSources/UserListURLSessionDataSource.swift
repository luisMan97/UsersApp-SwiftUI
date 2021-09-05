//
//  UserListURLSessionDataSource.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation
import Combine

class UserListURLSessionDataSource: RemoteUserListDataSource {
    
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error> {
        getUsersPublisher()
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
    func getPost(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error> {
        getPostsPublisher(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
}

private extension UserListURLSessionDataSource {
    
    func getUsersPublisher() -> AnyPublisher<[UserList.User.Response], Error> {
        APIManager
            .request(service: .Users)
    }
    
    func mapResponseToDomain(_ serverResponse: [UserList.User.Response]) -> [UserList.User.Domain]? {
        serverResponse.map {
            $0.toDomain()
        }
    }
    
    func getPostsPublisher(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Response], Error> {
        let parameters = ["userId": request.userId]
        
        return APIManager
            .request(service: .Posts(parameters))
    }
    
    func mapResponseToDomain(_ serverResponse: [PostList.Post.Response]) -> [PostList.Post.Domain]? {
        serverResponse.map {
            $0.toDomain()
        }
    }
    
}
