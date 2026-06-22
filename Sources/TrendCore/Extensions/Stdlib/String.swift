//
//  String.swift
//  ios-common-kit
//
//  Created by IOSCommonKit on 22/06/26.
//

import Foundation

public extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isBlank: Bool {
        trimmed.isEmpty
    }

    var lines: [String] {
        components(separatedBy: "\n")
    }

    var defaultIfEmpty: String {
        isBlank ? "" : self
    }

    var nilIfEmpty: String? {
        isBlank ? nil : self
    }

    var digitsOnly: String {
        components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
    }
}
