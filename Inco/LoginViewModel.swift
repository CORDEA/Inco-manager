//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift

class LoginViewModel {
    private let disposeBag = DisposeBag()

    var username: String = ""
    var password: String = ""

    func clickedButton() {
        LoginRepository.shared.login(user: username, pass: password, onCompleted: {
        })
    }
}
