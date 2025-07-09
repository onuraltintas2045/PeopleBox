//
//  ErrorAlertModifier.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    @Binding var errorMessage: String?

    func body(content: Content) -> some View {
        content
            .alert("Error", isPresented: Binding(
                get: { errorMessage != nil },
                set: { newValue in
                    if !newValue {
                        DispatchQueue.main.async {
                            errorMessage = nil
                        }
                    }
                }
            )) {
                Button("OK", role: .cancel) { errorMessage = nil }
            } message: {
                Text(errorMessage ?? "")
            }
    }
}
