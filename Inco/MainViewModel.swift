//
// Created by Yoshihiro Tanaka on 2018-12-28.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift

class MainViewModel {
    private let _navigate: PublishSubject<Void>
    let navigate: Observable<Void>
    private let _data: PublishSubject<[History]>
    let data: Observable<[History]>

    init() {
        _navigate = PublishSubject()
        navigate = _navigate
        _data = PublishSubject()
        data = _data
    }

    func start() {
        if (TokenProvider.get() == nil) {
            _navigate.onNext(())
            return
        }
        MainRepository.shared.getHistories(onCompleted: { [unowned self] in
            self._data.onNext($0)
        })
    }
}
