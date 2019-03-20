//
//  LayerPropertiesTests.swift
//  FWAnimationTests
//
//  Created by Franklyn on 26/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class LayerPropertiesKeyPathsTests: XCTestCase {

    // MARK: - CALayer properties

    func testActions() {
        XCTAssertEqual(SwiftyCoreAnimation.Actions.keyPath, "actions", "keyPath should be 'actions'")
    }

    func testAllowsEdgeAntialiasing() {
        XCTAssertEqual(SwiftyCoreAnimation.AllowsEdgeAntialiasing.keyPath, "allowsEdgeAntialiasing", "keyPath should be 'allowsEdgeAntialiasing'")
    }

    func testAllowsGroupOpacity() {
        XCTAssertEqual(SwiftyCoreAnimation.AllowsGroupOpacity.keyPath, "allowsGroupOpacity", "keyPath should be 'allowsGroupOpacity'")
    }

    func testAnchorPoint() {
        XCTAssertEqual(SwiftyCoreAnimation.AnchorPoint.keyPath, "anchorPoint", "keyPath should be 'anchorPoint'")
        XCTAssertEqual(SwiftyCoreAnimation.AnchorPoint.X.keyPath, "anchorPoint.x", "keyPath should be 'anchorPoint.x'")
        XCTAssertEqual(SwiftyCoreAnimation.AnchorPoint.Y.keyPath, "anchorPoint.y", "keyPath should be 'anchorPoint.y'")
        XCTAssertEqual(SwiftyCoreAnimation.AnchorPoint.Z.keyPath, "anchorPointZ", "keyPath should be 'anchorPointZ'")
    }

    func testBackgroundColor() {
        XCTAssertEqual(SwiftyCoreAnimation.BackgroundColor.keyPath, "backgroundColor", "keyPath should be 'backgroundColor'")
        XCTAssertEqual(SwiftyCoreAnimation.BackgroundColor.CGColor.keyPath, "backgroundColor", "keyPath should be 'backgroundColor'")
    }

    func testBorderColor() {
        XCTAssertEqual(SwiftyCoreAnimation.BorderColor.keyPath, "borderColor", "keyPath should be 'borderColor'")
        XCTAssertEqual(SwiftyCoreAnimation.BorderColor.CGColor.keyPath, "borderColor", "keyPath should be 'borderColor'")
    }

    func testBorderWidth() {
        XCTAssertEqual(SwiftyCoreAnimation.BorderWidth.keyPath, "borderWidth", "keyPath should be 'borderWidth'")
    }

    func testBounds() {
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.keyPath, "bounds", "keyPath should be 'bounds'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Origin.keyPath, "bounds.origin", "keyPath should be 'bounds.origin'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Origin.X.keyPath, "bounds.origin.x", "keyPath should be 'bounds.origin.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Origin.Y.keyPath, "bounds.origin.y", "keyPath should be 'bounds.origin.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Size.keyPath, "bounds.size", "keyPath should be 'bounds.size'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Size.Width.keyPath, "bounds.size.width", "keyPath should be 'bounds.size.width'")
        XCTAssertEqual(SwiftyCoreAnimation.Bounds.Size.Height.keyPath, "bounds.size.height", "keyPath should be 'bounds.size.height'")
    }

    func testContents() {
        XCTAssertEqual(SwiftyCoreAnimation.Contents.keyPath, "contents", "keyPath should be 'contents'")
        XCTAssertEqual(SwiftyCoreAnimation.Contents.CGImage.keyPath, "contents", "keyPath should be 'contents'")
    }

    func testContentsCenter() {
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.keyPath, "contentsCenter", "keyPath should be 'contentsCenter'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Origin.keyPath, "contentsCenter.origin", "keyPath should be 'contentsCenter.origin'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Origin.X.keyPath, "contentsCenter.origin.x", "keyPath should be 'contentsCenter.origin.x'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Origin.Y.keyPath, "contentsCenter.origin.y", "keyPath should be 'contentsCenter.origin.y'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Size.keyPath, "contentsCenter.size", "keyPath should be 'contentsCenter.size'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Size.Width.keyPath, "contentsCenter.size.width", "keyPath should be 'contentsCenter.size.width'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsCenter.Size.Height.keyPath, "contentsCenter.size.height", "keyPath should be 'contentsCenter.size.height'")
    }

    func testContentsFormat() {
        XCTAssertEqual(SwiftyCoreAnimation.ContentsFormat.keyPath, "contentsFormat", "keyPath should be 'contentsFormat'")
    }

    func testContentsGravity() {
        XCTAssertEqual(SwiftyCoreAnimation.ContentsGravity.keyPath, "contentsGravity", "keyPath should be 'contentsGravity'")
    }

    func testContentsRect() {
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.keyPath, "contentsRect", "keyPath should be 'contentsRect'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Origin.keyPath, "contentsRect.origin", "keyPath should be 'contentsRect.origin'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Origin.X.keyPath, "contentsRect.origin.x", "keyPath should be 'contentsRect.origin.x'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Origin.Y.keyPath, "contentsRect.origin.y", "keyPath should be 'contentsRect.origin.y'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Size.keyPath, "contentsRect.size", "keyPath should be 'contentsRect.size'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Size.Width.keyPath, "contentsRect.size.width", "keyPath should be 'contentsRect.size.width'")
        XCTAssertEqual(SwiftyCoreAnimation.ContentsRect.Size.Height.keyPath, "contentsRect.size.height", "keyPath should be 'contentsRect.size.height'")
    }

    func testCornerRadius() {
        XCTAssertEqual(SwiftyCoreAnimation.CornerRadius.keyPath, "cornerRadius", "keyPath should be 'cornerRadius'")
    }

    func testContentsScale() {
        XCTAssertEqual(SwiftyCoreAnimation.ContentsScale.keyPath, "contentsScale", "keyPath should be 'contentsScale'")
    }

    func testDoubleSided() {
        XCTAssertEqual(SwiftyCoreAnimation.DoubleSided.keyPath, "doubleSided", "keyPath should be 'doubleSided'")
    }

    func testDrawsAsynchronously() {
        XCTAssertEqual(SwiftyCoreAnimation.DrawsAsynchronously.keyPath, "drawsAsynchronously", "keyPath should be 'drawsAsynchronously'")
    }

    func testFrame() {
        XCTAssertEqual(SwiftyCoreAnimation.Frame.keyPath, "frame", "keyPath should be 'frame'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Origin.keyPath, "frame.origin", "keyPath should be 'frame.origin'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Origin.X.keyPath, "frame.origin.x", "keyPath should be 'frame.origin.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Origin.Y.keyPath, "frame.origin.y", "keyPath should be 'frame.origin.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Size.keyPath, "frame.size", "keyPath should be 'frame.size'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Size.Width.keyPath, "frame.size.width", "keyPath should be 'frame.size.width'")
        XCTAssertEqual(SwiftyCoreAnimation.Frame.Size.Height.keyPath, "frame.size.height", "keyPath should be 'frame.size.height'")
    }

    func testGeometryFlipped() {
        XCTAssertEqual(SwiftyCoreAnimation.GeometryFlipped.keyPath, "geometryFlipped", "keyPath should be 'geometryFlipped'")
    }

    func testHidden() {
        XCTAssertEqual(SwiftyCoreAnimation.Hidden.keyPath, "hidden", "keyPath should be 'hidden'")
    }

    func testMask() {
        XCTAssertEqual(SwiftyCoreAnimation.Mask.keyPath, "mask", "keyPath should be 'mask'")
    }

    @available(iOS 11.0, *)
    func testMaskedCorners() {
        XCTAssertEqual(SwiftyCoreAnimation.MaskedCorners.keyPath, "maskedCorners", "keyPath should be 'maskedCorners'")
    }

    func testMasksToBounds() {
        XCTAssertEqual(SwiftyCoreAnimation.MasksToBounds.keyPath, "masksToBounds", "keyPath should be 'masksToBounds'")
    }

    func testName() {
        XCTAssertEqual(SwiftyCoreAnimation.Name.keyPath, "name", "keyPath should be 'name'")
    }

    func testNeedsDisplayOnBoundsChange() {
        XCTAssertEqual(SwiftyCoreAnimation.NeedsDisplayOnBoundsChange.keyPath, "needsDisplayOnBoundsChange", "keyPath should be 'needsDisplayOnBoundsChange'")
    }

    func testOpacity() {
        XCTAssertEqual(SwiftyCoreAnimation.Opacity.keyPath, "opacity", "keyPath should be 'opacity'")
    }

    func testOpaque() {
        XCTAssertEqual(SwiftyCoreAnimation.Opaque.keyPath, "opaque", "keyPath should be 'opaque'")
    }

    func testPosition() {
        XCTAssertEqual(SwiftyCoreAnimation.Position.keyPath, "position", "keyPath should be 'position'")
        XCTAssertEqual(SwiftyCoreAnimation.Position.X.keyPath, "position.x", "keyPath should be 'position.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Position.Y.keyPath, "position.y", "keyPath should be 'position.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Position.Z.keyPath, "zPosition", "keyPath should be 'zPosition'")
    }

    func testRasterizationScale() {
        XCTAssertEqual(SwiftyCoreAnimation.RasterizationScale.keyPath, "rasterizationScale", "keyPath should be 'rasterizationScale'")
    }

    func testShadowColor() {
        XCTAssertEqual(SwiftyCoreAnimation.ShadowColor.keyPath, "shadowColor", "keyPath should be 'shadowColor'")
        XCTAssertEqual(SwiftyCoreAnimation.ShadowColor.CGColor.keyPath, "shadowColor", "keyPath should be 'shadowColor'")
    }

    func testShadowOffset() {
        XCTAssertEqual(SwiftyCoreAnimation.ShadowOffset.keyPath, "shadowOffset", "keyPath should be 'shadowOffset'")
        XCTAssertEqual(SwiftyCoreAnimation.ShadowOffset.Width.keyPath, "shadowOffset.width", "keyPath should be 'shadowOffset.width'")
        XCTAssertEqual(SwiftyCoreAnimation.ShadowOffset.Height.keyPath, "shadowOffset.height", "keyPath should be 'shadowOffset.height'")
    }

    func testShadowOpacity() {
        XCTAssertEqual(SwiftyCoreAnimation.ShadowOpacity.keyPath, "shadowOpacity", "keyPath should be 'shadowOpacity'")
    }

    func testShadowPath() {
        XCTAssertEqual(SwiftyCoreAnimation.ShadowPath.keyPath, "shadowPath", "keyPath should be 'shadowPath'")
    }

    func testShadowRadius() {
        XCTAssertEqual(SwiftyCoreAnimation.ShadowRadius.keyPath, "shadowRadius", "keyPath should be 'shadowRadius'")
    }

    func testShouldRasterize() {
        XCTAssertEqual(SwiftyCoreAnimation.ShouldRasterize.keyPath, "shouldRasterize", "keyPath should be 'shouldRasterize'")
    }

    func testStyle() {
        XCTAssertEqual(SwiftyCoreAnimation.Style.keyPath, "style", "keyPath should be 'style'")
    }

    func testSublayers() {
        XCTAssertEqual(SwiftyCoreAnimation.Sublayers.keyPath, "sublayers", "keyPath should be 'sublayers'")
    }

    func testSublayerTransform() {
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.keyPath, "sublayerTransform", "keyPath should be 'sublayerTransform'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Rotation.keyPath, "sublayerTransform.rotation", "keyPath should be 'sublayerTransform.rotation'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Rotation.X.keyPath, "sublayerTransform.rotation.x", "keyPath should be 'sublayerTransform.rotation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Rotation.Y.keyPath, "sublayerTransform.rotation.y", "keyPath should be 'sublayerTransform.rotation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Rotation.Z.keyPath, "sublayerTransform.rotation.z", "keyPath should be 'sublayerTransform.rotation.z'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Scale.keyPath, "sublayerTransform.scale", "keyPath should be 'sublayerTransform.scale'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Scale.X.keyPath, "sublayerTransform.scale.x", "keyPath should be 'sublayerTransform.scale.x'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Scale.Y.keyPath, "sublayerTransform.scale.y", "keyPath should be 'sublayerTransform.scale.y'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Scale.Z.keyPath, "sublayerTransform.scale.z", "keyPath should be 'sublayerTransform.scale.z'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Translation.keyPath, "sublayerTransform.translation", "keyPath should be 'sublayerTransform.translation'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Translation.X.keyPath, "sublayerTransform.translation.x", "keyPath should be 'sublayerTransform.translation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Translation.Y.keyPath, "sublayerTransform.translation.y", "keyPath should be 'sublayerTransform.translation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.SublayerTransform.Translation.Z.keyPath, "sublayerTransform.translation.z", "keyPath should be 'sublayerTransform.translation.z'")
    }

    func testSuperlayer() {
        XCTAssertEqual(SwiftyCoreAnimation.Superlayer.keyPath, "superlayer", "keyPath should be 'superlayer'")
    }

    func testTransform() {
        XCTAssertEqual(SwiftyCoreAnimation.Transform.keyPath, "transform", "keyPath should be 'transform'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Rotation.keyPath, "transform.rotation", "keyPath should be 'transform.rotation'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Rotation.X.keyPath, "transform.rotation.x", "keyPath should be 'transform.rotation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Rotation.Y.keyPath, "transform.rotation.y", "keyPath should be 'transform.rotation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Rotation.Z.keyPath, "transform.rotation.z", "keyPath should be 'transform.rotation.z'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Scale.keyPath, "transform.scale", "keyPath should be 'transform.scale'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Scale.X.keyPath, "transform.scale.x", "keyPath should be 'transform.scale.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Scale.Y.keyPath, "transform.scale.y", "keyPath should be 'transform.scale.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Scale.Z.keyPath, "transform.scale.z", "keyPath should be 'transform.scale.z'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Translation.keyPath, "transform.translation", "keyPath should be 'transform.translation'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Translation.X.keyPath, "transform.translation.x", "keyPath should be 'transform.translation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Translation.Y.keyPath, "transform.translation.y", "keyPath should be 'transform.translation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.Transform.Translation.Z.keyPath, "transform.translation.z", "keyPath should be 'transform.translation.z'")
    }

    func testVisibleRect() {
        XCTAssertEqual(SwiftyCoreAnimation.VisibleRect.keyPath, "visibleRect", "keyPath should be 'visibleRect'")
    }


    // MARK: - CAShapeLayer properties

    func testFillColor() {
        XCTAssertEqual(SwiftyCoreAnimation.FillColor.keyPath, "fillColor", "keyPath should be 'fillColor'")
        XCTAssertEqual(SwiftyCoreAnimation.FillColor.CGColor.keyPath, "fillColor", "keyPath should be 'fillColor'")
    }

    func testFillRule() {
        XCTAssertEqual(SwiftyCoreAnimation.FillRule.keyPath, "fillRule", "keyPath should be 'fillRule'")
    }

    func testLineDashPhase() {
        XCTAssertEqual(SwiftyCoreAnimation.LineDashPhase.keyPath, "lineDashPhase", "keyPath should be 'LineDashPhase'")
    }

    func testLineWidth() {
        XCTAssertEqual(SwiftyCoreAnimation.LineWidth.keyPath, "lineWidth", "keyPath should be 'lineWidth'")
    }

    func testLineCap() {
        XCTAssertEqual(SwiftyCoreAnimation.LineCap.keyPath, "lineCap", "keyPath should be 'lineCap'")
    }

    func testLineDashPattern() {
        XCTAssertEqual(SwiftyCoreAnimation.LineDashPattern.keyPath, "lineDashPattern", "keyPath should be 'lineDashPattern'")
    }

    func testLineJoin() {
        XCTAssertEqual(SwiftyCoreAnimation.LineJoin.keyPath, "lineJoin", "keyPath should be 'lineJoin'")
    }

    func testMiterLimit() {
        XCTAssertEqual(SwiftyCoreAnimation.MiterLimit.keyPath, "miterLimit", "keyPath should be 'miterLimit'")
    }

    func testPath() {
        XCTAssertEqual(SwiftyCoreAnimation.Path.keyPath, "path", "keyPath should be 'path'")
    }

    func testStrokeColor() {
        XCTAssertEqual(SwiftyCoreAnimation.StrokeColor.keyPath, "strokeColor", "keyPath should be 'strokeColor'")
        XCTAssertEqual(SwiftyCoreAnimation.StrokeColor.CGColor.keyPath, "strokeColor", "keyPath should be 'strokeColor'")
    }

    func testStrokeStart() {
        XCTAssertEqual(SwiftyCoreAnimation.StrokeStart.keyPath, "strokeStart", "keyPath should be 'strokeStart'")
    }

    func testStrokeEnd() {
        XCTAssertEqual(SwiftyCoreAnimation.StrokeEnd.keyPath, "strokeEnd", "keyPath should be 'strokeEnd'")
    }


    // MARK: - CAEmitterLayer properties

    func testEmitterCells() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterCells.keyPath, "emitterCells", "keyPath should be 'emitterCells'")
    }

    func testEmitterDepth() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterDepth.keyPath, "emitterDepth", "keyPath should be 'emitterDepth'")
    }

    func testEmitterMode() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterMode.keyPath, "emitterMode", "keyPath should be 'emitterMode'")
    }

    func testEmitterShape() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterShape.keyPath, "emitterShape", "keyPath should be 'emitterShape'")
    }

    func testEmitterSize() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterSize.keyPath, "emitterSize", "keyPath should be 'emitterSize'")
        XCTAssertEqual(SwiftyCoreAnimation.EmitterSize.Width.keyPath, "emitterSize.width", "keyPath should be 'emitterSize.width'")
        XCTAssertEqual(SwiftyCoreAnimation.EmitterSize.Height.keyPath, "emitterSize.height", "keyPath should be 'emitterSize.height'")
    }

    func testEmitterPosition() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterPosition.keyPath, "emitterPosition", "keyPath should be 'emitterPosition'")
        XCTAssertEqual(SwiftyCoreAnimation.EmitterPosition.X.keyPath, "emitterPosition.x", "keyPath should be 'emitterPosition.x'")
        XCTAssertEqual(SwiftyCoreAnimation.EmitterPosition.Y.keyPath, "emitterPosition.y", "keyPath should be 'emitterPosition.y'")
        XCTAssertEqual(SwiftyCoreAnimation.EmitterPosition.Z.keyPath, "emitterZPosition", "keyPath should be 'emitterZPosition'")
    }

    func testEmitterPreservesDepth() {
        XCTAssertEqual(SwiftyCoreAnimation.EmitterPreservesDepth.keyPath, "preservesDepth", "keyPath should be 'preservesDepth'")
    }

    func testBirthRate() {
        XCTAssertEqual(SwiftyCoreAnimation.BirthRate.keyPath, "birthRate", "keyPath should be 'birthRate'")
    }

    func testLifetime() {
        XCTAssertEqual(SwiftyCoreAnimation.Lifetime.keyPath, "lifetime", "keyPath should be 'lifetime'")
    }

    func testRenderMode() {
        XCTAssertEqual(SwiftyCoreAnimation.RenderMode.keyPath, "renderMode", "keyPath should be 'renderMode'")
    }

    func testScale() {
        XCTAssertEqual(SwiftyCoreAnimation.Scale.keyPath, "scale", "keyPath should be 'scale'")
    }

    func testSeed() {
        XCTAssertEqual(SwiftyCoreAnimation.Seed.keyPath, "seed", "keyPath should be 'seed'")
    }

    func testSpin() {
        XCTAssertEqual(SwiftyCoreAnimation.Spin.keyPath, "spin", "keyPath should be 'spin'")
    }

    func testVelocity() {
        XCTAssertEqual(SwiftyCoreAnimation.Velocity.keyPath, "velocity", "keyPath should be 'velocity'")
    }


    // MARK: - CAGradientLayer properties

    func testColors() {
        XCTAssertEqual(SwiftyCoreAnimation.Colors.keyPath, "colors", "keyPath should be 'colors'")
        XCTAssertEqual(SwiftyCoreAnimation.Colors.CGColors.keyPath, "colors", "keyPath should be 'colors'")
    }

    @available(iOS 12.0, *)
    func testGradientType() {
        XCTAssertEqual(SwiftyCoreAnimation.GradientType.keyPath, "type", "keyPath should be 'type'")
    }

    func testLocations() {
        XCTAssertEqual(SwiftyCoreAnimation.Locations.keyPath, "locations", "keyPath should be 'locations'")
    }

    func testEndPoint() {
        XCTAssertEqual(SwiftyCoreAnimation.EndPoint.keyPath, "endPoint", "keyPath should be 'endPoint'")
        XCTAssertEqual(SwiftyCoreAnimation.EndPoint.X.keyPath, "endPoint.x", "keyPath should be 'endPoint.x'")
        XCTAssertEqual(SwiftyCoreAnimation.EndPoint.Y.keyPath, "endPoint.y", "keyPath should be 'endPoint.y'")
    }

    func testStartPoint() {
        XCTAssertEqual(SwiftyCoreAnimation.StartPoint.keyPath, "startPoint", "keyPath should be 'startPoint'")
        XCTAssertEqual(SwiftyCoreAnimation.StartPoint.X.keyPath, "startPoint.x", "keyPath should be 'startPoint.x'")
        XCTAssertEqual(SwiftyCoreAnimation.StartPoint.Y.keyPath, "startPoint.y", "keyPath should be 'startPoint.y'")
    }


    // MARK: - CAReplicatorLayer properties

    func testInstanceColor() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceColor.keyPath, "instanceColor", "keyPath should be 'instanceColor'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceColor.CGColor.keyPath, "instanceColor", "keyPath should be 'instanceColor'")
    }

    func testInstanceDelay() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceDelay.keyPath, "instanceDelay", "keyPath should be 'instanceDelay'")
    }

    func testInstanceTransform() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.keyPath, "instanceTransform", "keyPath should be 'instanceTransform'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Rotation.keyPath, "instanceTransform.rotation", "keyPath should be 'instanceTransform.rotation'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Rotation.X.keyPath, "instanceTransform.rotation.x", "keyPath should be 'instanceTransform.rotation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Rotation.Y.keyPath, "instanceTransform.rotation.y", "keyPath should be 'instanceTransform.rotation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Rotation.Z.keyPath, "instanceTransform.rotation.z", "keyPath should be 'instanceTransform.rotation.z'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Scale.keyPath, "instanceTransform.scale", "keyPath should be 'instanceTransform.scale'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Scale.X.keyPath, "instanceTransform.scale.x", "keyPath should be 'instanceTransform.scale.x'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Scale.Y.keyPath, "instanceTransform.scale.y", "keyPath should be 'instanceTransform.scale.y'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Scale.Z.keyPath, "instanceTransform.scale.z", "keyPath should be 'instanceTransform.scale.z'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Translation.keyPath, "instanceTransform.translation", "keyPath should be 'instanceTransform.translation'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Translation.X.keyPath, "instanceTransform.translation.x", "keyPath should be 'instanceTransform.translation.x'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Translation.Y.keyPath, "instanceTransform.translation.y", "keyPath should be 'instanceTransform.translation.y'")
        XCTAssertEqual(SwiftyCoreAnimation.InstanceTransform.Translation.Z.keyPath, "instanceTransform.translation.z", "keyPath should be 'instanceTransform.translation.z'")
    }

    func testInstanceRedOffset() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceRedOffset.keyPath, "instanceRedOffset", "keyPath should be 'instanceRedOffset'")
    }

    func testInstanceGreenOffset() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceGreenOffset.keyPath, "instanceGreenOffset", "keyPath should be 'instanceGreenOffset'")
    }

    func testInstanceBlueOffset() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceBlueOffset.keyPath, "instanceBlueOffset", "keyPath should be 'instanceBlueOffset'")
    }

    func testInstanceAlphaOffset() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceAlphaOffset.keyPath, "instanceAlphaOffset", "keyPath should be 'instanceAlphaOffset'")
    }

    func testInstanceInstanceCount() {
        XCTAssertEqual(SwiftyCoreAnimation.InstanceCount.keyPath, "instanceCount", "keyPath should be 'instanceCount'")
    }

    func testReplicatorPreservesDepth() {
        XCTAssertEqual(SwiftyCoreAnimation.ReplicatorPreservesDepth.keyPath, "preservesDepth", "keyPath should be 'preservesDepth'")
    }


    // MARK: - CATextLayer properties

    func testAlignmentMode() {
        XCTAssertEqual(SwiftyCoreAnimation.AlignmentMode.keyPath, "alignmentMode", "keyPath should be 'alignmentMode'")
    }

    func testAllowsFontSubpixelQuantization() {
        XCTAssertEqual(SwiftyCoreAnimation.AllowsFontSubpixelQuantization.keyPath, "allowsFontSubpixelQuantization", "keyPath should be 'allowsFontSubpixelQuantization'")
    }

    func testFont() {
        XCTAssertEqual(SwiftyCoreAnimation.Font.keyPath, "font", "keyPath should be 'font'")
    }

    func testFontSize() {
        XCTAssertEqual(SwiftyCoreAnimation.FontSize.keyPath, "fontSize", "keyPath should be 'fontSize'")
    }

    func testForegroundColor() {
        XCTAssertEqual(SwiftyCoreAnimation.ForegroundColor.keyPath, "foregroundColor", "keyPath should be 'foregroundColor'")
        XCTAssertEqual(SwiftyCoreAnimation.ForegroundColor.CGColor.keyPath, "foregroundColor", "keyPath should be 'foregroundColor'")
    }

    func testString() {
        XCTAssertEqual(SwiftyCoreAnimation.TextString.keyPath, "string", "keyPath should be 'string'")
    }

    func testTruncationMode() {
        XCTAssertEqual(SwiftyCoreAnimation.TruncationMode.keyPath, "truncationMode", "keyPath should be 'truncationMode'")
    }

    func testWrapped() {
        XCTAssertEqual(SwiftyCoreAnimation.Wrapped.keyPath, "wrapped", "keyPath should be 'wrapped'")
    }
}
