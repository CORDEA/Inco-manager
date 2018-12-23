//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Alamofire

class LoginRepository {
    static let shared = LoginRepository()

    private init() {
    }

    func login(user: String, pass: String) {
        APIClient.shared.login(user: user, pass: pass).response {
            // TODO
        }
    }
}
