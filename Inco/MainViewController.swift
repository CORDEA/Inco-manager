//
// Created by Yoshihiro Tanaka on 2018-12-27.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa
import RxSwift

class MainViewController: NSViewController {
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    private let didAppear: PublishSubject<Void> = PublishSubject()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.navigate
                .sample(didAppear)
                .subscribe(onNext: { [unowned self] in
                    let vc = self.storyboard!.instantiateController(withIdentifier: "Login") as! NSViewController
                    self.presentAsSheet(vc)
                })
                .disposed(by: disposeBag)

        viewModel.start()
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        didAppear.onNext(())
    }
}
