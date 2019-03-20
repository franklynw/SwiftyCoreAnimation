//
//  ActionView.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation


class ActionView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.addAction {
            print("Action done!")
        }
    }
}
