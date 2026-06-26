//
//  LoaderManager.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

final class LoaderManager: ObservableObject {
    static let shared = LoaderManager()

    private init() {}

    @Published var isLoading = false
    @Published var message = "Loading..."

    // MARK: - Show Loader

    func show(message: String = "Loading...") {
        DispatchQueue.main.async {
            self.message = message
            self.isLoading = true
        }
    }

    // MARK: - Hide Loader

    func hide() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
