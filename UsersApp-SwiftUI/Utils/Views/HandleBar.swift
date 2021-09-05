//
//  HandleBar.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 40, height: 6)
            .foregroundColor(.handlebarGrayColor)
            .cornerRadius(8)
    }
}
