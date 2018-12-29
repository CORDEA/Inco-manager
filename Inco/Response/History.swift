//
// Created by Yoshihiro Tanaka on 2018-12-29.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Foundation

struct History: Decodable {
    var id: Int64
    var url: String
    var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case createdAt = "created_at"
    }
}
