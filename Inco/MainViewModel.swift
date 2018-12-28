//
// Created by Yoshihiro Tanaka on 2018-12-28.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift

class MainViewModel {
    private let _navigate: PublishSubject<Void>
    let navigate: Observable<Void>

    init() {
        _navigate = PublishSubject()
        navigate = _navigate
    }

    func start() {
        if (TokenProvider.get() == nil) {
            _navigate.onNext(())
            return
        }
        // TODO
    }
}
