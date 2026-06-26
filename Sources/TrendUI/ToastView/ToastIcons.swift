//
//  ToastIcons.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

public struct ToastIcons {

    public var success: Image
    public var error: Image
    public var warning: Image
    public var info: Image

    public init(
        success: Image = TrendImages.successIcon,
        error: Image = TrendImages.errorIcon,
        warning: Image = TrendImages.warningIcon,
        info: Image = TrendImages.infoIcon
    ) {
        self.success = success
        self.error = error
        self.warning = warning
        self.info = info
    }
}
