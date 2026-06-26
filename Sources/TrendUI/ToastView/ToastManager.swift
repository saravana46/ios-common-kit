//
//  ToastManager.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Combine
import SwiftUI

final class ToastManager: ObservableObject {
    static let shared = ToastManager()

    private init() {}

    @Published var toast: Toast?
    @Published var isShowing = false

    // MARK: - Show Toast

    func show(_ toast: Toast) {
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
