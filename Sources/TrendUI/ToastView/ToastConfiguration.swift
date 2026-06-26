//
//  ToastConfiguration.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

public struct ToastConfiguration {

    public var backgroundColor: Color
    public var borderColor: Color
    public var textColor: Color
    public var iconColor: Color?

    public init(
        backgroundColor: Color = .white,
        borderColor: Color = .gray.opacity(0.3),
        textColor: Color = .black,
        iconColor: Color? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.textColor = textColor
        self.iconColor = iconColor
    }
}
