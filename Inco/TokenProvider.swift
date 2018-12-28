//
// Created by Yoshihiro Tanaka on 2018-12-27.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Foundation

class TokenProvider {
    private static let tokenDefaultsKey = "token"

    static func get() -> String? {
        return UserDefaults.standard.string(forKey: tokenDefaultsKey)
    }

    static func refresh(token: String) {
        UserDefaults.standard.set(token, forKey: tokenDefaultsKey)
    }
}
