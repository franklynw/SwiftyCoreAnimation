//
//  HelloView.swift
//  CoreAnimation
//
//  Created by Franklyn on 12/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation

/*
 Demonstrates the use of Descriptors for the creation of animations
*/

class HelloView: UIView, AnimationsView {

    private static let helloText: NSAttributedString = NSAttributedString(string: "Hello!", attributes: [.font: UIFont.boldSystemFont(ofSize: 100)])
    private static let goodbyeText: NSAttributedString = NSAttributedString(string: "Bye!", attributes: [.font: UIFont.boldSystemFont(ofSize: 100)])

    weak var animationsViewDelegate: AnimationsViewDelegate?

    private var attributedText: NSAttributedString = HelloView.helloText

    private var textPath: CGPath? {

        let path: CGPath? = self.attributedText.cgPath

        let textSize: CGSize = self.attributedText.size()
        let xOffset: CGFloat = self.layer.bounds.width / 2
        let yOffset: CGFloat = self.layer.bounds.height / 2
        var translation = CGAffineTransform(translationX: textSize.width / -2 + xOffset, y: textSize.height / 2 + yOffset)

        let textPath: CGPath? = path?.copy(using: &translation)

        return textPath
    }

    private lazy var backgroundGradientLayer: CAGradientLayer = {

        let layer = CAGradientLayer()

        layer.set(Colors([UIColor(red: 1, green: 0, blue: 0, alpha: 0.2), UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)]))
        layer.set(StartPoint(.zero))
        layer.set(EndPoint(CGPoint(x: 1, y: 1)))

        self.layer.addSublayer(layer)
        self.positionLayer(layer)

        return layer
    }()

    private lazy var containerLayer: CALayer = {

        let layer = CALayer()

        self.layer.addSublayer(layer)
        self.positionLayer(layer)

        return layer
    }()

    private lazy var textLayer: CAShapeLayer = {

        let shapeLayer: CAShapeLayer = CAShapeLayer()

        shapeLayer.set(StrokeColor(.purple))
        shapeLayer.set(FillColor(.clear))
        shapeLayer.set(LineWidth(3))

        self.containerLayer.addSublayer(shapeLayer)

        self.positionLayer(shapeLayer)
        shapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        return shapeLayer
    }()

    private lazy var gradientLayer: CAGradientLayer = {

        let gradientLayer: CAGradientLayer = CAGradientLayer()

        gradientLayer.set(Colors([.red, .purple, .orange, .green, .blue]))
        gradientLayer.set(Mask(self.maskLayer))

        self.containerLayer.insertSublayer(gradientLayer, below: self.textLayer)
        self.positionLayer(gradientLayer)

        return gradientLayer
    }()

    private lazy var maskLayer: CAShapeLayer = {

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.set(FillColor(.black))

        return maskLayer
    }()

    private lazy var emitterLayer: CAEmitterLayer = {

        func emitterCell(_ color: UIColor) -> CAEmitterCell {
            let cell: CAEmitterCell = CAEmitterCell()

            cell.birthRate = 80
            cell.lifetime = 0.5
            cell.color = color.cgColor
            cell.velocity = 50
            cell.velocityRange = 10
            cell.emissionRange = CGFloat.pi * 2
            cell.spin = 2
            cell.spinRange = 0.5
            cell.scale = 0.5
            cell.scaleSpeed = -0.05

            cell.contents = UIImage(named: "Particle")?.cgImage

            return cell
        }

        let emitterLayer: CAEmitterLayer = CAEmitterLayer()

        emitterLayer.set(EmitterPosition(CGPoint(x: self.layer.bounds.width, y: self.layer.bounds.height)))
        emitterLayer.set(EmitterSize(.zero))

        let cell1 = emitterCell(.orange)
        let cell2 = emitterCell(.yellow)
        let cell3 = emitterCell(UIColor(red: 0.5, green: 0, blue: 0, alpha: 1))

        emitterLayer.set(EmitterCells([cell1, cell2, cell3]))

        self.containerLayer.addSublayer(emitterLayer)
        self.positionLayer(emitterLayer)

        return emitterLayer
    }()

    private lazy var setup: () -> Void = {
        // effectively dispatch_once each time the view appears... (has to be a lazy var rather than a let because accessing self)

        self.layer.masksToBounds = true

        _ = self.backgroundGradientLayer
        _ = self.containerLayer

        self.animateBackground()
        self.hello(2)

        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hello))
        self.addGestureRecognizer(tapGestureRecognizer)

        return {}
    }()

    private var animationCount: Int = 0
    private var isInProgress: Bool = false


    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup() // now that our bounds is right
    }

    deinit {
        print("Deinit HelloView")
    }

    @objc
    private func hello(_ startTime: TimeInterval = 0) {
        guard self.isInProgress == false else { return }

        self.isInProgress = true
        self.animationCount = 0

        self.attributedText = HelloView.helloText

        guard let textPath: CGPath = self.textPath else { return }

        let duration: TimeInterval = 5

        self.containerLayer.set(Transform.Scale(1))
        self.containerLayer.set(Opacity(1))
        self.gradientLayer.set(Opacity(0))
        self.maskLayer.set(Path.CGPath(textPath))
        self.textLayer.set(Opacity(0))
        self.textLayer.set(Path.CGPath(textPath))
        self.emitterLayer.set(Opacity(0))

        Async.after(startTime) {

            self.emitterLayer.set(Opacity(1))
            self.textLayer.set(Opacity(1))

            let strokeDescriptor = Descriptor.Basic<StrokeEnd>.from(0, to: 1, duration: duration)
            let properties: [Properties.KeyFrameAnimation] = [.calculationMode(.paced)]
            let emitterFollowingDescriptor = Descriptor.KeyFrame<EmitterPosition>.path(textPath, duration: duration, otherAnimationProperties: properties)
            let rotationDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi * 4, duration: duration)
            let scaleDescriptor = Descriptor.Basic<Transform.Scale>.from(5, to: 1, duration: duration)

            // to see how to do this using group descriptors, see ActionView

            self.emitterLayer.addKeyFrameAnimation(describedBy: emitterFollowingDescriptor)
            self.emitterLayer.addBasicAnimation(describedBy: rotationDescriptor)
            self.emitterLayer.addBasicAnimation(describedBy: scaleDescriptor)

            self.textLayer.addBasicAnimation(describedBy: strokeDescriptor)
            self.textLayer.addBasicAnimation(describedBy: rotationDescriptor)
            self.textLayer.addBasicAnimation(describedBy: scaleDescriptor, animationFinished: { [weak self] _, _ in
                guard let self = self else { return }

                self.gradientLayer.set(Opacity(1))
                let opacityDescriptor = Descriptor.Basic<Opacity>.from(0, to: 1, duration: 1)
                self.gradientLayer.addBasicAnimation(describedBy: opacityDescriptor)

                self.emitterLayer.set(Opacity(0))
                let fadeOutDescriptor = Descriptor.Basic<Opacity>.from(1, to: 0, duration: 1)
                self.emitterLayer.addBasicAnimation(describedBy: fadeOutDescriptor)

                self.containerLayer.set(Transform.Scale(2))
                let stretchDescriptor = Descriptor.Spring<Transform.Scale>.from(1, to: 2, duration: 0.5)
                self.containerLayer.addSpringAnimation(describedBy: stretchDescriptor, animationFinished: { [weak self] _, _ in

                    self?.containerLayer.set(Transform.Scale.X(1))
                    let stretchDescriptor = Descriptor.Spring<Transform.Scale.X>.from(2, to: 1, duration: 0.5)
                    self?.containerLayer.addSpringAnimation(describedBy: stretchDescriptor, animationFinished: { [weak self] _, _ in
                        self?.animateGradient()
                    })
                })
            })
        }
    }

    private func goodBye() {

        guard let currentPath: CGPath = self.textLayer.get(Path.CGPath.self) else { return }

        self.attributedText = HelloView.goodbyeText

        guard let textPath: CGPath = self.textPath else { return }

        self.textLayer.set(Path.CGPath(textPath))
        self.maskLayer.set(Path.CGPath(textPath))

        let pathChangeDescriptor = Descriptor.Basic<Path.CGPath>.from(currentPath, to: textPath, duration: 0.5)

        self.textLayer.addBasicAnimation(describedBy: pathChangeDescriptor)
        self.maskLayer.addBasicAnimation(describedBy: pathChangeDescriptor, animationFinished: { [weak self] _, _ in
            guard let self = self else { return }

            Async.after(2) {

                self.containerLayer.set(Transform.Scale(15))
                self.containerLayer.set(Transform.Rotation(0))
                self.containerLayer.set(Opacity(0))

                let rotationDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi * -2, duration: 1)
                let scaleXDescriptor = Descriptor.Basic<Transform.Scale.X>.from(1, to: 15, duration: 1)
                let scaleYDescriptor = Descriptor.Basic<Transform.Scale.Y>.from(2, to: 15, duration: 1)
                let opacityDescriptor = Descriptor.Basic<Opacity>.from(1, to: 0, duration: 1)

                self.containerLayer.addBasicAnimation(describedBy: rotationDescriptor)
                self.containerLayer.addBasicAnimation(describedBy: scaleXDescriptor)
                self.containerLayer.addBasicAnimation(describedBy: scaleYDescriptor)
                self.containerLayer.addBasicAnimation(describedBy: opacityDescriptor, animationFinished: { [weak self] _, _ in
                    guard let self = self else { return }

                    self.textLayer.set(Opacity(0))
                    self.gradientLayer.set(Opacity(0))

                    self.isInProgress = false
                })
            }
        })
    }

    private func animateGradient() {

        if let gradientColors: [UIColor] = self.gradientLayer.get(Colors.self) {

            let animations = {

                let angle = CGFloat.random(in: 0...(CGFloat.pi * 2))
                let radius = self.bounds.width / 2

                let startX = (radius * cos(angle) + radius) / (radius * 2)
                let startY = (radius * sin(angle) + radius) / (radius * 2)

                let endAngle = angle + CGFloat.pi

                let endX = (radius * cos(endAngle) + radius) / (radius * 2)
                let endY = (radius * sin(endAngle) + radius) / (radius * 2)

                self.gradientLayer.set(StartPoint(CGPoint(x: startX, y: startY)))
                self.gradientLayer.set(EndPoint(CGPoint(x: endX, y: endY)))

                let changedColors: [UIColor] = gradientColors[1..<gradientColors.count] + [gradientColors[0]]
                self.gradientLayer.set(Colors(changedColors))
            }

            CATransaction.performAnimations(animations, duration: 1) { [weak self] in
                guard let self = self else { return }

                if self.animationCount == 6 {
                    return
                }

                self.animationCount += 1
                self.animateGradient()

                if self.animationCount == 4 {
                    self.goodBye()
                }
            }
        }
    }

    private func animateBackground() {

        guard let startPoint = self.backgroundGradientLayer.get(StartPoint.self), let endPoint = self.backgroundGradientLayer.get(EndPoint.self) else { return }

        let newStartPoint = CGPoint(x: abs(startPoint.x - 1), y: 0)
        let newEndPoint = CGPoint(x: abs(endPoint.x - 1), y: 1)

        let startPointDescriptor = Descriptor.Basic<StartPoint>.from(startPoint, to: newStartPoint, duration: 2)
        let endPointDescriptor = Descriptor.Basic<EndPoint>.from(endPoint, to: newEndPoint, duration: 2)

        self.backgroundGradientLayer.set(StartPoint(newStartPoint))
        self.backgroundGradientLayer.set(EndPoint(newEndPoint))

        self.backgroundGradientLayer.addBasicAnimation(describedBy: startPointDescriptor, animationFinished: { [weak self] _, _ in
            guard self != nil else { return }
            self?.animateBackground()
        })
        self.backgroundGradientLayer.addBasicAnimation(describedBy: endPointDescriptor)
    }

    private func positionLayer(_ layer: CALayer) {
        layer.bounds = self.layer.bounds
        layer.position = CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height / 2)
    }
}
