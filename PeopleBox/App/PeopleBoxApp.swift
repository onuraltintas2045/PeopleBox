//
//  PeopleBoxApp.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI
import SwiftData

@main
struct PeopleBoxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FavoriteUser.self)
    }
}
