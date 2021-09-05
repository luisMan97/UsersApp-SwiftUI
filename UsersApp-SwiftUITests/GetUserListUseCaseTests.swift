//
//  GetUserListUseCaseTests.swift
//  UsersApp-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import XCTest
import Combine
@testable import UsersApp_SwiftUI

class GetUserListUseCaseTests: XCTestCase {
    
    private var repositoryMock = UserListRepositoryMock()
    private lazy var getUserListUseCase: GetUserListUseCase = {
       let getUserListUseCase = GetUserListUseCase(repository: repositoryMock)
        XCTAssertNotNil(getUserListUseCase)
        return getUserListUseCase
    }()
    
    func testGetUsers() {
        let expectedValues: [UserList.User.Domain] = [
            .init(id: 1023020273, name: "Luis", phone: "3177802801", email: "riveraladinojorgeluis@gmail.com")
        ]
        var recievedValues: [UserList.User.Domain] = []
        
        let exp = expectation(description: "expected values")
        
        let cancelable = getUserListUseCase.invoke()?
            .sink(receiveCompletion: { (subscriptionCompletion: Subscribers.Completion<Error>) in
                
            }, receiveValue: { (value: [UserList.User.Domain]?) in
                recievedValues = value ?? []
                if recievedValues == expectedValues {
                    exp.fulfill()
                }
            })
        
        repositoryMock.usersSub.send([UserList.User.Domain(id: 1023020273, name: "Luis", phone: "3177802801", email: "riveraladinojorgeluis@gmail.com")])
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(cancelable)
    }

}
