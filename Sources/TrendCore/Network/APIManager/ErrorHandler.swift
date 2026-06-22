//
//  ErrorHandler.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Alamofire
import Foundation
import TrendConfiguration

public extension APIManager {

    public func handleError<T>(
        response: AFDataResponse<Data>,
        completion: @escaping (Result<T, CoreError>) -> Void
    ) {

        guard let data = response.data else {

            completion(
                .failure(
                    CoreError(
                        message: "Unknown Error"
                    )
                )
            )

            return
        }

        do {

            let responseModel =
                try JSONDecoder()
                    .decode(
                        TrendResponse<EmptyResponse>.self,
                        from: data
                    )

            completion(
                .failure(
                    CoreError(
                        message:
                            responseModel.message ??
                            "Unknown Error"
                    )
                )
            )

        } catch {

            completion(
                .failure(
                    CoreError(
                        message:
                            error.localizedDescription
                    )
                )
            )
        }
    }
}
