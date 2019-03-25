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

- Create animation sequences:

These extend the functionality of CAAnimationGroup so sequence items can be 'action' closures & 'wait' (do nothing) animations.

        let x = self.bounds.width / 2
        let y = self.bounds.height / 2
        let width: CGFloat = 200
        let height: CGFloat = 300
        
        let ellipsePath = UIBezierPath(ovalIn: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        myShapeLayer.set(Path(ellipsePath))
        myShapeLayer.set(FillColor(.yellow))
        myShapeLayer.set(StrokeColor(.green))
        
        let waitDescriptor = Descriptor.Wait(for: 2)
        let actionDescriptor1 = Descriptor.Action {
            print("Setting fillColor")
            myShapeLayer.set(FillColor(.purple))
        }
        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.yellow, to: .purple, duration: 2)
        let actionDescriptor2 = Descriptor.Action {
            print("Setting lineWidth")
            myShapeLayer.set(LineWidth(10)) // in this case we're setting the layer's lineWidth property prior to animating it
        }
        let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(1, to: 10, duration: 2)
        
        // create the first 'sequence' descriptor using the above descriptors
        let sequenceDescriptor = Descriptor.Group.sequential(using: [waitDescriptor, actionDescriptor1, fillColorDescriptor, waitDescriptor, actionDescriptor2, lineWidthDescriptor])
        
        let keyFrameProperties: [Properties.KeyFrameAnimation] = [.calculationMode(.paced)]
        let translate = CGAffineTransform(translationX: width / -2, y: 0)
        ellipsePath.apply(translate)
        let moveDescriptor = Descriptor.KeyFrame<Position>.path(ellipsePath, otherAnimationProperties: keyFrameProperties)
        let rotateDescriptor = Descriptor.Basic<Transform.Rotation>.from(0, to: CGFloat.pi * 4)
        
        // create a 'concurrent' descriptor to move & rotate
        let concurrentDescriptor = Descriptor.Group.concurrent(using: [moveDescriptor, rotateDescriptor], duration: 8)
        
        // put the two concurrent animations together in another concurrent group (to run them at the same time)
        let groupDescriptor = Descriptor.Group.concurrent(using: [sequenceDescriptor, concurrentDescriptor], duration: 8)
        
        // create the animation on myShapeLayer
        try? myShapeLayer.addAnimationsGroup(describedBy: groupDescriptor, animationFinished: { _, _ in
            print("We're all done now")
        })
\
Adding groups will throw if any of the descriptors are for properties not present on the type of layer being used, eg, CAShapeLayer properties on a CAGradientLayer.


Everything is type-safe, ie, CAShapeLayer property animations can only be applied to CAShapeLayers, CAGradientLayer property animations can only be applied to CAGradientLayers, etc.

See the 'HelloView' & 'ActionView' classes in the demo app for further examples.


## Licence
MIT
