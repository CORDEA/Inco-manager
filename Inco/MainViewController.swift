//
// Created by Yoshihiro Tanaka on 2018-12-27.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa
import RxSwift

class MainViewController: NSViewController, NSTableViewDataSource {
    @IBOutlet weak var tableView: NSTableView!

    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    private let didAppear: PublishSubject<Void> = PublishSubject()

    private var histories: [History] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.navigate
                .sample(didAppear)
                .subscribe(onNext: { [unowned self] in
                    let vc = self.storyboard!.instantiateController(withIdentifier: "Login") as! NSViewController
                    self.presentAsSheet(vc)
                })
                .disposed(by: disposeBag)
        viewModel.data
                .subscribe(onNext: { [unowned self] in
                    self.histories = $0
                    self.tableView.reloadData()
                })
                .disposed(by: disposeBag)

        tableView.dataSource = self
        viewModel.start()
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        didAppear.onNext(())
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        return histories.count
    }

    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return histories[row].url
    }
}
