//
//  KeyPathProviding.swift
//  CoreAnimation
//
//  Created by Franklyn on 04/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Used by SwiftyCoreAnimation's layer property wrappers to return their keyPaths
public protocol KeyPathProviding {
    static var keyPath: String { get }
}
