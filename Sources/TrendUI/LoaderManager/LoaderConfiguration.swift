//
//  LoaderConfiguration.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

public struct LoaderConfiguration {

    public var indicatorColor: Color
    public var backgroundColor: Color
    public var borderColor: Color
    public var textColor: Color

    public init(
        indicatorColor: Color = .infoColor,
        backgroundColor: Color = .cardBackgroundColor,
        borderColor: Color = .border,
        textColor: Color = .textPrimary
    ) {
        self.indicatorColor = indicatorColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.textColor = textColor
    }
}
