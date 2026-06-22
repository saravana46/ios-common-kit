//
//  Environment.swift
//  ios-common-kit
//
//  Created by IOSCommonKit on 22/06/26.
//

import Foundation

public enum Environment {
    case debug
    case release
}

public extension Environment {
    static var current: Self {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }
}

public extension Environment {
    var isDebug: Bool { self == .debug }
    var isRelease: Bool { self == .release }
}
