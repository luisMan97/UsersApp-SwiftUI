//
//  UsersApp_SwiftUIApp.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import SwiftUI

@main
struct UsersApp_SwiftUIApp: App {
    
    var databaseManager = DatabaseManager()
    
    init() {
        databaseManager.prepare(modelName: "User")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, databaseManager.managedContext)
        }
    }
    
}
