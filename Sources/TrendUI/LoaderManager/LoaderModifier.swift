//
//  LoaderModifier.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

struct LoaderModifier: ViewModifier {
    @ObservedObject var loaderManager = LoaderManager.shared

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(loaderManager.isLoading)

            if loaderManager.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                LoaderView(
                    message: loaderManager.message
                )
                .transition(.opacity)
            }
        }
        .animation(
            .easeInOut(duration: 0.2),
            value: loaderManager.isLoading
        )
    }
}

extension View {
    func loader() -> some View {
        modifier(LoaderModifier())
    }
}
