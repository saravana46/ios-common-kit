//
//  MultipartFormItem.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public struct MultipartFormItem {

    public let data: Data
    public let name: String
    public let fileName: String?
    public let mimeType: String?

    public init(
        data: Data,
        name: String,
        fileName: String? = nil,
        mimeType: String? = nil
    ) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}
