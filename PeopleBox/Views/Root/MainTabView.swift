//
//  MainTabView.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainTabViewModel
    @StateObject private var favoritesViewModel = FavoriteUsersVM()

    // MARK: - Body
    var body: some View {
        TabView {
            // MARK: - Users Tab
            UserListView()
                .tabItem { Label("Users", systemImage: "person.3") }

            // MARK: - Favorites Tab
            FavoriteUsersView(viewModel: favoritesViewModel)
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
        .loadingOverlay(viewModel.isLoading)
        .errorAlert($viewModel.errorMessage)
    }
}
