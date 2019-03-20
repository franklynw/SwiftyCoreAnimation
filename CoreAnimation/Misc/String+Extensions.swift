//
//  String+Extensions.swift
//  CoreAnimation
//
//  Created by Franklyn on 16/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


extension String {

    func appendingKeyPath(_ pathElement: String) -> String {
        return self + "." + pathElement
    }
}
