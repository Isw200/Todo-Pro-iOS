//
//  Todo_ProApp.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-04.
//

import SwiftUI
import FirebaseCore

@main
struct Todo_ProApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
