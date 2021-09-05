//
//  PostListModels.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation

enum PostList {
    
    enum Post {
        
        struct Request {
            let userId: Int
        }
        
        struct Response: Decodable {
            let title: String?
            let body: String?
        }
        
        struct Domain: Hashable {
            let title: String
            let body: String
        }
        
    }
    
}

extension PostList.Post.Response {
    
    func toDomain() -> PostList.Post.Domain {
        .init(title: title ?? "",
              body: body ?? ""
        )
    }
    
}

