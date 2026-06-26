//
//  ToastManager.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Combine
import SwiftUI

public final class ToastManager: ObservableObject {
    public static let shared = ToastManager()
    public private(set) var configuration = ToastConfiguration()
    public private(set) var icons = ToastIcons()

    private init() {}

    @Published var toast: Toast?
    @Published var isShowing = false

    // MARK: - Show Toast

    public func show(_ toast: Toast) {
        DispatchQueue.main.async {
            withAnimation {
                self.toast = toast
                self.isShowing = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration) {
                withAnimation {
                    self.isShowing = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.toast = nil
                }
            }
        }
    }
}

public extension ToastManager {

    func configure(_ configuration: ToastConfiguration) {
        self.configuration = configuration
    }

    func configureIcons(_ icons: ToastIcons) {
        self.icons = icons
    }
}

struct ToastModifier: ViewModifier {
    @ObservedObject var toastManager = ToastManager.shared

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content

            if toastManager.isShowing,
               let toast = toastManager.toast
            {
                ToastView(toast: toast)
                    .transition(
                        .move(edge: .bottom)
                            .combined(with: .opacity)
                    )
            }
        }
        .animation(
            .spring(),
            value: toastManager.isShowing
        )
    }
}

extension View {
    func toast() -> some View {
        modifier(ToastModifier())
    }
}
