//
//  Images.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import SwiftUI

public enum TrendImages {}

public extension TrendImages {

    static let successIcon =
        Image("success", bundle: .module)

    static let errorIcon =
        Image("failure", bundle: .module)

    static let warningIcon =
        Image("confirmation", bundle: .module)

    static let infoIcon =
        Image("confirmation", bundle: .module)
}
