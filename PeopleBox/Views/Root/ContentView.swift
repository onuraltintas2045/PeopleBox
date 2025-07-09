//
//  ContentView.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        let repository = FavoriteUserRepository(context: modelContext)
        let viewModel = MainTabViewModel(repository: repository)
        MainTabView()
            .environmentObject(viewModel)
    }
}
