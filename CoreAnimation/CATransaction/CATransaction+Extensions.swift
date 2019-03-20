//
//  CATransaction+Extensions.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public typealias AnimationsTransaction = () -> ()


/// Lists the layer properties which should be ignored during a CATransaction for a particular CALayer,
/// if the DisabledAnimationProperties object is passed in
public struct DisabledAnimationProperties {
    fileprivate weak var layer: CALayer?
    fileprivate let properties: [KeyPathProviding.Type]
    
    internal init(layer: CALayer?, properties: [KeyPathProviding.Type]) {
        self.layer = layer
        self.properties = properties
    }
}


extension CATransaction {
    
    /// Creates & performs a CATransaction using the supplied parameters
    ///
    /// - Parameters:
    ///   - animations: layer properties to animate
    ///   - duration: animation duration
    ///   - timingFunction: the CAMediaTimingFunction to use
    ///   - animationPropertiesToDisable: any implicit animations which should be disabled during the transaction, for specified layers
    ///   - transactionCompletion: invoked on transaction completion
    public class func performAnimations(_ animations: @escaping () -> (),
                                        duration: TimeInterval? = nil,
                                        using timingFunction: CAMediaTimingFunction? = nil,
                                        disableImplicitAnimations: Bool = false,
                                        transactionCompletion: (() -> ())? = nil) {
        
        self.transactionWithAnimations(animations,
                                       duration: duration,
                                       using: timingFunction,
                                       disableImplicitAnimations: disableImplicitAnimations,
                                       transactionCompletion: transactionCompletion)()
    }
    
    /// Creates & performs a CATransaction using the supplied parameters
    ///
    /// - Parameters:
    ///   - animations: layer properties to animate
    ///   - duration: animation duration
    ///   - timingFunction: the CAMediaTimingFunction to use
    ///   - animationPropertiesToDisable: any implicit animations which should be disabled during the transaction, for specified layers
    ///   - transactionCompletion: invoked on transaction completion
    public class func performAnimations(_ animations: @escaping () -> (),
                                        duration: TimeInterval? = nil,
                                        using timingFunction: CAMediaTimingFunction? = nil,
                                        disableImplicitAnimationsFor animationPropertiesToDisable: [DisabledAnimationProperties],
                                        transactionCompletion: (() -> ())? = nil) {
        
        self.transactionWithAnimations(animations,
                                       duration: duration,
                                       using: timingFunction,
                                       disableImplicitAnimationsFor: animationPropertiesToDisable,
                                       transactionCompletion: transactionCompletion)()
    }
    
    /// Creates a () -> Void closure which contains a CATransaction using the supplied parameters
    ///
    /// - Parameters:
    ///   - animations: layer properties to animate
    ///   - duration: animation duration
    ///   - timingFunction: the CAMediaTimingFunction to use
    ///   - disabledImplicitAnimations: whether or not to disable implicit animations during the transaction
    ///   - transactionCompletion: invoked on transaction completion
    /// - Returns: the closure containing the CATransaction
    public class func transactionWithAnimations(_ animations: @escaping () -> (),
                                                duration: TimeInterval? = nil,
                                                using timingFunction: CAMediaTimingFunction? = nil,
                                                disableImplicitAnimations: Bool = false,
                                                transactionCompletion: (() -> ())? = nil) -> AnimationsTransaction {
        
        let transaction = {
            
            CATransaction.begin()
            
            if let duration: TimeInterval = duration {
                CATransaction.setAnimationDuration(duration)
            }
            CATransaction.setAnimationTimingFunction(timingFunction)
            CATransaction.setCompletionBlock(transactionCompletion)
            
            CATransaction.setDisableActions(disableImplicitAnimations)
            
            animations()
            
            CATransaction.commit()
        }
        
        return transaction
    }
    
    /// Creates a () -> Void closure which contains a CATransaction using the supplied parameters
    ///
    /// - Parameters:
    ///   - animations: layer properties to animate
    ///   - duration: animation duration
    ///   - timingFunction: the CAMediaTimingFunction to use
    ///   - animationPropertiesToDisable: any implicit animations which should be disabled during the transaction, for specified layers
    ///   - transactionCompletion: invoked on transaction completion
    /// - Returns: the closure containing the CATransaction
    public class func transactionWithAnimations(_ animations: @escaping () -> (),
                                                duration: TimeInterval? = nil,
                                                using timingFunction: CAMediaTimingFunction? = nil,
                                                disableImplicitAnimationsFor animationPropertiesToDisable: [DisabledAnimationProperties],
                                                transactionCompletion: (() -> ())? = nil) -> AnimationsTransaction {
        
        let transaction = {
            
            CATransaction.begin()
            
            if let duration: TimeInterval = duration {
                CATransaction.setAnimationDuration(duration)
            }
            CATransaction.setAnimationTimingFunction(timingFunction)
            CATransaction.setCompletionBlock(transactionCompletion)
            
            animationPropertiesToDisable.forEach { disabledAnimationProperties in
                
                guard let layer = disabledAnimationProperties.layer else { return }
                guard disabledAnimationProperties.properties.count > 0 else { return }
                
                let actions: [String: NSNull] = disabledAnimationProperties.properties.reduce(into: [String: NSNull](), { (result, propertyType) in
                    result[propertyType.keyPath] = NSNull()
                })
                
                layer.actions = actions
            }
            
            animations()
            
            CATransaction.commit()
        }
        
        return transaction
    }
}
