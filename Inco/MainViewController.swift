//
// Created by Yoshihiro Tanaka on 2018-12-27.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa
import RxSwift

class MainViewController: NSViewController {
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.navigate
                .subscribe(onNext: { [unowned self] in
                    let vc = self.storyboard!.instantiateController(withIdentifier: "Login") as! NSViewController
                    self.presentAsSheet(vc)
                })
                .disposed(by: disposeBag)
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        viewModel.start()
    }
}
