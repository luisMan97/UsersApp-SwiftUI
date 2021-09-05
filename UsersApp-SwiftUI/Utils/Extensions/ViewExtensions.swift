//
//  ViewExtensions.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

extension View {
    
    func add(_ searchBar: SearchBar) -> some View {
        self.modifier(SearchBarModifier(searchBar: searchBar))
    }
}
