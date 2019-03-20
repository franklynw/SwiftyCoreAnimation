//
//  Async.swift
//  Clydesdale
//
//  Created by Franklyn Weber on 12/10/2015.
//

import Foundation


class Async {

    class func main(_ action: @escaping (() -> ())) {
        DispatchQueue.main.async(execute: action)
    }

    class func background(_ queue: DispatchQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background), action: @escaping (() -> ())) {
        queue.async(execute: action)
    }

    class func after(_ interval: TimeInterval, action: @escaping () -> ()) {
        let deadline = DispatchTime.now() + interval
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: action)
    }
}
