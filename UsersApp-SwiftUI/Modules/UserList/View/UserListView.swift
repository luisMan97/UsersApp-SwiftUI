//
//  UserListView.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
            NavigationView {
                ZStack {
                    Color.backgroundLightGrayColor
                    
                    if viewModel.searchUsersResults.isEmpty {
                        Text("Lo sentimos, no hemos encontrado resultados en la busqueda")
                            .font(.system(.title3, design: .rounded))
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        List {
                            ForEach(viewModel.searchUsersResults) {
                                UserRowView(user: $0, onTap: {
                                    viewModel.getPosts(userSelected: $0)
                                })
                            }.listRowBackground(Color.backgroundLightGrayColor)
                            .hideRowSeparatorV2()
                        }.listStyle(PlainListStyle())
                    }
                }.add(viewModel.searchBar)
                .navigationBarTitle("Usuarios")
                .alert(item: $viewModel.error) {
                    Alert(title: Text("Error"),
                          message: Text($0),
                          dismissButton: .default(Text("Ok"))
                    )
                }
                .sheet(item: $viewModel.userSelected, content: {
                    UserDetail(user: $0, posts: viewModel.posts)
                })
            }
        }.onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
        })
    }
    
}

/*struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListBuilder.createModule(managedContext: <#NSManagedObjectContext#>)
    }
}*/
