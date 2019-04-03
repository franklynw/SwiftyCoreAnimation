//
//  ViewController.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 13/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


@objc
protocol AnimationsViewDelegate: AnyObject {
    func showMessage(_ message: String)
}

@objc
protocol AnimationsView {
    var animationsViewDelegate: AnimationsViewDelegate? { get set }
}


class ViewController: UIViewController, AnimationsViewDelegate {

    @IBOutlet private weak var animationsView: (UIView & AnimationsView)!
    @IBOutlet private weak var messageLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.animationsView.animationsViewDelegate = self
    }

    func showMessage(_ message: String) {
        self.messageLabel.text = message
    }
}
