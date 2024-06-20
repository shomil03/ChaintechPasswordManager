//
//  ChaintechPasswordManagerApp.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 19/06/24.
//

import SwiftUI
import SwiftData
@main
struct ChaintechPasswordManagerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for : Credentials.self)
    }
}
