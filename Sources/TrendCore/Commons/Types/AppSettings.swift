//
//  AppSettings.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public struct AppSettings: Codable {
    public var firstLaunch = true
    public var deviceUUID = ""
    public var inAppNotificationIds: [Int] = []

}

public extension AppSettings {
    @UserDefault(key: "app-settings")
    static var current = AppSettings()
}
