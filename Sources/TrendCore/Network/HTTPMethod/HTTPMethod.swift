//
//  HTTPMethod.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation
import Alamofire

public extension HTTPMethod {
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: .get
        case .post: .post
        case .put: .put
        case .delete: .delete
        default: .post
        }
    }
}
