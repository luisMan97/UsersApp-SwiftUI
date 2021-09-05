//
//  UserListFactory.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation
import CoreData

class UserListFactory {
    
    class func getUserListView(managedContext: NSManagedObjectContext) -> UserListView {
        // Dao
        let dao = UserDao(managedContext: managedContext)
        
        // DataSource
        let dataSource = UserListURLSessionDataSource()
        let localDataSource = UserListCoreDataDataSource(dao: dao)
        
        // Repository
        let repository: UserListRepository = UserListRepository(dataSource: dataSource,
                                                                localDataSource: localDataSource
        )
        
        // Interactor
        let getUserListUseCase = GetUserListUseCase(repository: repository)
        let getPostListUseCase = GetPostListUseCase(repository: repository)
        let saveUserListUseCase = SaveUserListUseCase(repository: repository)
        
        // ViewModel
        let viewModel = UserListViewModel(getUserListUseCase: getUserListUseCase,
                                          getPostListUseCase: getPostListUseCase, saveUserListUseCase: saveUserListUseCase
        )
        
        return UserListView(viewModel: viewModel)
    }
    
}
