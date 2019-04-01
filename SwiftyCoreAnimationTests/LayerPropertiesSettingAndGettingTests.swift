//
//  LayerPropertiesSettingAndGettingTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 04/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class LayerPropertiesSettingAndGettingTests: XCTestCase {

    private lazy var layer: CALayer = {
        return CALayer()
    }()
    private lazy var shapeLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()
    private lazy var emitterLayer: CAEmitterLayer = {
        return CAEmitterLayer()
    }()
    private lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()
    private lazy var replicatorLayer: CAReplicatorLayer = {
        return CAReplicatorLayer()
    }()
    private lazy var textLayer: CATextLayer = {
        return CATextLayer()
    }()

    private func round(_ number: CGFloat, _ places: Int) -> CGFloat {
        let factor = pow(10, Double(places))
        let result = CGFloat((number * CGFloat(factor)).rounded()) / CGFloat(factor)
        return result
    }


    // MARK: - CALayer properties

    func testActions() {

        class Action: CAAction {
            var name: String?
            func run(forKey event: String, object anObject: Any, arguments dict: [AnyHashable : Any]?) {
                // nothing
            }
        }

        let action1 = Action()
        action1.name = "Fred"
        let action2 = Action()
        action2.name = "Jim"
        let actionsDict: [String: CAAction] = ["fred": action1, "jim": action2]
        let actions = Actions(actionsDict)
        self.layer.set(actions)
        let result = self.layer.get(Actions.self)

        let resultNames = result?.compactMap({ ($0.value as? Action)?.name }).sorted()
        XCTAssertEqual(["Fred", "Jim"], resultNames, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerActions = self.layer.actions
        let layerActionNames = layerActions?.compactMap({ ($0.value as? Action)?.name }).sorted()
        XCTAssertEqual(["Fred", "Jim"], layerActionNames, "Both should be equal")
    }

    func testAllowsEdgeAntialiasing() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let allowsEdgeAntialiasing = AllowsEdgeAntialiasing(state)
            self.layer.set(allowsEdgeAntialiasing)
            let result = self.layer.get(AllowsEdgeAntialiasing.self)

            XCTAssertEqual(allowsEdgeAntialiasing.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerAllowsEdgeAntialiasing = self.layer.allowsEdgeAntialiasing
            XCTAssertEqual(layerAllowsEdgeAntialiasing, allowsEdgeAntialiasing.value, "Both should be equal")
        }
    }

    func testAllowsGroupOpacity() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let allowsGroupOpacity = AllowsGroupOpacity(state)
            self.layer.set(allowsGroupOpacity)
            let result = self.layer.get(AllowsGroupOpacity.self)

            XCTAssertEqual(allowsGroupOpacity.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerAllowsGroupOpacity = self.layer.allowsGroupOpacity
            XCTAssertEqual(layerAllowsGroupOpacity, allowsGroupOpacity.value, "Both should be equal")
        }
    }

    func testAnchorPoint() {

        let anchorPoint = AnchorPoint(CGPoint(x: 0.5, y: 0.4))
        self.layer.set(anchorPoint)
        let result = self.layer.get(AnchorPoint.self)
        let resultX = self.layer.get(AnchorPoint.X.self)
        let resultY = self.layer.get(AnchorPoint.Y.self)

        XCTAssertEqual(anchorPoint.value, result, "Both should be equal")
        XCTAssertEqual(anchorPoint.value?.x, resultX, "Both should be equal")
        XCTAssertEqual(anchorPoint.value?.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.anchorPoint, anchorPoint.value, "Both should be equal")


        let x = AnchorPoint.X(0.8)
        self.layer.set(x)
        let resultX2 = self.layer.get(AnchorPoint.X.self)

        XCTAssertEqual(x.value, resultX2, "Both should be equal")

        let y = AnchorPoint.Y(0.9)
        self.layer.set(y)
        let resultY2 = self.layer.get(AnchorPoint.Y.self)

        XCTAssertEqual(y.value, resultY2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.anchorPoint.x, x.value, "Both should be equal")
        XCTAssertEqual(self.layer.anchorPoint.y, y.value, "Both should be equal")


        let z = AnchorPoint.Z(0.75)
        self.layer.set(z)
        let resultZ = self.layer.get(AnchorPoint.Z.self)

        XCTAssertEqual(z.value, resultZ, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.anchorPointZ, z.value, "Both should be equal")
    }

    func testBackgroundColor() {
        let backgroundColor = BackgroundColor(.red)
        self.layer.set(backgroundColor)
        let result = self.layer.get(BackgroundColor.self)

        XCTAssertEqual(backgroundColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBackgroundColor = self.layer.backgroundColor
        XCTAssertEqual(layerBackgroundColor, backgroundColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.layer.get(BackgroundColor.CGColor.self)

        XCTAssertEqual(backgroundColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let backgroundColor2 = BackgroundColor.CGColor(UIColor.green.cgColor)
        self.layer.set(backgroundColor2)
        let result3 = self.layer.get(BackgroundColor.CGColor.self)

        XCTAssertEqual(backgroundColor2.value, result3, "Both should be equal")
    }

    func testBorderColor() {
        let borderColor = BorderColor(.green)
        self.layer.set(borderColor)
        let result = self.layer.get(BorderColor.self)

        XCTAssertEqual(borderColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBorderColor = self.layer.borderColor
        XCTAssertEqual(layerBorderColor, borderColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.layer.get(BorderColor.CGColor.self)

        XCTAssertEqual(borderColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let borderColor2 = BorderColor.CGColor(UIColor.green.cgColor)
        self.layer.set(borderColor2)
        let result3 = self.layer.get(BorderColor.CGColor.self)

        XCTAssertEqual(borderColor2.value, result3, "Both should be equal")
    }

    func testBorderWidth() {
        let borderWidth = BorderWidth(2.5)
        self.layer.set(borderWidth)
        let result = self.layer.get(BorderWidth.self)

        XCTAssertEqual(borderWidth.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBorderWidth = self.layer.borderWidth
        XCTAssertEqual(layerBorderWidth, borderWidth.value, "Both should be equal")
    }

    func testBounds() {

        let bounds = Bounds(CGRect(x: 0, y: 0, width: 100, height: 200))
        self.layer.set(bounds)
        let result = self.layer.get(Bounds.self)
        let resultOrigin = self.layer.get(Bounds.Origin.self)
        let resultX = self.layer.get(Bounds.Origin.X.self)
        let resultY = self.layer.get(Bounds.Origin.Y.self)

        XCTAssertEqual(bounds.value, result, "Both should be equal")
        XCTAssertEqual(bounds.value?.origin, resultOrigin, "Both should be equal")
        XCTAssertEqual(bounds.value?.origin.x, resultX, "Both should be equal")
        XCTAssertEqual(bounds.value?.origin.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBounds = self.layer.bounds
        XCTAssertEqual(layerBounds, bounds.value, "Both should be equal")


        // test the sub-properties

        let origin = Bounds.Origin(.zero)
        self.layer.set(origin)
        let result2 = self.layer.get(Bounds.Origin.self)

        XCTAssertEqual(origin.value, result2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBoundsOrigin = self.layer.bounds.origin
        XCTAssertEqual(layerBoundsOrigin, origin.value, "Both should be equal")



        let x = Bounds.Origin.X(20)
        self.layer.set(x)
        let result3 = self.layer.get(Bounds.Origin.X.self)

        XCTAssertEqual(x.value, result3, "Both should be equal")

        let y = Bounds.Origin.Y(30)
        self.layer.set(y)
        let result4 = self.layer.get(Bounds.Origin.Y.self)

        XCTAssertEqual(y.value, result4, "Both should be equal")

        let size = Bounds.Size(CGSize(width: 300, height: 400))
        self.layer.set(size)
        let resultSize = self.layer.get(Bounds.Size.self)

        XCTAssertEqual(size.value, resultSize, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBoundsSize = self.layer.bounds.size
        XCTAssertEqual(layerBoundsSize, size.value, "Both should be equal")

        
        let width = Bounds.Size.Width(150)
        self.layer.set(width)
        let resultWidth = self.layer.get(Bounds.Size.Width.self)

        XCTAssertEqual(width.value, resultWidth, "Both should be equal")

        let height = Bounds.Size.Height(250)
        self.layer.set(height)
        let resultHeight = self.layer.get(Bounds.Size.Height.self)

        XCTAssertEqual(height.value, resultHeight, "Both should be equal")


        // test that the setters are actually setting the properties, not just some random keyPaths

        let layerBoundsOriginX = self.layer.bounds.origin.x
        XCTAssertEqual(layerBoundsOriginX, x.value, "Both should be equal")

        let layerBoundsOriginY = self.layer.bounds.origin.y
        XCTAssertEqual(layerBoundsOriginY, y.value, "Both should be equal")

        let layerBoundsSizeWidth = self.layer.bounds.size.width
        XCTAssertEqual(layerBoundsSizeWidth, width.value, "Both should be equal")

        let layerBoundsSizeHeight = self.layer.bounds.size.height
        XCTAssertEqual(layerBoundsSizeHeight, height.value, "Both should be equal")
    }

    func testContents() {

        let bundle: Bundle = Bundle(for: type(of: self))
        let image: UIImage = UIImage(named: "Image", in: bundle, compatibleWith: nil)!
        let contents = Contents(image)
        self.layer.set(contents)
        let result = self.layer.get(Contents.self)

        // the images won't be the same objects, so we need to compare something else - we're using the png data
        let contentsData = contents.value?.pngData()
        let resultData = result?.pngData()

        XCTAssertEqual(contentsData, resultData, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerContents = self.layer.contents as! CGImage
        XCTAssertEqual(layerContents, contents.value?.cgImage, "Both should be equal")


        // also test the CGImage version

        // first the getter after setting using UIImage

        let result2 = self.layer.get(Contents.CGImage.self)

        XCTAssertEqual(contents.value?.cgImage, result2, "Both should be equal")

        // then setter & getter

        let contents2 = Contents.CGImage(image.cgImage!)
        self.layer.set(contents2)
        let result3 = self.layer.get(Contents.CGImage.self)

        XCTAssertEqual(contents2.value, result3, "Both should be equal")
    }

    func testContentsFormat() {
        // the setter doesn't seem to have any affect for the contentsFormat - maybe should be read-only?
        let contentsFormat = self.layer.get(ContentsFormat.self)
        let layerContentsFormat = self.layer.contentsFormat
        XCTAssertEqual(layerContentsFormat, contentsFormat, "Both should be equal")
    }

    func testContentsGravity() {

        let gravities: [CALayerContentsGravity] = [.bottom, .bottomLeft, .bottomRight, .center, .left, .resize, .resizeAspect, .resizeAspectFill, .right, .top, .topLeft, .topRight]

        gravities.forEach {
            let gravity = ContentsGravity($0)
            self.layer.set(gravity)
            let result = self.layer.get(ContentsGravity.self)

            XCTAssertEqual(gravity.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerGravity = self.layer.contentsGravity
            XCTAssertEqual(layerGravity, gravity.value, "Both should be equal")
        }
    }

    func testContentsCenter() {

        let contentsCenter = ContentsCenter(CGRect(x: 0, y: 0, width: 100, height: 200))
        self.layer.set(contentsCenter)
        let result = self.layer.get(ContentsCenter.self)
        let resultOrigin = self.layer.get(ContentsCenter.Origin.self)
        let resultX = self.layer.get(ContentsCenter.Origin.X.self)
        let resultY = self.layer.get(ContentsCenter.Origin.Y.self)

        XCTAssertEqual(contentsCenter.value, result, "Both should be equal")
        XCTAssertEqual(contentsCenter.value?.origin, resultOrigin, "Both should be equal")
        XCTAssertEqual(contentsCenter.value?.origin.x, resultX, "Both should be equal")
        XCTAssertEqual(contentsCenter.value?.origin.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerCenter = self.layer.contentsCenter
        XCTAssertEqual(layerCenter, contentsCenter.value, "Both should be equal")


        // test the sub-properties


        let origin = ContentsCenter.Origin(.zero)
        self.layer.set(origin)
        let result2 = self.layer.get(ContentsCenter.Origin.self)

        XCTAssertEqual(origin.value, result2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOrigin = self.layer.contentsCenter.origin
        XCTAssertEqual(layerOrigin, origin.value, "Both should be equal")


        let x = ContentsCenter.Origin.X(20)
        self.layer.set(x)
        let result3 = self.layer.get(ContentsCenter.Origin.X.self)

        XCTAssertEqual(x.value, result3, "Both should be equal")

        let y = ContentsCenter.Origin.Y(30)
        self.layer.set(y)
        let result4 = self.layer.get(ContentsCenter.Origin.Y.self)

        XCTAssertEqual(y.value, result4, "Both should be equal")

        let size = ContentsCenter.Size(CGSize(width: 300, height: 400))
        self.layer.set(size)
        let resultSize = self.layer.get(ContentsCenter.Size.self)

        XCTAssertEqual(size.value, resultSize, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSize = self.layer.contentsCenter.size
        XCTAssertEqual(layerSize, size.value, "Both should be equal")


        let width = ContentsCenter.Size.Width(150)
        self.layer.set(width)
        let resultWidth = self.layer.get(ContentsCenter.Size.Width.self)

        XCTAssertEqual(width.value, resultWidth, "Both should be equal")

        let height = ContentsCenter.Size.Height(250)
        self.layer.set(height)
        let resultHeight = self.layer.get(ContentsCenter.Size.Height.self)

        XCTAssertEqual(height.value, resultHeight, "Both should be equal")


        // test that the setters are actually setting the properties, not just some random keyPaths

        let layerOriginX = self.layer.contentsCenter.origin.x
        XCTAssertEqual(layerOriginX, x.value, "Both should be equal")

        let layerOriginY = self.layer.contentsCenter.origin.y
        XCTAssertEqual(layerOriginY, y.value, "Both should be equal")

        let layerSizeWidth = self.layer.contentsCenter.size.width
        XCTAssertEqual(layerSizeWidth, width.value, "Both should be equal")

        let layerSizeHeight = self.layer.contentsCenter.size.height
        XCTAssertEqual(layerSizeHeight, height.value, "Both should be equal")
    }

    func testContentsRect() {

        let contentsRect = ContentsRect(CGRect(x: 0, y: 0, width: 100, height: 200))
        self.layer.set(contentsRect)
        let result = self.layer.get(ContentsRect.self)
        let resultOrigin = self.layer.get(ContentsRect.Origin.self)
        let resultX = self.layer.get(ContentsRect.Origin.X.self)
        let resultY = self.layer.get(ContentsRect.Origin.Y.self)

        XCTAssertEqual(contentsRect.value, result, "Both should be equal")
        XCTAssertEqual(contentsRect.value?.origin, resultOrigin, "Both should be equal")
        XCTAssertEqual(contentsRect.value?.origin.x, resultX, "Both should be equal")
        XCTAssertEqual(contentsRect.value?.origin.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerRect = self.layer.contentsRect
        XCTAssertEqual(layerRect, contentsRect.value, "Both should be equal")


        // test the sub-properties

        let origin = ContentsRect.Origin(.zero)
        self.layer.set(origin)
        let result2 = self.layer.get(ContentsRect.Origin.self)

        XCTAssertEqual(origin.value, result2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOrigin = self.layer.contentsRect.origin
        XCTAssertEqual(layerOrigin, origin.value, "Both should be equal")


        let x = ContentsRect.Origin.X(20)
        self.layer.set(x)
        let result3 = self.layer.get(ContentsRect.Origin.X.self)

        XCTAssertEqual(x.value, result3, "Both should be equal")

        let y = ContentsRect.Origin.Y(30)
        self.layer.set(y)
        let result4 = self.layer.get(ContentsRect.Origin.Y.self)

        XCTAssertEqual(y.value, result4, "Both should be equal")

        let size = ContentsRect.Size(CGSize(width: 300, height: 400))
        self.layer.set(size)
        let resultSize = self.layer.get(ContentsRect.Size.self)

        XCTAssertEqual(size.value, resultSize, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSize = self.layer.contentsRect.size
        XCTAssertEqual(layerSize, size.value, "Both should be equal")


        let width = ContentsRect.Size.Width(150)
        self.layer.set(width)
        let resultWidth = self.layer.get(ContentsRect.Size.Width.self)

        XCTAssertEqual(width.value, resultWidth, "Both should be equal")

        let height = ContentsRect.Size.Height(250)
        self.layer.set(height)
        let resultHeight = self.layer.get(ContentsRect.Size.Height.self)

        XCTAssertEqual(height.value, resultHeight, "Both should be equal")


        // test that the setters are actually setting the properties, not just some random keyPaths

        let layerOriginX = self.layer.contentsRect.origin.x
        XCTAssertEqual(layerOriginX, x.value, "Both should be equal")

        let layerOriginY = self.layer.contentsRect.origin.y
        XCTAssertEqual(layerOriginY, y.value, "Both should be equal")

        let layerSizeWidth = self.layer.contentsRect.size.width
        XCTAssertEqual(layerSizeWidth, width.value, "Both should be equal")

        let layerSizeHeight = self.layer.contentsRect.size.height
        XCTAssertEqual(layerSizeHeight, height.value, "Both should be equal")
    }

    func testContentsScale() {
        let scale = ContentsScale(0.5)
        self.layer.set(scale)
        let result = self.layer.get(ContentsScale.self)

        XCTAssertEqual(scale.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerScale = self.layer.contentsScale
        XCTAssertEqual(layerScale, scale.value, "Both should be equal")
    }

    func testCornerRadius() {
        let cornerRadius = CornerRadius(10)
        self.layer.set(cornerRadius)
        let result = self.layer.get(CornerRadius.self)

        XCTAssertEqual(cornerRadius.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerCornerRadius = self.layer.cornerRadius
        XCTAssertEqual(layerCornerRadius, cornerRadius.value, "Both should be equal")
    }

    func testDoubleSided() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let doubleSided = DoubleSided(state)
            self.layer.set(doubleSided)
            let result = self.layer.get(DoubleSided.self)

            XCTAssertEqual(doubleSided.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerDoubleSided = self.layer.isDoubleSided
            XCTAssertEqual(layerDoubleSided, doubleSided.value, "Both should be equal")
        }
    }

    func testDrawsAsync() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let drawsAsync = DrawsAsynchronously(state)
            self.layer.set(drawsAsync)
            let result = self.layer.get(DrawsAsynchronously.self)

            XCTAssertEqual(drawsAsync.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerDrawsAsync = self.layer.drawsAsynchronously
            XCTAssertEqual(layerDrawsAsync, drawsAsync.value, "Both should be equal")
        }
    }

    func testEdgeAntialisaingMask() {

        let masks: [CAEdgeAntialiasingMask] = [.layerLeftEdge, .layerRightEdge, .layerBottomEdge, .layerTopEdge]

        masks.forEach { mask in
            let mask = EdgeAntialiasingMask(mask)
            self.layer.set(mask)
            let result = self.layer.get(EdgeAntialiasingMask.self)

            XCTAssertEqual(mask.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerMask = self.layer.edgeAntialiasingMask
            XCTAssertEqual(layerMask, mask.value, "Both should be equal")
        }
    }

    func testFrame() {

        let frame = Frame(CGRect(x: 0, y: 0, width: 100, height: 200))
        self.layer.set(frame)
        let result = self.layer.get(Frame.self)
        let resultOrigin = self.layer.get(Frame.Origin.self)
        let resultX = self.layer.get(Frame.Origin.X.self)
        let resultY = self.layer.get(Frame.Origin.Y.self)

        XCTAssertEqual(frame.value, result, "Both should be equal")
        XCTAssertEqual(frame.value?.origin, resultOrigin, "Both should be equal")
        XCTAssertEqual(frame.value?.origin.x, resultX, "Both should be equal")
        XCTAssertEqual(frame.value?.origin.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerRect = self.layer.frame
        XCTAssertEqual(layerRect, frame.value, "Both should be equal")


        // test the sub-properties

        let origin = Frame.Origin(.zero)
        self.layer.set(origin)
        let result2 = self.layer.get(Frame.Origin.self)

        XCTAssertEqual(origin.value, result2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOrigin = self.layer.frame.origin
        XCTAssertEqual(layerOrigin, origin.value, "Both should be equal")


        let x = Frame.Origin.X(20)
        self.layer.set(x)
        let result3 = self.layer.get(Frame.Origin.X.self)

        XCTAssertEqual(x.value, result3, "Both should be equal")

        let y = Frame.Origin.Y(30)
        self.layer.set(y)
        let result4 = self.layer.get(Frame.Origin.Y.self)

        XCTAssertEqual(y.value, result4, "Both should be equal")

        let size = Frame.Size(CGSize(width: 300, height: 400))
        self.layer.set(size)
        let resultSize = self.layer.get(Frame.Size.self)

        XCTAssertEqual(size.value, resultSize, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSize = self.layer.frame.size
        XCTAssertEqual(layerSize, size.value, "Both should be equal")


        let width = Frame.Size.Width(150)
        self.layer.set(width)
        let resultWidth = self.layer.get(Frame.Size.Width.self)

        XCTAssertEqual(width.value, resultWidth, "Both should be equal")

        let height = Frame.Size.Height(250)
        self.layer.set(height)
        let resultHeight = self.layer.get(Frame.Size.Height.self)

        XCTAssertEqual(height.value, resultHeight, "Both should be equal")


        // test that the setters are actually setting the properties, not just some random keyPaths

        let layerOriginX = self.layer.frame.origin.x
        XCTAssertEqual(layerOriginX, x.value, "Both should be equal")

        let layerOriginY = self.layer.frame.origin.y
        XCTAssertEqual(layerOriginY, y.value, "Both should be equal")

        let layerSizeWidth = self.layer.frame.size.width
        XCTAssertEqual(layerSizeWidth, width.value, "Both should be equal")

        let layerSizeHeight = self.layer.frame.size.height
        XCTAssertEqual(layerSizeHeight, height.value, "Both should be equal")
    }

    func testGeometryFlipped() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let flipped = GeometryFlipped(state)
            self.layer.set(flipped)
            let result = self.layer.get(GeometryFlipped.self)

            XCTAssertEqual(flipped.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerFlipped = self.layer.isGeometryFlipped
            XCTAssertEqual(layerFlipped, flipped.value, "Both should be equal")
        }
    }

    func testHidden() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let hidden = Hidden(state)
            self.layer.set(hidden)
            let result = self.layer.get(Hidden.self)

            XCTAssertEqual(hidden.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerHidden = self.layer.isHidden
            XCTAssertEqual(layerHidden, hidden.value, "Both should be equal")
        }
    }

    func testMask() {
        let mask = Mask(CALayer())
        self.layer.set(mask)
        let result = self.layer.get(Mask.self)

        XCTAssertEqual(mask.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerMask = self.layer.mask
        XCTAssertEqual(layerMask, mask.value, "Both should be equal")
    }

    @available(iOS 11.0, *)
    func testMaskedCorners() {

        let masks: [CACornerMask] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]

        masks.forEach { mask in
            let masked = MaskedCorners(mask)
            self.layer.set(masked)
            let result = self.layer.get(MaskedCorners.self)

            XCTAssertEqual(masked.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerMasked = self.layer.maskedCorners
            XCTAssertEqual(layerMasked, masked.value, "Both should be equal")
        }
    }

    func testMasksToBounds() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let masksToBounds = MasksToBounds(state)
            self.layer.set(masksToBounds)
            let result = self.layer.get(MasksToBounds.self)

            XCTAssertEqual(masksToBounds.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerMasks = self.layer.masksToBounds
            XCTAssertEqual(layerMasks, masksToBounds.value, "Both should be equal")
        }
    }

    func testName() {
        let name = Name("Fred")
        self.layer.set(name)
        let result = self.layer.get(Name.self)

        XCTAssertEqual(name.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerName = self.layer.name
        XCTAssertEqual(layerName, name.value, "Both should be equal")
    }

    func testNeedsDisplayOnBoundsChange() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let needsDisplay = NeedsDisplayOnBoundsChange(state)
            self.layer.set(needsDisplay)
            let result = self.layer.get(NeedsDisplayOnBoundsChange.self)

            XCTAssertEqual(needsDisplay.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerNeedsDisplay = self.layer.needsDisplayOnBoundsChange
            XCTAssertEqual(layerNeedsDisplay, needsDisplay.value, "Both should be equal")
        }
    }

    func testOpacity() {
        let opacity = Opacity(0.5)
        self.layer.set(opacity)
        let result = self.layer.get(Opacity.self)

        XCTAssertEqual(opacity.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOpacity = self.layer.opacity
        XCTAssertEqual(layerOpacity, Float(opacity.value!), "Both should be equal")
    }

    func testOpaque() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let opaque = Opaque(state)
            self.layer.set(opaque)
            let result = self.layer.get(Opaque.self)

            XCTAssertEqual(opaque.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerOpaque = self.layer.isOpaque
            XCTAssertEqual(layerOpaque, opaque.value, "Both should be equal")
        }
    }

    func testPosition() {

        let position = Position(CGPoint(x: 0.5, y: 0.4))
        self.layer.set(position)
        let result = self.layer.get(Position.self)
        let resultX = self.layer.get(Position.X.self)
        let resultY = self.layer.get(Position.Y.self)

        XCTAssertEqual(position.value, result, "Both should be equal")
        XCTAssertEqual(position.value?.x, resultX, "Both should be equal")
        XCTAssertEqual(position.value?.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.position, position.value, "Both should be equal")


        let x = Position.X(0.8)
        self.layer.set(x)
        let resultX2 = self.layer.get(Position.X.self)

        XCTAssertEqual(x.value, resultX2, "Both should be equal")

        let y = Position.Y(0.9)
        self.layer.set(y)
        let resultY2 = self.layer.get(Position.Y.self)

        XCTAssertEqual(y.value, resultY2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.position.x, x.value, "Both should be equal")
        XCTAssertEqual(self.layer.position.y, y.value, "Both should be equal")


        let z = Position.Z(0.8)
        self.layer.set(z)
        let resultZ = self.layer.get(Position.Z.self)

        XCTAssertEqual(z.value, resultZ, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.layer.zPosition, z.value, "Both should be equal")
    }

    func testRasterizationScale() {
        let scale = RasterizationScale(0.5)
        self.layer.set(scale)
        let result = self.layer.get(RasterizationScale.self)

        XCTAssertEqual(scale.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerScale = self.layer.rasterizationScale
        XCTAssertEqual(layerScale, scale.value, "Both should be equal")
    }

    func testShadowColor() {
        let shadowColor = ShadowColor(.purple)
        self.layer.set(shadowColor)
        let result = self.layer.get(ShadowColor.self)

        XCTAssertEqual(shadowColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerShadowColor = self.layer.shadowColor
        XCTAssertEqual(layerShadowColor, shadowColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.layer.get(ShadowColor.CGColor.self)

        XCTAssertEqual(shadowColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let shadowColor2 = ShadowColor.CGColor(UIColor.green.cgColor)
        self.layer.set(shadowColor2)
        let result3 = self.layer.get(ShadowColor.CGColor.self)

        XCTAssertEqual(shadowColor2.value, result3, "Both should be equal")
    }

    func testShadowOffset() {

        let shadowOffset = ShadowOffset(CGSize(width: 4, height: 6))
        self.layer.set(shadowOffset)
        let result = self.layer.get(ShadowOffset.self)
        let resultWidth = self.layer.get(ShadowOffset.Width.self)
        let resultHeight = self.layer.get(ShadowOffset.Height.self)

        XCTAssertEqual(shadowOffset.value, result, "Both should be equal")
        XCTAssertEqual(shadowOffset.value?.width, resultWidth, "Both should be equal")
        XCTAssertEqual(shadowOffset.value?.height, resultHeight, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOffset = self.layer.shadowOffset
        XCTAssertEqual(layerOffset, shadowOffset.value, "Both should be equal")


        let width = ShadowOffset.Width(0.8)
        self.layer.set(width)
        let resultWidth2 = self.layer.get(ShadowOffset.Width.self)

        XCTAssertEqual(width.value, resultWidth2, "Both should be equal")

        let height = ShadowOffset.Height(0.9)
        self.layer.set(height)
        let resultHeight2 = self.layer.get(ShadowOffset.Height.self)

        XCTAssertEqual(height.value, resultHeight2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOffsetWidth = self.layer.shadowOffset.width
        XCTAssertEqual(layerOffsetWidth, width.value, "Both should be equal")

        let layerOffsetHeight = self.layer.shadowOffset.height
        XCTAssertEqual(layerOffsetHeight, height.value, "Both should be equal")
    }

    func testShadowOpacity() {
        let opacity = ShadowOpacity(0.5)
        self.layer.set(opacity)
        let result = self.layer.get(ShadowOpacity.self)

        XCTAssertEqual(opacity.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerOpacity = self.layer.shadowOpacity
        XCTAssertEqual(layerOpacity, Float(opacity.value!), "Both should be equal")
    }

    func testShadowPath() {
        let path = ShadowPath(CGPath(rect: CGRect(x: 0, y: 0, width: 80, height: 140), transform: nil))
        self.layer.set(path)
        let result = self.layer.get(ShadowPath.self)

        XCTAssertEqual(path.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerPath = self.layer.shadowPath
        XCTAssertEqual(layerPath, path.value, "Both should be equal")
    }

    func testShadowRadius() {
        let radius = ShadowRadius(0.5)
        self.layer.set(radius)
        let result = self.layer.get(ShadowRadius.self)

        XCTAssertEqual(radius.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerRadius = self.layer.shadowRadius
        XCTAssertEqual(layerRadius, radius.value, "Both should be equal")
    }

    func testShouldRasterize() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let shouldRasterize = ShouldRasterize(state)
            self.layer.set(shouldRasterize)
            let result = self.layer.get(ShouldRasterize.self)

            XCTAssertEqual(shouldRasterize.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerShouldRasterize = self.layer.shouldRasterize
            XCTAssertEqual(layerShouldRasterize, shouldRasterize.value, "Both should be equal")
        }
    }

    func testStyle() {
        let style = Style(["Fred": 27])
        self.layer.set(style)
        let result = self.layer.get(Style.self)!

        XCTAssertEqual(style.value?["Fred"] as! Int, result["Fred"] as! Int, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerStyle = self.layer.style!["Fred"] as! Int
        XCTAssertEqual(layerStyle, style.value?["Fred"] as! Int, "Both should be equal")
    }

    func testSublayers() {
        let sublayers = Sublayers([CALayer(), CAShapeLayer()])
        self.layer.set(sublayers)
        let result = self.layer.get(Sublayers.self)

        XCTAssertEqual(sublayers.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSublayers = self.layer.sublayers
        XCTAssertEqual(layerSublayers, sublayers.value, "Both should be equal")
    }

    func testSublayerTransform() {

        let sublayerTransform = SublayerTransform(CATransform3D(m11: 0, m12: 1, m13: 2, m14: 3, m21: 4, m22: 5, m23: 6, m24: 7, m31: 8, m32: 9, m33: 0, m34: 1, m41: 2, m42: 3, m43: 4, m44: 5))
        self.layer.set(sublayerTransform)
        let result = self.layer.get(SublayerTransform.self)

        let areEqual = CATransform3DEqualToTransform(sublayerTransform.value!, result!)
        XCTAssertTrue(areEqual, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerTransform = self.layer.sublayerTransform
        XCTAssertTrue(CATransform3DEqualToTransform(layerTransform, sublayerTransform.value!), "Both should be equal")


        let rotationTransform = SublayerTransform.Rotation(0.5)
        self.layer.set(rotationTransform)

        // test to 3 decimal places

        let rotationResult = self.round(self.layer.get(SublayerTransform.Rotation.self)!, 3)

        XCTAssertEqual(self.round(rotationTransform.value!, 3), rotationResult, "Both should be equal")

        let rotationTransformX = SublayerTransform.Rotation.X(0.5)
        self.layer.set(rotationTransformX)
        let rotationXResult = self.round(self.layer.get(SublayerTransform.Rotation.X.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformX.value!, 3), rotationXResult, "Both should be equal")

        let rotationTransformY = SublayerTransform.Rotation.Y(0.5)
        self.layer.set(rotationTransformY)
        let rotationYResult = self.round(self.layer.get(SublayerTransform.Rotation.Y.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformY.value!, 3), rotationYResult, "Both should be equal")

        let rotationTransformZ = SublayerTransform.Rotation.Z(0.5)
        self.layer.set(rotationTransformZ)
        let rotationZResult = self.round(self.layer.get(SublayerTransform.Rotation.Z.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformZ.value!, 3), rotationZResult, "Both should be equal")


        let scaleTransform = SublayerTransform.Scale(0.7)
        self.layer.set(scaleTransform)
        let scaleResult = self.round(self.layer.get(SublayerTransform.Scale.self)!, 3)

        XCTAssertEqual(self.round(scaleTransform.value!, 3), scaleResult, "Both should be equal")

        let scaleTransformX = SublayerTransform.Scale.X(0.7)
        self.layer.set(scaleTransformX)
        let scaleXResult = self.round(self.layer.get(SublayerTransform.Scale.X.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformX.value!, 3), scaleXResult, "Both should be equal")

        let scaleTransformY = SublayerTransform.Scale.Y(0.7)
        self.layer.set(scaleTransformY)
        let scaleYResult = self.round(self.layer.get(SublayerTransform.Scale.Y.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformY.value!, 3), scaleYResult, "Both should be equal")

        let scaleTransformZ = SublayerTransform.Scale.Z(0.7)
        self.layer.set(scaleTransformZ)
        let scaleZResult = self.round(self.layer.get(SublayerTransform.Scale.Z.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformZ.value!, 3), scaleZResult, "Both should be equal")


        let translationTransform = SublayerTransform.Translation(CGSize(width: 0.4, height: 0.8))
        self.layer.set(translationTransform)
        let translationResult = self.layer.get(SublayerTransform.Translation.self)

        XCTAssertEqual(translationTransform.value, translationResult, "Both should be equal")

        let translationTransformX = SublayerTransform.Translation.X(0.9)
        self.layer.set(translationTransformX)
        let translationXResult = self.round(self.layer.get(SublayerTransform.Translation.X.self)!, 3)

        XCTAssertEqual(self.round(translationTransformX.value!, 3), translationXResult, "Both should be equal")

        let translationTransformY = SublayerTransform.Translation.Y(0.9)
        self.layer.set(translationTransformY)
        let translationYResult = self.round(self.layer.get(SublayerTransform.Translation.Y.self)!, 3)

        XCTAssertEqual(self.round(translationTransformY.value!, 3), translationYResult, "Both should be equal")

        let translationTransformZ = SublayerTransform.Translation.Z(0.9)
        self.layer.set(translationTransformZ)
        let translationZResult = self.round(self.layer.get(SublayerTransform.Translation.Z.self)!, 3)

        XCTAssertEqual(self.round(translationTransformZ.value!, 3), translationZResult, "Both should be equal")
    }

    func testSuperlayer() {
        let superlayer = self.layer.get(Superlayer.self)
        let layerSuperlayer = self.layer.superlayer
        XCTAssertEqual(layerSuperlayer, superlayer, "Both should be equal")
    }

    func testTransform() {

        let transform = Transform(CATransform3D(m11: 0, m12: 1, m13: 2, m14: 3, m21: 4, m22: 5, m23: 6, m24: 7, m31: 8, m32: 9, m33: 0, m34: 1, m41: 2, m42: 3, m43: 4, m44: 5))
        self.layer.set(transform)
        let result = self.layer.get(Transform.self)

        let areEqual = CATransform3DEqualToTransform(transform.value!, result!)
        XCTAssertTrue(areEqual, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerTransform = self.layer.transform
        XCTAssertTrue(CATransform3DEqualToTransform(layerTransform, transform.value!), "Both should be equal")


        let rotationTransform = Transform.Rotation(0.5)
        self.layer.set(rotationTransform)

        // test to 3 decimal places

        let rotationResult = self.round(self.layer.get(Transform.Rotation.self)!, 3)

        XCTAssertEqual(self.round(rotationTransform.value!, 3), rotationResult, "Both should be equal")

        let rotationTransformX = Transform.Rotation.X(0.5)
        self.layer.set(rotationTransformX)
        let rotationXResult = self.round(self.layer.get(Transform.Rotation.X.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformX.value!, 3), rotationXResult, "Both should be equal")

        let rotationTransformY = Transform.Rotation.Y(0.5)
        self.layer.set(rotationTransformY)
        let rotationYResult = self.round(self.layer.get(Transform.Rotation.Y.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformY.value!, 3), rotationYResult, "Both should be equal")

        let rotationTransformZ = Transform.Rotation.Z(0.5)
        self.layer.set(rotationTransformZ)
        let rotationZResult = self.round(self.layer.get(Transform.Rotation.Z.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformZ.value!, 3), rotationZResult, "Both should be equal")


        let scaleTransform = Transform.Scale(0.7)
        self.layer.set(scaleTransform)
        let scaleResult = self.round(self.layer.get(Transform.Scale.self)!, 3)

        XCTAssertEqual(self.round(scaleTransform.value!, 3), scaleResult, "Both should be equal")

        let scaleTransformX = Transform.Rotation.X(0.7)
        self.layer.set(scaleTransformX)
        let scaleXResult = self.round(self.layer.get(Transform.Scale.X.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformX.value!, 3), scaleXResult, "Both should be equal")

        let scaleTransformY = Transform.Scale.Y(0.7)
        self.layer.set(scaleTransformY)
        let scaleYResult = self.round(self.layer.get(Transform.Scale.Y.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformY.value!, 3), scaleYResult, "Both should be equal")

        let scaleTransformZ = Transform.Scale.Z(0.7)
        self.layer.set(scaleTransformZ)
        let scaleZResult = self.round(self.layer.get(Transform.Scale.Z.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformZ.value!, 3), scaleZResult, "Both should be equal")


        let translationTransform = Transform.Translation(CGSize(width: 0.4, height: 0.8))
        self.layer.set(translationTransform)
        let translationResult = self.layer.get(Transform.Translation.self)

        XCTAssertEqual(translationTransform.value, translationResult, "Both should be equal")

        let translationTransformX = Transform.Translation.X(0.9)
        self.layer.set(translationTransformX)
        let translationXResult = self.round(self.layer.get(Transform.Translation.X.self)!, 3)

        XCTAssertEqual(self.round(translationTransformX.value!, 3), translationXResult, "Both should be equal")

        let translationTransformY = Transform.Translation.Y(0.9)
        self.layer.set(translationTransformY)
        let translationYResult = self.round(self.layer.get(Transform.Translation.Y.self)!, 3)

        XCTAssertEqual(self.round(translationTransformY.value!, 3), translationYResult, "Both should be equal")

        let translationTransformZ = Transform.Translation.Z(0.9)
        self.layer.set(translationTransformZ)
        let translationZResult = self.round(self.layer.get(Transform.Translation.Z.self)!, 3)

        XCTAssertEqual(self.round(translationTransformZ.value!, 3), translationZResult, "Both should be equal")
    }

    func testVisibleRect() {
        let rect = self.layer.get(VisibleRect.self)
        let layerRect = self.layer.visibleRect
        XCTAssertEqual(layerRect, rect, "Both should be equal")
    }


    // MARK: - CAShapeLayer properties

    func testPath() {
        let path = Path.CGPath(CGPath(rect: CGRect(x: 0, y: 0, width: 350, height: 280), transform: nil))
        self.shapeLayer.set(path)
        let result = self.shapeLayer.get(Path.CGPath.self)

        XCTAssertEqual(path.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerPath = self.shapeLayer.path
        XCTAssertEqual(layerPath, path.value, "Both should be equal")
    }

    func testFillColor() {
        let fillColor = FillColor(.red)
        self.shapeLayer.set(fillColor)
        let result = self.shapeLayer.get(FillColor.self)

        XCTAssertEqual(fillColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let color = self.shapeLayer.fillColor
        XCTAssertEqual(color, fillColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.shapeLayer.get(FillColor.CGColor.self)

        XCTAssertEqual(fillColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let fillColor2 = FillColor.CGColor(UIColor.green.cgColor)
        self.shapeLayer.set(fillColor2)
        let result3 = self.shapeLayer.get(FillColor.CGColor.self)

        XCTAssertEqual(fillColor2.value, result3, "Both should be equal")
    }

    func testFillRule() {

        let rules: [CAShapeLayerFillRule] = [.evenOdd, .nonZero]

        rules.forEach { rule in
            let fillRule = FillRule(rule)
            self.shapeLayer.set(fillRule)
            let result = self.shapeLayer.get(FillRule.self)

            XCTAssertEqual(fillRule.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let rule = self.shapeLayer.fillRule
            XCTAssertEqual(rule, fillRule.value, "Both should be equal")
        }
    }

    func testLineCap() {

        let caps: [CAShapeLayerLineCap] = [.butt, .round, .square]

        caps.forEach { cap in
            let lineCap = LineCap(cap)
            self.shapeLayer.set(lineCap)
            let result = self.shapeLayer.get(LineCap.self)

            XCTAssertEqual(lineCap.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerLineCap = self.shapeLayer.lineCap
            XCTAssertEqual(layerLineCap, lineCap.value, "Both should be equal")
        }
    }

    func testLineDashPattern() {
        let linePattern = LineDashPattern([2,5,7])
        self.shapeLayer.set(linePattern)
        let result = self.shapeLayer.get(LineDashPattern.self)

        XCTAssertEqual(linePattern.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerLinePattern = self.shapeLayer.lineDashPattern?.map { $0.intValue }
        XCTAssertEqual(layerLinePattern, linePattern.value, "Both should be equal")
    }

    func testLineDashPhase() {
        let lineDashPhase = LineDashPhase(2)
        self.shapeLayer.set(lineDashPhase)
        let result = self.shapeLayer.get(LineDashPhase.self)

        XCTAssertEqual(lineDashPhase.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let phase = self.shapeLayer.lineDashPhase
        XCTAssertEqual(phase, lineDashPhase.value, "Both should be equal")
    }

    func testLineJoin() {

        let joins: [CAShapeLayerLineJoin] = [.bevel, .miter, .round]

        joins.forEach { join in
            let lineJoin = LineJoin(join)
            self.shapeLayer.set(lineJoin)
            let result = self.shapeLayer.get(LineJoin.self)

            XCTAssertEqual(lineJoin.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerLineJoin = self.shapeLayer.lineJoin
            XCTAssertEqual(layerLineJoin, lineJoin.value, "Both should be equal")
        }
    }

    func testLineWidth() {
        let lineWidth = LineWidth(2)
        self.shapeLayer.set(lineWidth)
        let result = self.shapeLayer.get(LineWidth.self)

        XCTAssertEqual(lineWidth.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let width = self.shapeLayer.lineWidth
        XCTAssertEqual(width, lineWidth.value, "Both should be equal")
    }

    func testMiterLimit() {
        let miterLimit = MiterLimit(2)
        self.shapeLayer.set(miterLimit)
        let result = self.shapeLayer.get(MiterLimit.self)

        XCTAssertEqual(miterLimit.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let limit = self.shapeLayer.miterLimit
        XCTAssertEqual(limit, miterLimit.value, "Both should be equal")
    }

    func testStrokeColor() {
        let strokeColor = StrokeColor(.green)
        self.shapeLayer.set(strokeColor)
        let result = self.shapeLayer.get(StrokeColor.self)

        XCTAssertEqual(strokeColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let color = self.shapeLayer.strokeColor
        XCTAssertEqual(color, strokeColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.shapeLayer.get(StrokeColor.CGColor.self)

        XCTAssertEqual(strokeColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let strokeColor2 = StrokeColor.CGColor(UIColor.green.cgColor)
        self.shapeLayer.set(strokeColor2)
        let result3 = self.shapeLayer.get(StrokeColor.CGColor.self)

        XCTAssertEqual(strokeColor2.value, result3, "Both should be equal")
    }

    func testStrokeStart() {
        let strokeStart = StrokeStart(0.1)
        self.shapeLayer.set(strokeStart)
        let result = self.shapeLayer.get(StrokeStart.self)

        XCTAssertEqual(strokeStart.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let start = self.shapeLayer.strokeStart
        XCTAssertEqual(start, strokeStart.value, "Both should be equal")
    }

    func testStrokeEnd() {
        let strokeEnd = StrokeEnd(0.9)
        self.shapeLayer.set(strokeEnd)
        let result = self.shapeLayer.get(StrokeEnd.self)

        XCTAssertEqual(strokeEnd.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let end = self.shapeLayer.strokeEnd
        XCTAssertEqual(end, strokeEnd.value, "Both should be equal")
    }


    // MARK: - CAEmitterLayer properties

    func testEmitterCells() {
        let cells: [CAEmitterCell] = [CAEmitterCell(), CAEmitterCell()]
        let emitterCells = EmitterCells(cells)
        self.emitterLayer.set(emitterCells)
        let result = self.emitterLayer.get(EmitterCells.self)

        XCTAssertEqual(emitterCells.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerEmitterCells = self.emitterLayer.emitterCells
        XCTAssertEqual(layerEmitterCells, emitterCells.value, "Both should be equal")
    }

    func testEmitterDepth() {
        let emitterDepth = EmitterDepth(2)
        self.emitterLayer.set(emitterDepth)
        let result = self.emitterLayer.get(EmitterDepth.self)

        XCTAssertEqual(emitterDepth.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerEmitterDepth = self.emitterLayer.emitterDepth
        XCTAssertEqual(layerEmitterDepth, emitterDepth.value, "Both should be equal")
    }

    func testEmitterPreservesDepth() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let emitterPreservesDepth = EmitterPreservesDepth(state)
            self.emitterLayer.set(emitterPreservesDepth)
            let result = self.emitterLayer.get(EmitterPreservesDepth.self)

            XCTAssertEqual(emitterPreservesDepth.value, result, "Both should be equal")
            
            // test that the setter is actually setting the property, not just some random keyPath
            let layerEmitterPreservesDepth = self.emitterLayer.preservesDepth
            XCTAssertEqual(layerEmitterPreservesDepth, emitterPreservesDepth.value, "Both should be equal")
        }
    }

    func testEmitterMode() {

        let modes: [CAEmitterLayerEmitterMode] = [.outline, .points, .surface, .volume]

        modes.forEach { mode in
            let emitterMode = EmitterMode(mode)
            self.emitterLayer.set(emitterMode)
            let result = self.emitterLayer.get(EmitterMode.self)

            XCTAssertEqual(emitterMode.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerEmitterMode = self.emitterLayer.emitterMode
            XCTAssertEqual(layerEmitterMode, emitterMode.value, "Both should be equal")
        }
    }

    func testEmitterShape() {

        let shapes: [CAEmitterLayerEmitterShape] = [.circle, .cuboid, .line, .point, .rectangle, .sphere]

        shapes.forEach { shape in
            let emitterShape = EmitterShape(shape)
            self.emitterLayer.set(emitterShape)
            let result = self.emitterLayer.get(EmitterShape.self)

            XCTAssertEqual(emitterShape.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerEmitterShape = self.emitterLayer.emitterShape
            XCTAssertEqual(layerEmitterShape, emitterShape.value, "Both should be equal")
        }
    }

    func testEmitterSize() {

        let emitterSize = EmitterSize(CGSize(width: 4, height: 6))
        self.emitterLayer.set(emitterSize)
        let result = self.emitterLayer.get(EmitterSize.self)
        let resultWidth = self.emitterLayer.get(EmitterSize.Width.self)
        let resultHeight = self.emitterLayer.get(EmitterSize.Height.self)

        XCTAssertEqual(emitterSize.value, result, "Both should be equal")
        XCTAssertEqual(emitterSize.value?.width, resultWidth, "Both should be equal")
        XCTAssertEqual(emitterSize.value?.height, resultHeight, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let size = self.emitterLayer.emitterSize
        XCTAssertEqual(size, emitterSize.value, "Both should be equal")


        let width = EmitterSize.Width(0.8)
        self.emitterLayer.set(width)
        let resultWidth2 = self.emitterLayer.get(EmitterSize.Width.self)

        XCTAssertEqual(width.value, resultWidth2, "Both should be equal")

        let height = EmitterSize.Height(0.9)
        self.emitterLayer.set(height)
        let resultHeight2 = self.emitterLayer.get(EmitterSize.Height.self)

        XCTAssertEqual(height.value, resultHeight2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let sizeWidth = self.emitterLayer.emitterSize.width
        XCTAssertEqual(sizeWidth, width.value, "Both should be equal")

        let sizeHeight = self.emitterLayer.emitterSize.height
        XCTAssertEqual(sizeHeight, height.value, "Both should be equal")
    }

    func testEmitterPosition() {

        let position = EmitterPosition(CGPoint(x: 0.5, y: 0.4))
        self.emitterLayer.set(position)
        let result = self.emitterLayer.get(EmitterPosition.self)
        let resultX = self.emitterLayer.get(EmitterPosition.X.self)
        let resultY = self.emitterLayer.get(EmitterPosition.Y.self)

        XCTAssertEqual(position.value, result, "Both should be equal")
        XCTAssertEqual(position.value?.x, resultX, "Both should be equal")
        XCTAssertEqual(position.value?.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.emitterLayer.emitterPosition, position.value, "Both should be equal")


        let x = EmitterPosition.X(0.8)
        self.emitterLayer.set(x)
        let resultX2 = self.emitterLayer.get(EmitterPosition.X.self)

        XCTAssertEqual(x.value, resultX2, "Both should be equal")

        let y = EmitterPosition.Y(0.9)
        self.emitterLayer.set(y)
        let resultY2 = self.emitterLayer.get(EmitterPosition.Y.self)

        XCTAssertEqual(y.value, resultY2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.emitterLayer.emitterPosition.x, x.value, "Both should be equal")
        XCTAssertEqual(self.emitterLayer.emitterPosition.y, y.value, "Both should be equal")


        let z = EmitterPosition.Z(0.8)
        self.emitterLayer.set(z)
        let resultZ = self.emitterLayer.get(EmitterPosition.Z.self)

        XCTAssertEqual(z.value, resultZ, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.emitterLayer.emitterZPosition, z.value, "Both should be equal")
    }

    func testBirthRate() {
        let birthRate = BirthRate(0.1)
        self.emitterLayer.set(birthRate)
        let result = self.emitterLayer.get(BirthRate.self)

        XCTAssertEqual(birthRate.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerBirthRate = self.emitterLayer.birthRate
        XCTAssertEqual(layerBirthRate, birthRate.value, "Both should be equal")
    }

    func testLifetime() {
        let lifetime = Lifetime(5)
        self.emitterLayer.set(lifetime)
        let result = self.emitterLayer.get(Lifetime.self)

        XCTAssertEqual(lifetime.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerLifetime = self.emitterLayer.lifetime
        XCTAssertEqual(layerLifetime, Float(lifetime.value!), "Both should be equal")
    }

    func testRenderMode() {

        let modes: [CAEmitterLayerRenderMode] = [.additive, .backToFront, .oldestFirst, .oldestLast, .unordered]

        modes.forEach { mode in
            let renderMode = RenderMode(mode)
            self.emitterLayer.set(renderMode)
            let result = self.emitterLayer.get(RenderMode.self)

            XCTAssertEqual(renderMode.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerRenderMode = self.emitterLayer.renderMode
            XCTAssertEqual(layerRenderMode, renderMode.value, "Both should be equal")
        }
    }

    func testScale() {
        let scale = Scale(0.5)
        self.emitterLayer.set(scale)
        let result = self.emitterLayer.get(Scale.self)

        XCTAssertEqual(scale.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerScale = self.emitterLayer.scale
        XCTAssertEqual(layerScale, Float(scale.value!), "Both should be equal")
    }

    func testSeed() {
        let seed = Seed(4)
        self.emitterLayer.set(seed)
        let result = self.emitterLayer.get(Seed.self)

        XCTAssertEqual(seed.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSeed = self.emitterLayer.seed
        XCTAssertEqual(layerSeed, seed.value, "Both should be equal")
    }

    func testSpin() {
        let spin = Spin(0.1)
        self.emitterLayer.set(spin)
        let result = self.emitterLayer.get(Spin.self)

        XCTAssertEqual(spin.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerSpin = self.emitterLayer.spin
        XCTAssertEqual(layerSpin, Float(spin.value!), "Both should be equal")
    }

    func testVelocity() {
        let velocity = Velocity(0.5)
        self.emitterLayer.set(velocity)
        let result = self.emitterLayer.get(Velocity.self)

        XCTAssertEqual(velocity.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerVelocity = self.emitterLayer.velocity
        XCTAssertEqual(layerVelocity, velocity.value, "Both should be equal")
    }


    // MARK: - CAGradientLayer properties

    func testColors() {
        let colors = Colors([.red, .blue, .green])
        self.gradientLayer.set(colors)
        let result = self.gradientLayer.get(Colors.self)

        XCTAssertEqual(colors.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerColors = (self.gradientLayer.colors as! [CGColor]).map { UIColor(cgColor: $0) }
        XCTAssertEqual(layerColors, colors.value, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.gradientLayer.get(Colors.CGColors.self)

        XCTAssertEqual(colors.value?.map { $0.cgColor }, result2, "Both should be equal")

        // then setter & getter

        let colors2 = Colors.CGColors([UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.yellow.cgColor])
        self.gradientLayer.set(colors2)
        let result3 = self.gradientLayer.get(Colors.CGColors.self)

        XCTAssertEqual(colors2.value, result3, "Both should be equal")
    }

    func testLocations() {
        let locations = Locations([0.1, 0.4, 0.7, 1])
        self.gradientLayer.set(locations)
        let result = self.gradientLayer.get(Locations.self)

        XCTAssertEqual(locations.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerLocations: [CGFloat] = self.gradientLayer.locations!.map { CGFloat($0.doubleValue) }

        XCTAssertEqual(layerLocations, locations.value, "Both should be equal")
    }

    func testEndPoint() {

        let endPoint = EndPoint(CGPoint(x: 0.5, y: 0.4))
        self.gradientLayer.set(endPoint)
        let result = self.gradientLayer.get(EndPoint.self)
        let resultX = self.gradientLayer.get(EndPoint.X.self)
        let resultY = self.gradientLayer.get(EndPoint.Y.self)

        XCTAssertEqual(endPoint.value, result, "Both should be equal")
        XCTAssertEqual(endPoint.value?.x, resultX, "Both should be equal")
        XCTAssertEqual(endPoint.value?.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.gradientLayer.endPoint, endPoint.value, "Both should be equal")


        let x = EndPoint.X(0.8)
        self.gradientLayer.set(x)
        let resultX2 = self.gradientLayer.get(EndPoint.X.self)

        XCTAssertEqual(x.value, resultX2, "Both should be equal")

        let y = EndPoint.Y(0.9)
        self.gradientLayer.set(y)
        let resultY2 = self.gradientLayer.get(EndPoint.Y.self)

        XCTAssertEqual(y.value, resultY2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.gradientLayer.endPoint.x, x.value, "Both should be equal")
        XCTAssertEqual(self.gradientLayer.endPoint.y, y.value, "Both should be equal")
    }

    func testStartPoint() {

        let startPoint = StartPoint(CGPoint(x: 0.5, y: 0.4))
        self.gradientLayer.set(startPoint)
        let result = self.gradientLayer.get(StartPoint.self)
        let resultX = self.gradientLayer.get(StartPoint.X.self)
        let resultY = self.gradientLayer.get(StartPoint.Y.self)

        XCTAssertEqual(startPoint.value, result, "Both should be equal")
        XCTAssertEqual(startPoint.value?.x, resultX, "Both should be equal")
        XCTAssertEqual(startPoint.value?.y, resultY, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.gradientLayer.startPoint, startPoint.value, "Both should be equal")


        let x = StartPoint.X(0.8)
        self.gradientLayer.set(x)
        let resultX2 = self.gradientLayer.get(StartPoint.X.self)

        XCTAssertEqual(x.value, resultX2, "Both should be equal")

        let y = StartPoint.Y(0.9)
        self.gradientLayer.set(y)
        let resultY2 = self.gradientLayer.get(StartPoint.Y.self)

        XCTAssertEqual(y.value, resultY2, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        XCTAssertEqual(self.gradientLayer.startPoint.x, x.value, "Both should be equal")
        XCTAssertEqual(self.gradientLayer.startPoint.y, y.value, "Both should be equal")
    }

    @available(iOS 12.0, *)
    func testGradientType() {

        let gradientTypes: [CAGradientLayerType] = [.axial, .conic, .radial]

        gradientTypes.forEach { type in
            let type = GradientType(type)
            self.gradientLayer.set(type)
            let result = self.gradientLayer.get(GradientType.self)

            XCTAssertEqual(type.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            XCTAssertEqual(self.gradientLayer.type, type.value, "Both should be equal")
        }
    }


    // MARK: - CAReplicatorLayer properties

    func testInstanceColor() {
        let instanceColor = InstanceColor(.red)
        self.replicatorLayer.set(instanceColor)
        let result = self.replicatorLayer.get(InstanceColor.self)

        XCTAssertEqual(instanceColor.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceColor = self.replicatorLayer.instanceColor
        XCTAssertEqual(layerInstanceColor, instanceColor.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.replicatorLayer.get(InstanceColor.CGColor.self)

        XCTAssertEqual(instanceColor.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let instanceColor2 = InstanceColor.CGColor(UIColor.green.cgColor)
        self.replicatorLayer.set(instanceColor2)
        let result3 = self.replicatorLayer.get(InstanceColor.CGColor.self)

        XCTAssertEqual(instanceColor2.value, result3, "Both should be equal")
    }

    func testInstanceCount() {
        let instanceCount = InstanceCount(5)
        self.replicatorLayer.set(instanceCount)
        let result = self.replicatorLayer.get(InstanceCount.self)

        XCTAssertEqual(instanceCount.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceCount = self.replicatorLayer.instanceCount
        XCTAssertEqual(layerInstanceCount, instanceCount.value, "Both should be equal")
    }

    func testInstanceDelay() {
        let instanceDelay = InstanceDelay(5)
        self.replicatorLayer.set(instanceDelay)
        let result = self.replicatorLayer.get(InstanceDelay.self)

        XCTAssertEqual(instanceDelay.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceDelay = self.replicatorLayer.instanceDelay
        XCTAssertEqual(layerInstanceDelay, instanceDelay.value, "Both should be equal")
    }

    func testInstanceTransform() {

        let transform = InstanceTransform(CATransform3D(m11: 0, m12: 1, m13: 2, m14: 3, m21: 4, m22: 5, m23: 6, m24: 7, m31: 8, m32: 9, m33: 0, m34: 1, m41: 2, m42: 3, m43: 4, m44: 5))
        self.replicatorLayer.set(transform)
        let result = self.replicatorLayer.get(InstanceTransform.self)

        let areEqual = CATransform3DEqualToTransform(transform.value!, result!)
        XCTAssertTrue(areEqual, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerTransform = self.replicatorLayer.instanceTransform
        XCTAssertTrue(CATransform3DEqualToTransform(layerTransform, transform.value!), "Both should be equal")


        let rotationTransform = InstanceTransform.Rotation(0.5)
        self.replicatorLayer.set(rotationTransform)

        // test to 3 decimal places

        let rotationResult = self.round(self.replicatorLayer.get(InstanceTransform.Rotation.self)!, 3)

        XCTAssertEqual(self.round(rotationTransform.value!, 3), rotationResult, "Both should be equal")

        let rotationTransformX = InstanceTransform.Rotation.X(0.5)
        self.replicatorLayer.set(rotationTransformX)
        let rotationXResult = self.round(self.replicatorLayer.get(InstanceTransform.Rotation.X.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformX.value!, 3), rotationXResult, "Both should be equal")

        let rotationTransformY = InstanceTransform.Rotation.Y(0.5)
        self.replicatorLayer.set(rotationTransformY)
        let rotationYResult = self.round(self.replicatorLayer.get(InstanceTransform.Rotation.Y.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformY.value!, 3), rotationYResult, "Both should be equal")

        let rotationTransformZ = InstanceTransform.Rotation.Z(0.5)
        self.replicatorLayer.set(rotationTransformZ)
        let rotationZResult = self.round(self.replicatorLayer.get(InstanceTransform.Rotation.Z.self)!, 3)

        XCTAssertEqual(self.round(rotationTransformZ.value!, 3), rotationZResult, "Both should be equal")


        let scaleTransform = InstanceTransform.Scale(0.7)
        self.replicatorLayer.set(scaleTransform)
        let scaleResult = self.round(self.replicatorLayer.get(InstanceTransform.Scale.self)!, 3)

        XCTAssertEqual(self.round(scaleTransform.value!, 3), scaleResult, "Both should be equal")

        let scaleTransformX = InstanceTransform.Rotation.X(0.7)
        self.replicatorLayer.set(scaleTransformX)
        let scaleXResult = self.round(self.replicatorLayer.get(InstanceTransform.Scale.X.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformX.value!, 3), scaleXResult, "Both should be equal")

        let scaleTransformY = InstanceTransform.Scale.Y(0.7)
        self.replicatorLayer.set(scaleTransformY)
        let scaleYResult = self.round(self.replicatorLayer.get(InstanceTransform.Scale.Y.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformY.value!, 3), scaleYResult, "Both should be equal")

        let scaleTransformZ = InstanceTransform.Scale.Z(0.7)
        self.replicatorLayer.set(scaleTransformZ)
        let scaleZResult = self.round(self.replicatorLayer.get(InstanceTransform.Scale.Z.self)!, 3)

        XCTAssertEqual(self.round(scaleTransformZ.value!, 3), scaleZResult, "Both should be equal")


        let translationTransform = InstanceTransform.Translation(CGSize(width: 0.4, height: 0.8))
        self.replicatorLayer.set(translationTransform)
        let translationResult = self.replicatorLayer.get(InstanceTransform.Translation.self)

        XCTAssertEqual(translationTransform.value, translationResult, "Both should be equal")

        let translationTransformX = InstanceTransform.Translation.X(0.9)
        self.replicatorLayer.set(translationTransformX)
        let translationXResult = self.round(self.replicatorLayer.get(InstanceTransform.Translation.X.self)!, 3)

        XCTAssertEqual(self.round(translationTransformX.value!, 3), translationXResult, "Both should be equal")

        let translationTransformY = InstanceTransform.Translation.Y(0.9)
        self.replicatorLayer.set(translationTransformY)
        let translationYResult = self.round(self.replicatorLayer.get(InstanceTransform.Translation.Y.self)!, 3)

        XCTAssertEqual(self.round(translationTransformY.value!, 3), translationYResult, "Both should be equal")

        let translationTransformZ = InstanceTransform.Translation.Z(0.9)
        self.replicatorLayer.set(translationTransformZ)
        let translationZResult = self.round(self.replicatorLayer.get(InstanceTransform.Translation.Z.self)!, 3)

        XCTAssertEqual(self.round(translationTransformZ.value!, 3), translationZResult, "Both should be equal")
    }

    func testInstanceRedOffset() {
        let instanceOffset = InstanceRedOffset(0.5)
        self.replicatorLayer.set(instanceOffset)
        let result = self.replicatorLayer.get(InstanceRedOffset.self)

        XCTAssertEqual(instanceOffset.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceOffset = self.replicatorLayer.instanceRedOffset
        XCTAssertEqual(layerInstanceOffset, instanceOffset.value, "Both should be equal")
    }

    func testInstanceGreenOffset() {
        let instanceOffset = InstanceGreenOffset(0.6)
        self.replicatorLayer.set(instanceOffset)
        let result = self.replicatorLayer.get(InstanceGreenOffset.self)

        XCTAssertEqual(instanceOffset.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceOffset = self.replicatorLayer.instanceGreenOffset
        XCTAssertEqual(layerInstanceOffset, instanceOffset.value, "Both should be equal")
    }

    func testInstanceBlueOffset() {
        let instanceOffset = InstanceBlueOffset(0.7)
        self.replicatorLayer.set(instanceOffset)
        let result = self.replicatorLayer.get(InstanceBlueOffset.self)

        XCTAssertEqual(instanceOffset.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceOffset = self.replicatorLayer.instanceBlueOffset
        XCTAssertEqual(layerInstanceOffset, instanceOffset.value, "Both should be equal")
    }

    func testInstanceAlphaOffset() {
        let instanceOffset = InstanceAlphaOffset(0.8)
        self.replicatorLayer.set(instanceOffset)
        let result = self.replicatorLayer.get(InstanceAlphaOffset.self)

        XCTAssertEqual(instanceOffset.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerInstanceOffset = self.replicatorLayer.instanceAlphaOffset
        XCTAssertEqual(layerInstanceOffset, instanceOffset.value, "Both should be equal")
    }

    func testReplicatorPreservesDepth() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let preservesDepth = ReplicatorPreservesDepth(state)
            self.replicatorLayer.set(preservesDepth)
            let result = self.replicatorLayer.get(ReplicatorPreservesDepth.self)

            XCTAssertEqual(preservesDepth.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerPreservesDepth = self.replicatorLayer.preservesDepth
            XCTAssertEqual(layerPreservesDepth, preservesDepth.value, "Both should be equal")
        }
    }


    // MARK: - CATextLayer properties

    func testAlignmentMode() {

        let modes: [CATextLayerAlignmentMode] = [.center, .justified, .left, .natural, .right]

        modes.forEach { mode in
            let alignmentMode = AlignmentMode(mode)
            self.textLayer.set(alignmentMode)
            let result = self.textLayer.get(AlignmentMode.self)

            XCTAssertEqual(alignmentMode.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerAlignmentMode = self.textLayer.alignmentMode
            XCTAssertEqual(layerAlignmentMode, alignmentMode.value, "Both should be equal")
        }
    }

    func testAllowsFontSubpixelQuantization() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let allowsFontSubpixelQuantization = AllowsFontSubpixelQuantization(state)
            self.textLayer.set(allowsFontSubpixelQuantization)
            let result = self.textLayer.get(AllowsFontSubpixelQuantization.self)

            XCTAssertEqual(allowsFontSubpixelQuantization.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerAllowsFontSubpixelQuantization = self.textLayer.allowsFontSubpixelQuantization
            XCTAssertEqual(layerAllowsFontSubpixelQuantization, allowsFontSubpixelQuantization.value, "Both should be equal")
        }
    }

    func testFont() {
        let font = Font(.boldSystemFont(ofSize: 22))
        self.textLayer.set(font)
        let result = self.textLayer.get(Font.self)

        let fontAttributes = font.value!.fontDescriptor.fontAttributes
        let resultAttributes = result!.fontDescriptor.fontAttributes

        XCTAssertEqual(fontAttributes[.size] as! CGFloat, resultAttributes[.size] as! CGFloat, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerFont: CTFont = self.textLayer.font as! CTFont
        let layerFontAttributes = (layerFont as UIFont).fontDescriptor.fontAttributes

        XCTAssertEqual(fontAttributes[.size] as! CGFloat, layerFontAttributes[.size] as! CGFloat, "Both should be equal")
    }

    func testFontSize() {
        let fontSize = FontSize(30)
        self.textLayer.set(fontSize)
        let result = self.textLayer.get(FontSize.self)

        XCTAssertEqual(fontSize.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerFontSize = self.textLayer.fontSize
        XCTAssertEqual(layerFontSize, fontSize.value, "Both should be equal")
    }

    func testForegroundColor() {
        let color = ForegroundColor(.white)
        self.textLayer.set(color)
        let result = self.textLayer.get(ForegroundColor.self)

        XCTAssertEqual(color.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerColor = self.textLayer.foregroundColor
        XCTAssertEqual(layerColor, color.value?.cgColor, "Both should be equal")


        // also test the CGColor version

        // first the getter after setting using UIColor

        let result2 = self.textLayer.get(ForegroundColor.CGColor.self)

        XCTAssertEqual(color.value?.cgColor, result2, "Both should be equal")

        // then setter & getter

        let color2 = ForegroundColor.CGColor(UIColor.green.cgColor)
        self.textLayer.set(color2)
        let result3 = self.textLayer.get(ForegroundColor.CGColor.self)

        XCTAssertEqual(color2.value, result3, "Both should be equal")
    }

    func testString() {
        let string = TextString("Hello")
        self.textLayer.set(string)
        let result = self.textLayer.get(TextString.self)

        XCTAssertEqual(string.value, result, "Both should be equal")

        // test that the setter is actually setting the property, not just some random keyPath
        let layerString = self.textLayer.string as? String
        XCTAssertEqual(layerString, string.value, "Both should be equal")
    }

    func testTruncationMode() {

        let modes: [CATextLayerTruncationMode] = [.end, .middle, .none, .start]

        modes.forEach { mode in
            let mode = TruncationMode(mode)
            self.textLayer.set(mode)
            let result = self.textLayer.get(TruncationMode.self)

            XCTAssertEqual(mode.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerMode = self.textLayer.truncationMode
            XCTAssertEqual(layerMode, mode.value, "Both should be equal")
        }
    }

    func testWrapped() {

        let states: [Bool] = [true, false]

        states.forEach { state in
            let wrapped = Wrapped(state)
            self.textLayer.set(wrapped)
            let result = self.textLayer.get(Wrapped.self)

            XCTAssertEqual(wrapped.value, result, "Both should be equal")

            // test that the setter is actually setting the property, not just some random keyPath
            let layerWrapped = self.textLayer.isWrapped
            XCTAssertEqual(layerWrapped, wrapped.value, "Both should be equal")
        }
    }
}
