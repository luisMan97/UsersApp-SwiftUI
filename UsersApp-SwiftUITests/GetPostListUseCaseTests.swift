//
//  GetPostListUseCaseTests.swift
//  UsersApp-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import XCTest
import Combine
@testable import UsersApp_SwiftUI

class GetPostListUseCaseTests: XCTestCase {
    
    private var repositoryMock = UserListRepositoryMock()
    private lazy var getUserListUseCase: GetPostListUseCase = {
       let getUserListUseCase = GetPostListUseCase(repository: repositoryMock)
        XCTAssertNotNil(getUserListUseCase)
        return getUserListUseCase
    }()
    
    func testGetPosts() {
        let expectedValues: [PostList.Post.Domain] = [
            .init(title: "SwiftUI and Combine Arch", body: "This article explain how to use SwiftUI and Combine with clear architecture")
        ]
        var recievedValues: [PostList.Post.Domain] = []
        
        let exp = expectation(description: "expected values")
        
        let cancelable = getUserListUseCase.invoke(request: .init(userId: 1023020273))?
            .sink(receiveCompletion: { (subscriptionCompletion: Subscribers.Completion<Error>) in
                
            }, receiveValue: { (value: [PostList.Post.Domain]?) in
                recievedValues = value ?? []
                if recievedValues == expectedValues {
                    exp.fulfill()
                }
            })
        
        repositoryMock.postsSub.send([PostList.Post.Domain(title: "SwiftUI and Combine Arch", body: "This article explain how to use SwiftUI and Combine with clear architecture")])
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(cancelable)
    }
}
