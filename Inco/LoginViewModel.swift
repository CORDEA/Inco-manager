//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift

class LoginViewModel {
    var username: String = ""
    var password: String = ""

    private let _navigate: PublishSubject<Void>
    let navigate: Observable<Void>

    private let disposeBag = DisposeBag()

    init() {
        _navigate = PublishSubject()
        navigate = _navigate
    }

    func clickedButton() {
        LoginRepository.shared.login(user: username, pass: password, onCompleted: { [unowned self] in
            guard let token = $0?.token else {
                return
            }
            TokenProvider.refresh(token: token)
            self._navigate.onNext(())
        })
    }
}
