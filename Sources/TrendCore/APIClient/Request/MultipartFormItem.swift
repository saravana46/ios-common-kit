//
//  MultipartFormItem.swift
//  ios-common-kit
//
//  Created by IOSCommonKit on 22/06/26.
//

import Foundation

public struct MultipartFormItem {
    public let name: String
    public let data: Data

    public init(name: String, data: Data) {
        self.name = name
        self.data = data
    }
}
