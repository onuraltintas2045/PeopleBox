//
//  UserListView.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI

struct UserListView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainTabViewModel
    @State private var searchText: String = ""

    // MARK: - Body
    var body: some View {
        let filteredUsers = viewModel.filteredUsers(searchText: searchText)
        NavigationStack {
            Group {
                if viewModel.users.isEmpty && !viewModel.isLoading {
                    // MARK: - Empty State
                    ScrollView {
                        EmptyListView(
                            message: "No users found.",
                            systemImage: "person.crop.circle.badge.exclamationmark"
                        )
                        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height * 0.6)
                    }
                } else {
                    // MARK: - User List
                    List {
                        Section {
                            if filteredUsers.isEmpty && !viewModel.isLoading {
                                // MARK: - Empty Search Result
                                VStack {
                                    EmptyListView(
                                        message: "No results found for your search.",
                                        systemImage: "magnifyingglass"
                                    )
                                    .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height * 0.5)
                                }
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                            } else {
                                // MARK: - User Rows
                                ForEach(filteredUsers) { user in
                                    NavigationLink {
                                        UserDetailView(user: user)
                                    } label: {
                                        UserCardView(user: user)
                                    }
                                }
                                .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 8))
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "Search by name or email"
            )
            .refreshable {
                viewModel.fetchUsers()
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.fetchUsersIfNeeded()
            }
        }
    }
}
