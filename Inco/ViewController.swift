//
//  ViewController.swift
//  Inco
//
//  Created by Yoshihiro Tanaka on 2018-12-23.
//  Copyright © 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    @IBAction func onClick(_ sender: NSButton) {
    }
}
