//
//  ToastView.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import SwiftUI

public struct Toast: Equatable {
    public var style: ToastStyle
    public var message: String
    public var duration: Double = 5
    public var width: Double = .infinity

    public init(style: ToastStyle, message: String, duration: Double = 5, width: Double = .infinity) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
    }
}

public enum ToastStyle {
    case error
    case warning
    case success
    case info
}

public extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return .errorColor
        case .warning: return .warningColor
        case .info: return .infoColor
        case .success: return .successColor
        }
    }
}

public extension ToastStyle {

    var icon: Image {

        switch self {

        case .error:
            return TrendImages.errorIcon

        case .warning:
            return TrendImages.warningIcon

        case .success:
            return TrendImages.successIcon

        case .info:
            return TrendImages.infoIcon
        }
    }
}

public struct ToastView: View {
    let toast: Toast

    public var body: some View {
        HStack(spacing: 12) {
            toast.style.icon
                .foregroundColor(toast.style.themeColor)

            Text(toast.message)
                .foregroundColor(Color.textPrimary)
                .font(.system(size: 14, weight: .medium))

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.cardBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(
                    Color.border,
                    lineWidth: 1
                )
        )
        .cornerRadius(14)
        .shadow(radius: 8)
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
}
