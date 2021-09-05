//
//  ContentView.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var managedContext
    
    init() {
        UINavigationBar().setup(backgroundColor: .primaryColor)
    }
    
    var body: some View {
        UserListFactory.getUserListView(managedContext: managedContext)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
