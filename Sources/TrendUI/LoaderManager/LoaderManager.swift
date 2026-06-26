//
//  LoaderManager.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

public final class LoaderManager: ObservableObject {

    public static let shared = LoaderManager()

    public private(set) var configuration = LoaderConfiguration()

    private init() {}

    @Published public var isLoading = false
    @Published public var message = "Loading..."

    public func configure(
        _ configuration: LoaderConfiguration
    ) {
        self.configuration = configuration
    }

    public func show(message: String = "Loading...") {
        DispatchQueue.main.async {
            self.message = message
            self.isLoading = true
        }
    }

    public func hide() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
