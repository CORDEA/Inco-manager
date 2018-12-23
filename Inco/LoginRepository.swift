//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Alamofire
import Foundation

class LoginRepository {
    static let shared = LoginRepository()

    private init() {
    }

    func login(user: String, pass: String, onCompleted: @escaping (Login?) -> Void) {
        APIClient.shared.login(user: user, pass: pass).response {
            if let data = $0.data {
                let login = try! JSONDecoder().decode(Login.self, from: data)
                onCompleted(login)
                return
            }
            onCompleted(nil)
        }
    }
}
