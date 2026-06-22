//
//  LoadingState.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public enum LoadingState {
    case idle
    case loading

    public var isIdle: Bool { self == .idle }
    public var isLoading: Bool { self == .loading }

    public mutating func toggle() {
        switch self {
        case .idle:
            self = .loading

        case .loading:
            self = .idle
        }
    }
}
