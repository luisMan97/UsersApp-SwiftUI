//
//  UserListViewModel.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Combine

class UserListViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var posts: [PostList.Post.Domain] = []
    @Published var error: String?
    
    // Internal Input Properties
    @Published var userSelected: UserList.User.Domain?
    
    // Private Input Properties
    @Published private var searchText: String = ""
    
    // Internal Properties
    var searchUsersResults: [UserList.User.Domain] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.name.contains(searchText) }
        }
    }
    
    var searchBar = SearchBar()
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    private var users: [UserList.User.Domain] = []
    
    // Interactor
    private var getUserListUseCase: GetUserListUseCase
    private var getPostListUseCase: GetPostListUseCase
    private var saveUserListUseCase: SaveUserListUseCase
    
    // MARK: - Initializers
    
    init(getUserListUseCase: GetUserListUseCase,
         getPostListUseCase: GetPostListUseCase,
         saveUserListUseCase: SaveUserListUseCase
    ) {
        self.getUserListUseCase = getUserListUseCase
        self.getPostListUseCase = getPostListUseCase
        self.saveUserListUseCase = saveUserListUseCase
        getUserList()
        publishedAssign()
    }
    
    // MARK: - Internal Methods
    
    func getUserList() {
        progressTitle = "Cargando usuarios..."
        showProgress = true
        
        getUserListUseCase.invoke()?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    print(error.localizedDescription)
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [UserList.User.Domain]?) in
                self?.users = value ?? []
                self?.saveUsers()
            })
            .store(in: &subscriptions)
    }
    
    func getPosts(userSelected: UserList.User.Domain) {
        guard ApiTool.isConnected else {
            error = "No tienes conexión a internet"
            return
        }
        
        progressTitle = "Cargando posts..."
        showProgress = true
        
        getPostListUseCase.invoke(request: .init(userId: userSelected.id))?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    self?.error = error.localizedDescription
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [PostList.Post.Domain]?) in
                self?.userSelected = userSelected
                self?.posts = value ?? []
            })
            .store(in: &subscriptions)
    }
    
    // MARK: - Private Methods
    
    private func publishedAssign() {
        searchBar.$text
            .assign(to: \.searchText, on: self)
            .store(in: &subscriptions)
    }
    
    private func saveUsers() {
        if ApiTool.isConnected {
            saveUserListUseCase.invoke(users: users)
        }
    }
    
}
