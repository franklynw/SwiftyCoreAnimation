//
//  Descriptor.Action.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes an Animation Action
    public final class Action: Root {

        public typealias AnimationType = CABasicAnimation

        internal var action: () -> ()

        public init(action: @escaping () -> ()) {
            self.action = action
            super.init(duration: 0, animationProperties: [], propertyTypes: [])
        }
    }
}
