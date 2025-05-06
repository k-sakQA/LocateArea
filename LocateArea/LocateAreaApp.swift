//
//  LocateAreaApp.swift
//  LocateArea
//
//  Created by kazunori.sakata.ts on 2024/10/22.
//

import SwiftUI

@main
struct LocateAreaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
