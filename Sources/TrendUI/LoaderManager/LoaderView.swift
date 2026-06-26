//
//  LoaderView.swift
//  ios-common-kit
//
//  Created by Saravana on 26/06/26.
//

import SwiftUI

struct LoaderView: View {
    let message: String

    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.3)
                .tint(Color.infoColor)

            Text(message)
                .font(Font.system(size: 15, weight: .medium))
                .foregroundColor(Color.textPrimary)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 30)
        .background(Color.cardBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    Color.border,
                    lineWidth: 1
                )
        )
        .cornerRadius(18)
        .shadow(radius: 10)
    }
}
