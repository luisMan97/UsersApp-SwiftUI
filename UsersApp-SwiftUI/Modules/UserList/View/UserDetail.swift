//
//  UserDetail.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct UserDetail: View {
    
    var user: UserList.User.Domain
    var posts: [PostList.Post.Domain]
    
    var body: some View {
        VStack {
            VStack {
                HandleBar()
                    .padding(.vertical, 10)
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.handlebarBackgroundGrayColor)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user.name)
                    .foregroundColor(.primaryGreenColor)
                
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.primaryGreenColor)
                    
                    Text(user.phone)
                }
                
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.primaryGreenColor)
                    
                    Text(user.email)
                }
            }
            
            List(posts, id: \.self, rowContent: PostListView.init)
            
            Spacer()
        }
    }
    
}
