//
//  LoaderView.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

public struct LoaderView: View {
    let message: String

    public var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.3)
                .tint(
                    LoaderManager.shared.configuration.indicatorColor
                )

            Text(message)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(
                    LoaderManager.shared.configuration.textColor
                )
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 30)
        .background(
            LoaderManager.shared.configuration.backgroundColor
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LoaderManager.shared.configuration.borderColor,
                    lineWidth: 1
                )
        )
        .cornerRadius(18)
        .shadow(radius: 10)
    }
}
