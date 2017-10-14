//
//  KRActivityIndicatorAnimationOrbit.swift
//  KRActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Originally written to work in iOS by Vinh Nguyen in 2016
// Adapted to OSX by Henry Serrano in 2017

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Cocoa

class KRActivityIndicatorAnimationOrbit: KRActivityIndicatorAnimationDelegate {
    let duration: CFTimeInterval = 1.9
    let satelliteCoreRatio: CGFloat = 0.25
    let distanceRatio:CGFloat = 1.5 // distance / core size
    
    var coreSize: CGFloat = 0
    var satelliteSize: CGFloat = 0
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: NSColor) {
        coreSize = size.width / (1 + satelliteCoreRatio + distanceRatio)
        satelliteSize = coreSize * satelliteCoreRatio
        
        ring1InLayer(layer, size: size, color: color)
        ring2InLayer(layer, size: size, color: color)
        coreInLayer(layer, size: size, color: color)
        satelliteInLayer(layer, size: size, color: color)
    }
    
    func ring1InLayer(_ layer: CALayer, size: CGSize, color: NSColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.45, 0.45, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        scaleAnimation.values = [0, 0, 1.3, 2]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        
        opacityAnimation.keyTimes = [0, 0.45, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        opacityAnimation.values = [0.8, 0.8, 0]
        opacityAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KRActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func ring2InLayer(_ layer: CALayer, size: CGSize, color: NSColor) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.55, 0.55, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        scaleAnimation.values = [0, 0, 1.3, 2.1]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        
        opacityAnimation.keyTimes = [0, 0.55, 0.65, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear), timingFunction]
        opacityAnimation.values = [0.7, 0.7, 0, 0]
        opacityAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KRActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func coreInLayer(_ layer: CALayer, size: CGSize, color: NSColor) {
        let inTimingFunction = CAMediaTimingFunction(controlPoints: 0.7, 0, 1, 0.5)
        let outTimingFunction = CAMediaTimingFunction(controlPoints: 0, 0.7, 0.5, 1)
        let standByTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.45, 0.55, 1]
        scaleAnimation.timingFunctions = [inTimingFunction, standByTimingFunction, outTimingFunction];
        scaleAnimation.values = [1, 1.3, 1.3, 1]
        scaleAnimation.duration = duration
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KRActivityIndicatorShape.circle.layerWith(size: CGSize(width: coreSize, height: coreSize), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - coreSize) / 2,
                           y: (layer.bounds.size.height - coreSize) / 2,
                           width: coreSize,
                           height: coreSize)
        
        circle.frame = frame
        circle.add(scaleAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func satelliteInLayer(_ layer: CALayer, size: CGSize, color: NSColor) {
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "position")
        let arcBezier = NSBezierPath()
        arcBezier.appendArc(withCenter: CGPoint(x: layer.bounds.midX, y:layer.bounds.midY), radius: (size.width - satelliteSize) / 2, startAngle: CGFloat(Float.pi) * 1.5, endAngle: CGFloat(Float.pi) * 1.5 + 4 * CGFloat(Float.pi), clockwise: true)
        rotateAnimation.path = CGPathFromNSBezierPath(nsPath: arcBezier)
        /*rotateAnimation.path = NSBezierPath(arcCenter: CGPoint(x: layer.bounds.midX, y: layer.bounds.midY),
                                            radius: (size.width - satelliteSize) / 2,
                                            startAngle: CGFloat(M_PI) * 1.5,
                                            endAngle: CGFloat(M_PI) * 1.5 + 4 * CGFloat(M_PI),
                                            clockwise: true).cgPath*/
        rotateAnimation.duration = duration * 2
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KRActivityIndicatorShape.circle.layerWith(size: CGSize(width: satelliteSize, height: satelliteSize), color: color)
        let frame = CGRect(x: 0, y: 0, width: satelliteSize, height: satelliteSize)
        
        circle.frame = frame
        circle.add(rotateAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
    
    func CGPathFromNSBezierPath(nsPath: NSBezierPath) -> CGPath! {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        for i in 0 ..< nsPath.elementCount {
            let type = nsPath.element(at: i, associatedPoints: &points)
            switch type {
            case .moveToBezierPathElement: path.move(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .lineToBezierPathElement: path.addLine(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .curveToBezierPathElement: path.addCurve(      to: CGPoint(x: points[2].x, y: points[2].y),
                                                                control1: CGPoint(x: points[0].x, y: points[0].y),
                                                                control2: CGPoint(x: points[1].x, y: points[1].y) )
            case .closePathBezierPathElement: path.closeSubpath()
            }
        }
        return path
    }
}
