//
//  RemoteUserListDataSource.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

protocol RemoteUserListDataSource {
    func getUsers() -> AnyPublisher<[UserList.User.Domain]?, Error>
    func getPost(request: PostList.Post.Request) -> AnyPublisher<[PostList.Post.Domain]?, Error>
}
