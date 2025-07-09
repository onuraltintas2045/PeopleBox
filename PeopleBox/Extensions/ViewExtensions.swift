//
//  ViewExtensions.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import SwiftUI

extension View {
    func loadingOverlay(_ isVisible: Bool) -> some View {
        self.overlay(
            LoadingOverlayView(isVisible: isVisible)
        )
    }
    
    func errorAlert(_ errorMessage: Binding<String?>) -> some View {
        self.modifier(ErrorAlertModifier(errorMessage: errorMessage))
    }
}
