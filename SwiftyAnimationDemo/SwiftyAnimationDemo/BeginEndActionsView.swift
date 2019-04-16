//
//  BeginEndActionsView.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 14/04/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation

/*
 Shows the use of animationWillBegin & animationDidFinish closures with Group descriptors,
 along with nested groups of animations
*/

class BeginEndActionsView: UIView, AnimationsView {

    weak var animationsViewDelegate: AnimationsViewDelegate?

    private lazy var shapeLayer: CAShapeLayer = {

        let layer = CAShapeLayer()

        self.layer.addSublayer(layer)

        layer.set(Bounds(self.layer.bounds))
        layer.set(Position(CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height / 2)))

        let x = self.layer.bounds.width / 2
        let y = self.layer.bounds.height / 2
        let width = CGFloat(100)
        let height = CGFloat(150)

        let path = UIBezierPath(rect: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        layer.set(Path(path))
        layer.set(FillColor(.orange))
        layer.set(StrokeColor(.black))

        return layer
    }()

    private lazy var backgroundGradientLayer: CAGradientLayer = {

        let layer = CAGradientLayer()

        layer.set(Bounds(self.layer.bounds))
        layer.set(Position(CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height / 2)))

        layer.set(StartPoint(.zero))
        layer.set(EndPoint(CGPoint(x: 1, y: 1)))

        self.layer.addSublayer(layer)

        return layer
    }()

    private lazy var setup: () -> () = {
        // effectively dispatch_once each time the view appears... (has to be a lazy var rather than a let because accessing self)

        self.layer.masksToBounds = true

        _ = self.backgroundGradientLayer
        _ = self.shapeLayer

        self.changeBackgroundGradientColors()
        self.animateBackground()
        self.getGoing()

        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(startAgain))
        self.addGestureRecognizer(tapGestureRecognizer)

        return {}
    }()

    private var allDone: Bool = false


    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup() // now that our bounds is right
    }

    deinit {
        print("Deinit BeginEndView")
    }

    @objc
    private func startAgain() {
        guard self.allDone == true else { return }

        self.allDone = false

        let x = self.layer.bounds.width / 2
        let y = self.layer.bounds.height / 2
        let width = CGFloat(100)
        let height = CGFloat(150)

        let currentPath = self.shapeLayer.get(Path.self)
        let path = UIBezierPath(rect: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        let resetShapeDescriptor = Descriptor.Basic<Path>.from(currentPath, to: path, duration: 1)
        let currentColor = self.shapeLayer.get(FillColor.self)
        let resetFillColorDescriptor = Descriptor.Basic<FillColor>.from(currentColor, to: .orange, duration: 1)

        let resetDescriptor = Descriptor.Group.Concurrent(using: [resetShapeDescriptor, resetFillColorDescriptor])
        resetDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            self.shapeLayer.set(Path(path))
            self.shapeLayer.set(FillColor(.orange))
            self.changeBackgroundGradientColors()
            self.animationsViewDelegate?.showMessage("Starting again")
        }
        resetDescriptor.animationDidFinish = { [weak self] _, _ in
            guard let self = self else { return }
            self.getGoing()
        }

        try? self.shapeLayer.addAnimationsGroup(describedBy: resetDescriptor)
    }

    private func getGoing() {

        let shapeLayer: CAShapeLayer = self.shapeLayer

        let x = self.bounds.width / 2
        let y = self.bounds.height / 2
        let width = CGFloat(100)
        let height = CGFloat(150)

        let waitDescriptor = Descriptor.Wait(for: 2)
        waitDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            self.animationsViewDelegate?.showMessage("Waiting...")
        }

        let currentPath = self.shapeLayer.get(Path.self)
        let ellipsePath = UIBezierPath(ovalIn: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        let ovalDescriptor = Descriptor.Basic<Path>.from(currentPath, to: ellipsePath, duration: 1)
        ovalDescriptor.animationWillBegin = {
            shapeLayer.set(Path(ellipsePath))
            shapeLayer.set(Transform.Rotation(CGFloat.pi))
        }
        let rotateDescriptor = Descriptor.Spring<Transform.Rotation>.from(0, to: CGFloat.pi, duration: 1)
        let changeShapeAndRotateDescriptor = Descriptor.Group.Concurrent(using: [ovalDescriptor, rotateDescriptor])
        changeShapeAndRotateDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            self.animationsViewDelegate?.showMessage("Change shape & rotate")
        }

        let colorDescriptor = Descriptor.Basic<FillColor>.from(.orange, to: .blue, duration: 2)
        let rotateBackDescriptor = Descriptor.Spring<Transform.Rotation>.from(CGFloat.pi, to: 0, duration: 2)
        let changeColorAndRotateDescriptor = Descriptor.Group.Concurrent(using: [colorDescriptor, rotateBackDescriptor])
        changeColorAndRotateDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            shapeLayer.set(FillColor(.blue))
            shapeLayer.set(Transform.Rotation(0))
            self.animationsViewDelegate?.showMessage("Change color & rotate")
        }

        let sequenceDescriptor = Descriptor.Group.Sequential(using: [waitDescriptor, changeShapeAndRotateDescriptor, waitDescriptor, changeColorAndRotateDescriptor])

        let moveAboutPath = UIBezierPath(ovalIn: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        let translate = CGAffineTransform(translationX: width / -2, y: 0)
        moveAboutPath.apply(translate)
        let moveAboutDescriptor = Descriptor.KeyFrame<Position>.path(moveAboutPath, duration: sequenceDescriptor.duration)

        let moveAboutAndDoStuffDescriptor = Descriptor.Group.Concurrent(using: [sequenceDescriptor, moveAboutDescriptor])
        moveAboutDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            self.animationsViewDelegate?.showMessage("We're off!")
        }

        let allAnimationsDescriptor = Descriptor.Group.Sequential(using: [waitDescriptor, moveAboutAndDoStuffDescriptor])
        allAnimationsDescriptor.animationDidFinish = { [weak self] _, _ in
            guard let self = self else { return }
            self.animationsViewDelegate?.showMessage("All done!")
            self.allDone = true
        }

        try? shapeLayer.addAnimationsGroup(describedBy: allAnimationsDescriptor)
    }

    private func animateBackground() {
        guard let startPoint = self.backgroundGradientLayer.get(StartPoint.self), let endPoint = self.backgroundGradientLayer.get(EndPoint.self) else { return }

        let newStartPoint = CGPoint(x: abs(startPoint.x - 1), y: 0)
        let newEndPoint = CGPoint(x: abs(endPoint.x - 1), y: 1)

        let startPointDescriptor = Descriptor.Basic<StartPoint>.from(startPoint, to: newStartPoint, duration: 2)
        let endPointDescriptor = Descriptor.Basic<EndPoint>.from(endPoint, to: newEndPoint, duration: 2)

        self.backgroundGradientLayer.set(StartPoint(newStartPoint))
        self.backgroundGradientLayer.set(EndPoint(newEndPoint))

        self.backgroundGradientLayer.addAnimation(describedBy: startPointDescriptor, animationDidFinish: { [weak self] _, _ in
            guard let self = self else { return }
            self.animateBackground()
        })
        self.backgroundGradientLayer.addAnimation(describedBy: endPointDescriptor)
    }

    private func changeBackgroundGradientColors() {

        let currentGradientColors = self.backgroundGradientLayer.get(Colors.self) ?? [UIColor.clear, UIColor.clear]

        let randomColor: (CGFloat) -> (UIColor) = { alpha in
            var colors: [CGFloat] = [0, 0, 0]
            let color = CGFloat.random(in: 0.5...1)
            colors[Int.random(in: 0...2)] = color
            return UIColor(red: colors[0], green: colors[1], blue: colors[2], alpha: alpha)
        }

        let colors = [randomColor(0.2), randomColor(0.5)]

        let colorsDescriptor = Descriptor.Basic<Colors>.from(currentGradientColors, to: colors, duration: 1)
        colorsDescriptor.animationWillBegin = { [weak self] in
            guard let self = self else { return }
            self.backgroundGradientLayer.set(Colors(colors))
        }

        self.backgroundGradientLayer.addAnimation(describedBy: colorsDescriptor)
    }
}
