//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift

class LoginViewModel {
    var username: String = ""
    var password: String = ""

    private let disposeBag = DisposeBag()

    func clickedButton() {
        LoginRepository.shared.login(user: username, pass: password, onCompleted: {
            guard let token = $0?.token else {
                return
            }
            TokenProvider.refresh(token: token)
        })
    }
}
