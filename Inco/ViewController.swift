//
//  ViewController.swift
//  Inco
//
//  Created by Yoshihiro Tanaka on 2018-12-23.
//  Copyright © 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa
import RxSwift

class ViewController: NSViewController {

    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!

    private let viewModel = LoginViewModel()
    private let usernameChanged = ObservableTextField()
    private let passwordChanged = ObservableTextField()
    private let disposeBag = DisposeBag()

    init() {
        usernameChanged.onTextChanged
                .subscribe(onNext: { [unowned self] in
                    self.viewModel.username = $0
                })
                .disposed(by: disposeBag)
        passwordChanged.onTextChanged
                .subscribe(onNext: { [unowned self] in
                    self.viewModel.password = $0
                })
                .disposed(by: disposeBag)

        viewModel.navigate
                .subscribe(onNext: { [unowned self] in
                })
                .disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = usernameChanged
        passwordTextField.delegate = passwordChanged
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    @IBAction func onClick(_ sender: NSButton) {
        viewModel.clickedButton()
    }
}
