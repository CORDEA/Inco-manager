//
// Created by Yoshihiro Tanaka on 2018-12-29.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Alamofire
import Foundation

class MainRepository {
    static let shared = MainRepository()

    private init() {
    }

    func getHistories(onCompleted: @escaping ([History]) -> Void) {
        APIClient.shared.getHistories().response {
            if let data = $0.data {
                let histories = try! JSONDecoder().decode([History].self, from: data)
                onCompleted(histories)
                return
            }
            onCompleted([])
        }
    }
}
