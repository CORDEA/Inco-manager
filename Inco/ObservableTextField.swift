//
// Created by Yoshihiro Tanaka on 2018-12-27.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa
import RxSwift

class ObservableTextField: NSObject, NSTextFieldDelegate {
    private let _onTextChanged: PublishSubject<String>
    let onTextChanged: Observable<String>

    override init() {
        _onTextChanged = PublishSubject()
        onTextChanged = _onTextChanged
        super.init()
    }

    func textField(_ textField: NSTextField, textView: NSTextView, shouldSelectCandidateAt index: Int) -> Bool {
        _onTextChanged.onNext(textField.stringValue)
        return true
    }
}
