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
        XCTAssertEqual(Actions.keyPath, "actions", "keyPath should be 'actions'")
    }

    func testAllowsEdgeAntialiasing() {
        XCTAssertEqual(AllowsEdgeAntialiasing.keyPath, "allowsEdgeAntialiasing", "keyPath should be 'allowsEdgeAntialiasing'")
    }

    func testAllowsGroupOpacity() {
        XCTAssertEqual(AllowsGroupOpacity.keyPath, "allowsGroupOpacity", "keyPath should be 'allowsGroupOpacity'")
    }

    func testAnchorPoint() {
        XCTAssertEqual(AnchorPoint.keyPath, "anchorPoint", "keyPath should be 'anchorPoint'")
        XCTAssertEqual(AnchorPoint.X.keyPath, "anchorPoint.x", "keyPath should be 'anchorPoint.x'")
        XCTAssertEqual(AnchorPoint.Y.keyPath, "anchorPoint.y", "keyPath should be 'anchorPoint.y'")
        XCTAssertEqual(AnchorPoint.Z.keyPath, "anchorPointZ", "keyPath should be 'anchorPointZ'")
    }

    func testBackgroundColor() {
        XCTAssertEqual(BackgroundColor.keyPath, "backgroundColor", "keyPath should be 'backgroundColor'")
        XCTAssertEqual(BackgroundColor.CGColor.keyPath, "backgroundColor", "keyPath should be 'backgroundColor'")
    }

    func testBorderColor() {
        XCTAssertEqual(BorderColor.keyPath, "borderColor", "keyPath should be 'borderColor'")
        XCTAssertEqual(BorderColor.CGColor.keyPath, "borderColor", "keyPath should be 'borderColor'")
    }

    func testBorderWidth() {
        XCTAssertEqual(BorderWidth.keyPath, "borderWidth", "keyPath should be 'borderWidth'")
    }

    func testBounds() {
        XCTAssertEqual(Bounds.keyPath, "bounds", "keyPath should be 'bounds'")
        XCTAssertEqual(Bounds.Origin.keyPath, "bounds.origin", "keyPath should be 'bounds.origin'")
        XCTAssertEqual(Bounds.Origin.X.keyPath, "bounds.origin.x", "keyPath should be 'bounds.origin.x'")
        XCTAssertEqual(Bounds.Origin.Y.keyPath, "bounds.origin.y", "keyPath should be 'bounds.origin.y'")
        XCTAssertEqual(Bounds.Size.keyPath, "bounds.size", "keyPath should be 'bounds.size'")
        XCTAssertEqual(Bounds.Size.Width.keyPath, "bounds.size.width", "keyPath should be 'bounds.size.width'")
        XCTAssertEqual(Bounds.Size.Height.keyPath, "bounds.size.height", "keyPath should be 'bounds.size.height'")
    }

    func testContents() {
        XCTAssertEqual(Contents.keyPath, "contents", "keyPath should be 'contents'")
        XCTAssertEqual(Contents.CGImage.keyPath, "contents", "keyPath should be 'contents'")
    }

    func testContentsCenter() {
        XCTAssertEqual(ContentsCenter.keyPath, "contentsCenter", "keyPath should be 'contentsCenter'")
        XCTAssertEqual(ContentsCenter.Origin.keyPath, "contentsCenter.origin", "keyPath should be 'contentsCenter.origin'")
        XCTAssertEqual(ContentsCenter.Origin.X.keyPath, "contentsCenter.origin.x", "keyPath should be 'contentsCenter.origin.x'")
        XCTAssertEqual(ContentsCenter.Origin.Y.keyPath, "contentsCenter.origin.y", "keyPath should be 'contentsCenter.origin.y'")
        XCTAssertEqual(ContentsCenter.Size.keyPath, "contentsCenter.size", "keyPath should be 'contentsCenter.size'")
        XCTAssertEqual(ContentsCenter.Size.Width.keyPath, "contentsCenter.size.width", "keyPath should be 'contentsCenter.size.width'")
        XCTAssertEqual(ContentsCenter.Size.Height.keyPath, "contentsCenter.size.height", "keyPath should be 'contentsCenter.size.height'")
    }

    func testContentsFormat() {
        XCTAssertEqual(ContentsFormat.keyPath, "contentsFormat", "keyPath should be 'contentsFormat'")
    }

    func testContentsGravity() {
        XCTAssertEqual(ContentsGravity.keyPath, "contentsGravity", "keyPath should be 'contentsGravity'")
    }

    func testContentsRect() {
        XCTAssertEqual(ContentsRect.keyPath, "contentsRect", "keyPath should be 'contentsRect'")
        XCTAssertEqual(ContentsRect.Origin.keyPath, "contentsRect.origin", "keyPath should be 'contentsRect.origin'")
        XCTAssertEqual(ContentsRect.Origin.X.keyPath, "contentsRect.origin.x", "keyPath should be 'contentsRect.origin.x'")
        XCTAssertEqual(ContentsRect.Origin.Y.keyPath, "contentsRect.origin.y", "keyPath should be 'contentsRect.origin.y'")
        XCTAssertEqual(ContentsRect.Size.keyPath, "contentsRect.size", "keyPath should be 'contentsRect.size'")
        XCTAssertEqual(ContentsRect.Size.Width.keyPath, "contentsRect.size.width", "keyPath should be 'contentsRect.size.width'")
        XCTAssertEqual(ContentsRect.Size.Height.keyPath, "contentsRect.size.height", "keyPath should be 'contentsRect.size.height'")
    }

    func testCornerRadius() {
        XCTAssertEqual(CornerRadius.keyPath, "cornerRadius", "keyPath should be 'cornerRadius'")
    }

    func testContentsScale() {
        XCTAssertEqual(ContentsScale.keyPath, "contentsScale", "keyPath should be 'contentsScale'")
    }

    func testDoubleSided() {
        XCTAssertEqual(DoubleSided.keyPath, "doubleSided", "keyPath should be 'doubleSided'")
    }

    func testDrawsAsynchronously() {
        XCTAssertEqual(DrawsAsynchronously.keyPath, "drawsAsynchronously", "keyPath should be 'drawsAsynchronously'")
    }

    func testFrame() {
        XCTAssertEqual(Frame.keyPath, "frame", "keyPath should be 'frame'")
        XCTAssertEqual(Frame.Origin.keyPath, "frame.origin", "keyPath should be 'frame.origin'")
        XCTAssertEqual(Frame.Origin.X.keyPath, "frame.origin.x", "keyPath should be 'frame.origin.x'")
        XCTAssertEqual(Frame.Origin.Y.keyPath, "frame.origin.y", "keyPath should be 'frame.origin.y'")
        XCTAssertEqual(Frame.Size.keyPath, "frame.size", "keyPath should be 'frame.size'")
        XCTAssertEqual(Frame.Size.Width.keyPath, "frame.size.width", "keyPath should be 'frame.size.width'")
        XCTAssertEqual(Frame.Size.Height.keyPath, "frame.size.height", "keyPath should be 'frame.size.height'")
    }

    func testGeometryFlipped() {
        XCTAssertEqual(GeometryFlipped.keyPath, "geometryFlipped", "keyPath should be 'geometryFlipped'")
    }

    func testHidden() {
        XCTAssertEqual(Hidden.keyPath, "hidden", "keyPath should be 'hidden'")
    }

    func testMask() {
        XCTAssertEqual(Mask.keyPath, "mask", "keyPath should be 'mask'")
    }

    @available(iOS 11.0, *)
    func testMaskedCorners() {
        XCTAssertEqual(MaskedCorners.keyPath, "maskedCorners", "keyPath should be 'maskedCorners'")
    }

    func testMasksToBounds() {
        XCTAssertEqual(MasksToBounds.keyPath, "masksToBounds", "keyPath should be 'masksToBounds'")
    }

    func testName() {
        XCTAssertEqual(Name.keyPath, "name", "keyPath should be 'name'")
    }

    func testNeedsDisplayOnBoundsChange() {
        XCTAssertEqual(NeedsDisplayOnBoundsChange.keyPath, "needsDisplayOnBoundsChange", "keyPath should be 'needsDisplayOnBoundsChange'")
    }

    func testOpacity() {
        XCTAssertEqual(Opacity.keyPath, "opacity", "keyPath should be 'opacity'")
    }

    func testOpaque() {
        XCTAssertEqual(Opaque.keyPath, "opaque", "keyPath should be 'opaque'")
    }

    func testPosition() {
        XCTAssertEqual(Position.keyPath, "position", "keyPath should be 'position'")
        XCTAssertEqual(Position.X.keyPath, "position.x", "keyPath should be 'position.x'")
        XCTAssertEqual(Position.Y.keyPath, "position.y", "keyPath should be 'position.y'")
        XCTAssertEqual(Position.Z.keyPath, "zPosition", "keyPath should be 'zPosition'")
    }

    func testRasterizationScale() {
        XCTAssertEqual(RasterizationScale.keyPath, "rasterizationScale", "keyPath should be 'rasterizationScale'")
    }

    func testShadowColor() {
        XCTAssertEqual(ShadowColor.keyPath, "shadowColor", "keyPath should be 'shadowColor'")
        XCTAssertEqual(ShadowColor.CGColor.keyPath, "shadowColor", "keyPath should be 'shadowColor'")
    }

    func testShadowOffset() {
        XCTAssertEqual(ShadowOffset.keyPath, "shadowOffset", "keyPath should be 'shadowOffset'")
        XCTAssertEqual(ShadowOffset.Width.keyPath, "shadowOffset.width", "keyPath should be 'shadowOffset.width'")
        XCTAssertEqual(ShadowOffset.Height.keyPath, "shadowOffset.height", "keyPath should be 'shadowOffset.height'")
    }

    func testShadowOpacity() {
        XCTAssertEqual(ShadowOpacity.keyPath, "shadowOpacity", "keyPath should be 'shadowOpacity'")
    }

    func testShadowPath() {
        XCTAssertEqual(ShadowPath.keyPath, "shadowPath", "keyPath should be 'shadowPath'")
    }

    func testShadowRadius() {
        XCTAssertEqual(ShadowRadius.keyPath, "shadowRadius", "keyPath should be 'shadowRadius'")
    }

    func testShouldRasterize() {
        XCTAssertEqual(ShouldRasterize.keyPath, "shouldRasterize", "keyPath should be 'shouldRasterize'")
    }

    func testStyle() {
        XCTAssertEqual(Style.keyPath, "style", "keyPath should be 'style'")
    }

    func testSublayers() {
        XCTAssertEqual(Sublayers.keyPath, "sublayers", "keyPath should be 'sublayers'")
    }

    func testSublayerTransform() {
        XCTAssertEqual(SublayerTransform.keyPath, "sublayerTransform", "keyPath should be 'sublayerTransform'")
        XCTAssertEqual(SublayerTransform.Rotation.keyPath, "sublayerTransform.rotation", "keyPath should be 'sublayerTransform.rotation'")
        XCTAssertEqual(SublayerTransform.Rotation.X.keyPath, "sublayerTransform.rotation.x", "keyPath should be 'sublayerTransform.rotation.x'")
        XCTAssertEqual(SublayerTransform.Rotation.Y.keyPath, "sublayerTransform.rotation.y", "keyPath should be 'sublayerTransform.rotation.y'")
        XCTAssertEqual(SublayerTransform.Rotation.Z.keyPath, "sublayerTransform.rotation.z", "keyPath should be 'sublayerTransform.rotation.z'")
        XCTAssertEqual(SublayerTransform.Scale.keyPath, "sublayerTransform.scale", "keyPath should be 'sublayerTransform.scale'")
        XCTAssertEqual(SublayerTransform.Scale.X.keyPath, "sublayerTransform.scale.x", "keyPath should be 'sublayerTransform.scale.x'")
        XCTAssertEqual(SublayerTransform.Scale.Y.keyPath, "sublayerTransform.scale.y", "keyPath should be 'sublayerTransform.scale.y'")
        XCTAssertEqual(SublayerTransform.Scale.Z.keyPath, "sublayerTransform.scale.z", "keyPath should be 'sublayerTransform.scale.z'")
        XCTAssertEqual(SublayerTransform.Translation.keyPath, "sublayerTransform.translation", "keyPath should be 'sublayerTransform.translation'")
        XCTAssertEqual(SublayerTransform.Translation.X.keyPath, "sublayerTransform.translation.x", "keyPath should be 'sublayerTransform.translation.x'")
        XCTAssertEqual(SublayerTransform.Translation.Y.keyPath, "sublayerTransform.translation.y", "keyPath should be 'sublayerTransform.translation.y'")
        XCTAssertEqual(SublayerTransform.Translation.Z.keyPath, "sublayerTransform.translation.z", "keyPath should be 'sublayerTransform.translation.z'")
    }

    func testSuperlayer() {
        XCTAssertEqual(Superlayer.keyPath, "superlayer", "keyPath should be 'superlayer'")
    }

    func testTransform() {
        XCTAssertEqual(Transform.keyPath, "transform", "keyPath should be 'transform'")
        XCTAssertEqual(Transform.Rotation.keyPath, "transform.rotation", "keyPath should be 'transform.rotation'")
        XCTAssertEqual(Transform.Rotation.X.keyPath, "transform.rotation.x", "keyPath should be 'transform.rotation.x'")
        XCTAssertEqual(Transform.Rotation.Y.keyPath, "transform.rotation.y", "keyPath should be 'transform.rotation.y'")
        XCTAssertEqual(Transform.Rotation.Z.keyPath, "transform.rotation.z", "keyPath should be 'transform.rotation.z'")
        XCTAssertEqual(Transform.Scale.keyPath, "transform.scale", "keyPath should be 'transform.scale'")
        XCTAssertEqual(Transform.Scale.X.keyPath, "transform.scale.x", "keyPath should be 'transform.scale.x'")
        XCTAssertEqual(Transform.Scale.Y.keyPath, "transform.scale.y", "keyPath should be 'transform.scale.y'")
        XCTAssertEqual(Transform.Scale.Z.keyPath, "transform.scale.z", "keyPath should be 'transform.scale.z'")
        XCTAssertEqual(Transform.Translation.keyPath, "transform.translation", "keyPath should be 'transform.translation'")
        XCTAssertEqual(Transform.Translation.X.keyPath, "transform.translation.x", "keyPath should be 'transform.translation.x'")
        XCTAssertEqual(Transform.Translation.Y.keyPath, "transform.translation.y", "keyPath should be 'transform.translation.y'")
        XCTAssertEqual(Transform.Translation.Z.keyPath, "transform.translation.z", "keyPath should be 'transform.translation.z'")
    }

    func testVisibleRect() {
        XCTAssertEqual(VisibleRect.keyPath, "visibleRect", "keyPath should be 'visibleRect'")
        XCTAssertEqual(VisibleRect.Origin.keyPath, "visibleRect.origin", "keyPath should be 'visibleRect.origin'")
        XCTAssertEqual(VisibleRect.Origin.X.keyPath, "visibleRect.origin.x", "keyPath should be 'visibleRect.origin.x'")
        XCTAssertEqual(VisibleRect.Origin.Y.keyPath, "visibleRect.origin.y", "keyPath should be 'visibleRect.origin.y'")
        XCTAssertEqual(VisibleRect.Size.keyPath, "visibleRect.size", "keyPath should be 'visibleRect.size'")
        XCTAssertEqual(VisibleRect.Size.Width.keyPath, "visibleRect.size.width", "keyPath should be 'visibleRect.size.width'")
        XCTAssertEqual(VisibleRect.Size.Height.keyPath, "visibleRect.size.height", "keyPath should be 'visibleRect.size.height'")
    }


    // MARK: - CAShapeLayer properties

    func testFillColor() {
        XCTAssertEqual(FillColor.keyPath, "fillColor", "keyPath should be 'fillColor'")
        XCTAssertEqual(FillColor.CGColor.keyPath, "fillColor", "keyPath should be 'fillColor'")
    }

    func testFillRule() {
        XCTAssertEqual(FillRule.keyPath, "fillRule", "keyPath should be 'fillRule'")
    }

    func testLineDashPhase() {
        XCTAssertEqual(LineDashPhase.keyPath, "lineDashPhase", "keyPath should be 'LineDashPhase'")
    }

    func testLineWidth() {
        XCTAssertEqual(LineWidth.keyPath, "lineWidth", "keyPath should be 'lineWidth'")
    }

    func testLineCap() {
        XCTAssertEqual(LineCap.keyPath, "lineCap", "keyPath should be 'lineCap'")
    }

    func testLineDashPattern() {
        XCTAssertEqual(LineDashPattern.keyPath, "lineDashPattern", "keyPath should be 'lineDashPattern'")
    }

    func testLineJoin() {
        XCTAssertEqual(LineJoin.keyPath, "lineJoin", "keyPath should be 'lineJoin'")
    }

    func testMiterLimit() {
        XCTAssertEqual(MiterLimit.keyPath, "miterLimit", "keyPath should be 'miterLimit'")
    }

    func testPath() {
        XCTAssertEqual(Path.keyPath, "path", "keyPath should be 'path'")
    }

    func testStrokeColor() {
        XCTAssertEqual(StrokeColor.keyPath, "strokeColor", "keyPath should be 'strokeColor'")
        XCTAssertEqual(StrokeColor.CGColor.keyPath, "strokeColor", "keyPath should be 'strokeColor'")
    }

    func testStrokeStart() {
        XCTAssertEqual(StrokeStart.keyPath, "strokeStart", "keyPath should be 'strokeStart'")
    }

    func testStrokeEnd() {
        XCTAssertEqual(StrokeEnd.keyPath, "strokeEnd", "keyPath should be 'strokeEnd'")
    }


    // MARK: - CAEmitterLayer properties

    func testEmitterCells() {
        XCTAssertEqual(EmitterCells.keyPath, "emitterCells", "keyPath should be 'emitterCells'")
    }

    func testEmitterDepth() {
        XCTAssertEqual(EmitterDepth.keyPath, "emitterDepth", "keyPath should be 'emitterDepth'")
    }

    func testEmitterMode() {
        XCTAssertEqual(EmitterMode.keyPath, "emitterMode", "keyPath should be 'emitterMode'")
    }

    func testEmitterShape() {
        XCTAssertEqual(EmitterShape.keyPath, "emitterShape", "keyPath should be 'emitterShape'")
    }

    func testEmitterSize() {
        XCTAssertEqual(EmitterSize.keyPath, "emitterSize", "keyPath should be 'emitterSize'")
        XCTAssertEqual(EmitterSize.Width.keyPath, "emitterSize.width", "keyPath should be 'emitterSize.width'")
        XCTAssertEqual(EmitterSize.Height.keyPath, "emitterSize.height", "keyPath should be 'emitterSize.height'")
    }

    func testEmitterPosition() {
        XCTAssertEqual(EmitterPosition.keyPath, "emitterPosition", "keyPath should be 'emitterPosition'")
        XCTAssertEqual(EmitterPosition.X.keyPath, "emitterPosition.x", "keyPath should be 'emitterPosition.x'")
        XCTAssertEqual(EmitterPosition.Y.keyPath, "emitterPosition.y", "keyPath should be 'emitterPosition.y'")
        XCTAssertEqual(EmitterPosition.Z.keyPath, "emitterZPosition", "keyPath should be 'emitterZPosition'")
    }

    func testEmitterPreservesDepth() {
        XCTAssertEqual(EmitterPreservesDepth.keyPath, "preservesDepth", "keyPath should be 'preservesDepth'")
    }

    func testBirthRate() {
        XCTAssertEqual(BirthRate.keyPath, "birthRate", "keyPath should be 'birthRate'")
    }

    func testLifetime() {
        XCTAssertEqual(Lifetime.keyPath, "lifetime", "keyPath should be 'lifetime'")
    }

    func testRenderMode() {
        XCTAssertEqual(RenderMode.keyPath, "renderMode", "keyPath should be 'renderMode'")
    }

    func testScale() {
        XCTAssertEqual(Scale.keyPath, "scale", "keyPath should be 'scale'")
    }

    func testSeed() {
        XCTAssertEqual(Seed.keyPath, "seed", "keyPath should be 'seed'")
    }

    func testSpin() {
        XCTAssertEqual(Spin.keyPath, "spin", "keyPath should be 'spin'")
    }

    func testVelocity() {
        XCTAssertEqual(Velocity.keyPath, "velocity", "keyPath should be 'velocity'")
    }


    // MARK: - CAGradientLayer properties

    func testColors() {
        XCTAssertEqual(Colors.keyPath, "colors", "keyPath should be 'colors'")
        XCTAssertEqual(Colors.CGColors.keyPath, "colors", "keyPath should be 'colors'")
    }

    @available(iOS 12.0, *)
    func testGradientType() {
        XCTAssertEqual(GradientType.keyPath, "type", "keyPath should be 'type'")
    }

    func testLocations() {
        XCTAssertEqual(Locations.keyPath, "locations", "keyPath should be 'locations'")
    }

    func testEndPoint() {
        XCTAssertEqual(EndPoint.keyPath, "endPoint", "keyPath should be 'endPoint'")
        XCTAssertEqual(EndPoint.X.keyPath, "endPoint.x", "keyPath should be 'endPoint.x'")
        XCTAssertEqual(EndPoint.Y.keyPath, "endPoint.y", "keyPath should be 'endPoint.y'")
    }

    func testStartPoint() {
        XCTAssertEqual(StartPoint.keyPath, "startPoint", "keyPath should be 'startPoint'")
        XCTAssertEqual(StartPoint.X.keyPath, "startPoint.x", "keyPath should be 'startPoint.x'")
        XCTAssertEqual(StartPoint.Y.keyPath, "startPoint.y", "keyPath should be 'startPoint.y'")
    }


    // MARK: - CAReplicatorLayer properties

    func testInstanceColor() {
        XCTAssertEqual(InstanceColor.keyPath, "instanceColor", "keyPath should be 'instanceColor'")
        XCTAssertEqual(InstanceColor.CGColor.keyPath, "instanceColor", "keyPath should be 'instanceColor'")
    }

    func testInstanceDelay() {
        XCTAssertEqual(InstanceDelay.keyPath, "instanceDelay", "keyPath should be 'instanceDelay'")
    }

    func testInstanceTransform() {
        XCTAssertEqual(InstanceTransform.keyPath, "instanceTransform", "keyPath should be 'instanceTransform'")
        XCTAssertEqual(InstanceTransform.Rotation.keyPath, "instanceTransform.rotation", "keyPath should be 'instanceTransform.rotation'")
        XCTAssertEqual(InstanceTransform.Rotation.X.keyPath, "instanceTransform.rotation.x", "keyPath should be 'instanceTransform.rotation.x'")
        XCTAssertEqual(InstanceTransform.Rotation.Y.keyPath, "instanceTransform.rotation.y", "keyPath should be 'instanceTransform.rotation.y'")
        XCTAssertEqual(InstanceTransform.Rotation.Z.keyPath, "instanceTransform.rotation.z", "keyPath should be 'instanceTransform.rotation.z'")
        XCTAssertEqual(InstanceTransform.Scale.keyPath, "instanceTransform.scale", "keyPath should be 'instanceTransform.scale'")
        XCTAssertEqual(InstanceTransform.Scale.X.keyPath, "instanceTransform.scale.x", "keyPath should be 'instanceTransform.scale.x'")
        XCTAssertEqual(InstanceTransform.Scale.Y.keyPath, "instanceTransform.scale.y", "keyPath should be 'instanceTransform.scale.y'")
        XCTAssertEqual(InstanceTransform.Scale.Z.keyPath, "instanceTransform.scale.z", "keyPath should be 'instanceTransform.scale.z'")
        XCTAssertEqual(InstanceTransform.Translation.keyPath, "instanceTransform.translation", "keyPath should be 'instanceTransform.translation'")
        XCTAssertEqual(InstanceTransform.Translation.X.keyPath, "instanceTransform.translation.x", "keyPath should be 'instanceTransform.translation.x'")
        XCTAssertEqual(InstanceTransform.Translation.Y.keyPath, "instanceTransform.translation.y", "keyPath should be 'instanceTransform.translation.y'")
        XCTAssertEqual(InstanceTransform.Translation.Z.keyPath, "instanceTransform.translation.z", "keyPath should be 'instanceTransform.translation.z'")
    }

    func testInstanceRedOffset() {
        XCTAssertEqual(InstanceRedOffset.keyPath, "instanceRedOffset", "keyPath should be 'instanceRedOffset'")
    }

    func testInstanceGreenOffset() {
        XCTAssertEqual(InstanceGreenOffset.keyPath, "instanceGreenOffset", "keyPath should be 'instanceGreenOffset'")
    }

    func testInstanceBlueOffset() {
        XCTAssertEqual(InstanceBlueOffset.keyPath, "instanceBlueOffset", "keyPath should be 'instanceBlueOffset'")
    }

    func testInstanceAlphaOffset() {
        XCTAssertEqual(InstanceAlphaOffset.keyPath, "instanceAlphaOffset", "keyPath should be 'instanceAlphaOffset'")
    }

    func testInstanceInstanceCount() {
        XCTAssertEqual(InstanceCount.keyPath, "instanceCount", "keyPath should be 'instanceCount'")
    }

    func testReplicatorPreservesDepth() {
        XCTAssertEqual(ReplicatorPreservesDepth.keyPath, "preservesDepth", "keyPath should be 'preservesDepth'")
    }


    // MARK: - CATextLayer properties

    func testAlignmentMode() {
        XCTAssertEqual(AlignmentMode.keyPath, "alignmentMode", "keyPath should be 'alignmentMode'")
    }

    func testAllowsFontSubpixelQuantization() {
        XCTAssertEqual(AllowsFontSubpixelQuantization.keyPath, "allowsFontSubpixelQuantization", "keyPath should be 'allowsFontSubpixelQuantization'")
    }

    func testFont() {
        XCTAssertEqual(Font.keyPath, "font", "keyPath should be 'font'")
    }

    func testFontSize() {
        XCTAssertEqual(FontSize.keyPath, "fontSize", "keyPath should be 'fontSize'")
    }

    func testForegroundColor() {
        XCTAssertEqual(ForegroundColor.keyPath, "foregroundColor", "keyPath should be 'foregroundColor'")
        XCTAssertEqual(ForegroundColor.CGColor.keyPath, "foregroundColor", "keyPath should be 'foregroundColor'")
    }

    func testString() {
        XCTAssertEqual(TextString.keyPath, "string", "keyPath should be 'string'")
    }

    func testTruncationMode() {
        XCTAssertEqual(TruncationMode.keyPath, "truncationMode", "keyPath should be 'truncationMode'")
    }

    func testWrapped() {
        XCTAssertEqual(Wrapped.keyPath, "wrapped", "keyPath should be 'wrapped'")
    }
}
