//
//  PostListView.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct PostListView: View {
    
    var post: PostList.Post.Domain
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title)
                .foregroundColor(.primaryGreenColor)
            
            Text(post.body)
        }
    }
    
}
