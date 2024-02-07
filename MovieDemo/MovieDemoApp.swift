//
//  MovieDemoApp.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//

import SwiftUI

@main
struct MovieDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
