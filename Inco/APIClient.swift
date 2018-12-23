//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Alamofire
import Foundation

class APIClient {
    private static let baseURL: URL = URL(string: "")!

    func login(user: String, pass: String) -> DataRequest {
        let params: Parameters = [
            "user": user,
            "pass": pass
        ]
        return Alamofire.request(APIClient.baseURL.appendingPathComponent("/login"), method: .get, parameters: params)
    }
}
