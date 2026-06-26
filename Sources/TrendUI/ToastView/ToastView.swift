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
        case .success:
            return ToastManager.shared.icons.success
        case .error:
            return ToastManager.shared.icons.error
        case .warning:
            return ToastManager.shared.icons.warning
        case .info:
            return ToastManager.shared.icons.info
        }
    }
}

public struct ToastView: View {
    let toast: Toast

    public var body: some View {
        HStack(spacing: 12) {
            toast.style.icon
                .foregroundColor(
                    ToastManager.shared.configuration.iconColor ?? toast.style.themeColor
                )

            Text(toast.message)
                .foregroundColor(
                    ToastManager.shared.configuration.textColor
                )
                .font(.system(size: 14, weight: .medium))

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            ToastManager.shared.configuration.backgroundColor
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(
                    ToastManager.shared.configuration.borderColor,
                    lineWidth: 1
                )
        )
        .cornerRadius(14)
        .shadow(radius: 8)
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
}
