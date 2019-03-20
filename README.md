# SwiftyCoreAnimation

A more Swift-like wrapper around Core Animation

## Compatibility
 - iOS 10.x
 - Some features only available on iOS 12+

## Features

 - Use more 'Swifty' types for layer properties (no more NSNumbers or NSValues, or Any? for keyPaths):

myShapeLayer.set(FillColor(.red))
myShapeLayer.set(LineDashPattern([2, 5, 3]))
myLayer.set(Transform.Rotation.Z(CGFloat.pi / 2))

let gradientLocations: [CGFloat] = myGradientLayer.get(Locations.self) // array of CGFloats

 - Create animations using Descriptors:

let basicFillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green, duration: 2)
myShapeLayer.addBasicAnimation(describedBy: basicFillColorDescriptor) // add an animation using the descriptor 

let path: CGPath = someTextPath // the path for the keyFrame animation
let properties: [Properties.KeyFrameAnimation] = [.calculationMode(.paced)] // tell the animation to use paced calculationMode
let keyFramePositionDescriptor = Descriptor.KeyFrame<Position>.path(path, duration, otherAnimationProperties: properties)
myFollowerLayer.addKeyFrameAnimation(describedBy: keyFramePositionDescriptor) // add an animation using the descriptor 

 - Have 'animation finished' closures:

myShapeLayer.addBasicAnimation(describedBy: basicFillColorDescriptor, animationFinished: { animation, finished in
    // do something now the animation has finished
})


Everything is type-safe, ie, CAShapeLayer property animations can only be applied to CAShapeLayers, CAGradientLayer property animations can only be applied to CAGradientLayers, etc.

See the 'HelloView' class in the demo app for further examples.


## Licence
MIT