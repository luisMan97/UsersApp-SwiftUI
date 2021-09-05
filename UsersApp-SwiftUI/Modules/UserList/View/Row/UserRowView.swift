//
//  UserRow.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct UserRowView: View {
    
    var user: UserList.User.Domain
    var onTap: (_ item: UserList.User.Domain) -> Void
    
    var body: some View {
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
            
            HStack {
                Spacer()
                
                Button(action: {
                    onTap(user)
                }, label: {
                    Text("VER PUBLICACIONES")
                        .foregroundColor(.primaryGreenColor)
                })
            }.padding(.top)
            
        }.padding()
        .background(Color.white)
        .clipped()
        .shadow(color: Color(.lightGray), radius: 5, x: 0, y: 5)
        .padding(.horizontal)
        .padding(.top)
    }
    
}
