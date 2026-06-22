//
//  KeyValueStore.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//


import Foundation

public protocol KeyValueStore {
    func object(forKey key: String) -> Data?
    func set(_ value: Data?, forKey key: String)
    func remove(forKey key: String)
}
