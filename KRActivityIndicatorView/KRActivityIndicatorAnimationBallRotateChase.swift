//
//  KRActivityIndicatorAnimationBallRotateChase.swift
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

class KRActivityIndicatorAnimationBallRotateChase: KRActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: NSColor) {
        let circleSize = size.width / 5;
        
        // Draw circles
        for i in 0 ..< 5 {
            let factor = Float(i) * 1.0 / 5
            let circle = KRActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let animation = rotateAnimation(factor, x: layer.bounds.size.width / 2, y: layer.bounds.size.height / 2, size: CGSize(width: size.width - circleSize, height: size.height - circleSize))
            
            circle.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
    
    func rotateAnimation(_ rate: Float, x: CGFloat, y: CGFloat, size: CGSize) -> CAAnimationGroup {
        let duration: CFTimeInterval = 1.5
        let fromScale = 1 - rate
        let toScale = 0.2 + rate
        let timeFunc = CAMediaTimingFunction(controlPoints: 0.5, 0.15 + rate, 0.25, 1.0)
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = duration
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.fromValue = fromScale
        scaleAnimation.toValue = toScale
        
        // Position animation
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        positionAnimation.duration = duration
        positionAnimation.repeatCount = HUGE
        //positionAnimation.path = CGPathFromNSBezierPath(nsPath: NSBezierPath(arcCenter: CGPoint(x: x, y: y), radius: size.width / 2, startAngle: 3 * CGFloat(M_PI) * 0.5, endAngle: 3 * CGFloat(M_PI) * 0.5 + 2 * CGFloat(M_PI), clockwise: true))
        let arcBezier = NSBezierPath()
        arcBezier.appendArc(withCenter: CGPoint(x: x, y:y), radius: size.width / 2, startAngle: 3 * CGFloat(Float.pi) * 0.5, endAngle: 3 * CGFloat(Float.pi), clockwise: true)
        positionAnimation.path = CGPathFromNSBezierPath(nsPath: arcBezier)
        
        // Aniamtion
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation, positionAnimation]
        animation.timingFunction = timeFunc
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        return animation
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

