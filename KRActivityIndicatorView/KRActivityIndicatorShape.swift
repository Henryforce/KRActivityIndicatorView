//
//  KRActivityIndicatorShape.swift
//  KRActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Originally written to work in iOS by Vinh Nguyen in 2016
// Adapted to OSX by Henry Serrano in 2017. Updated for Swift 4.

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

enum KRActivityIndicatorShape {
    case circle
    case circleSemi
    case ring
    case ringTwoHalfVertical
    case ringTwoHalfHorizontal
    case ringThirdFour
    case rectangle
    case triangle
    case line
    case pacman
    
    func layerWith(size: CGSize, color: NSColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        var path: NSBezierPath = NSBezierPath()
        let lineWidth: CGFloat = 2
        
        // NOTE: NSBezierPath.appendArc(...) accepts ANGLES and NOT RADIANS!
        //       in iOS, the arc function accetps radians and not angles.
        switch self {
        case .circle:
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: 360,
                        clockwise: false);
            layer.fillColor = color.cgColor
        case .circleSemi:
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-M_PI / 6),
                        endAngle: CGFloat(-5 * M_PI / 6),
                        clockwise: false)*/
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius: size.width / 2,
                           startAngle: -30,
                           endAngle: -150,
                           clockwise: true)
            path.close()
            layer.fillColor = color.cgColor
        case .ring:
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat(2 * M_PI),
                        clockwise: false);*/
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius: size.width / 2,
                           startAngle: 0,
                           endAngle: 360,
                           clockwise: false);
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringTwoHalfVertical:
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius:size.width / 2,
                        startAngle:CGFloat(-3 * M_PI_4),
                        endAngle:CGFloat(-M_PI_4),
                        clockwise:true)*/
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius:size.width / 2,
                           startAngle:-135,
                           endAngle:-45,
                           clockwise:false)
            path.move(
                to: CGPoint(x: size.width / 2 - size.width / 2 * CGFloat(cos(Float.pi/4)),
                            y: size.height / 2 + size.height / 2 * CGFloat(sin(Float.pi/4)))
            )
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius:size.width / 2,
                        startAngle:CGFloat(-5 * M_PI_4),
                        endAngle:CGFloat(-7 * M_PI_4),
                        clockwise:false)*/
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius:size.width / 2,
                           startAngle:-225,
                           endAngle:-315,
                           clockwise:true)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringTwoHalfHorizontal:
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius:size.width / 2,
                        startAngle:CGFloat(3 * M_PI_4),
                        endAngle:CGFloat(5 * M_PI_4),
                        clockwise:true) */
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius:size.width / 2,
                           startAngle:135,
                           endAngle:225,
                           clockwise:false)
            path.move(
                to: CGPoint(x: size.width / 2 + size.width / 2 * CGFloat(cos(Float.pi/4)),
                            y: size.height / 2 - size.height / 2 * CGFloat(sin(Float.pi/4)))
            )
            /*path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius:size.width / 2,
                        startAngle:CGFloat(-M_PI_4),
                        endAngle:CGFloat(M_PI_4),
                        clockwise:true)*/
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius:size.width / 2,
                           startAngle:-45,
                           endAngle:45,
                           clockwise:true)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringThirdFour:
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                           radius: size.width / 2,
                           startAngle: -45,
                           endAngle: -135,
                           clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = 2
        case .rectangle:
            path.move(to: CGPoint(x: 0, y: 0))
            path.line(to: CGPoint(x: size.width, y: 0))
            path.line(to: CGPoint(x: size.width, y: size.height))
            path.line(to: CGPoint(x: 0, y: size.height))
            /*path.appendLine(to: CGPoint(x: size.width, y: 0))
            path.appendLine(to: CGPoint(x: size.width, y: size.height))
            path.appendLine(to: CGPoint(x: 0, y: size.height))*/
            layer.fillColor = color.cgColor
        case .triangle:
            let offsetY = size.height / 4
            
            /*path.move(to: CGPoint(x: 0, y: size.height - offsetY))
            path.addLine(to: CGPoint(x: size.width / 2, y: size.height / 2 - offsetY))
            path.addLine(to: CGPoint(x: size.width, y: size.height - offsetY))*/
            path.move(to: CGPoint(x: 0, y: size.height - offsetY))
            path.line(to: CGPoint(x: size.width / 2, y: size.height / 2 - offsetY))
            path.line(to: CGPoint(x: size.width, y: size.height - offsetY))
            
            path.close()
            layer.fillColor = color.cgColor
        case .line:
            path = NSBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height),
                                xRadius: size.width / 2, yRadius: size.width / 2)
            layer.fillColor = color.cgColor
        case .pacman:
            path.appendArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 4,
                        startAngle: 360,
                        endAngle: 0,
                        clockwise: true);
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = size.width / 2
        }
        
        layer.backgroundColor = nil
        layer.path = CGPathFromNSBezierPath(nsPath: path)
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return layer
    }
    
    func CGPathFromNSBezierPath(nsPath: NSBezierPath) -> CGPath! {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        for i in 0 ..< nsPath.elementCount {
            let type = nsPath.element(at: i, associatedPoints: &points)
            switch type {
            case .moveToBezierPathElement: path.move(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .lineToBezierPathElement: path.addLine(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .curveToBezierPathElement: path.addCurve(to: CGPoint(x: points[2].x, y: points[2].y),
                                                                control1: CGPoint(x: points[0].x, y: points[0].y),
                                                                control2: CGPoint(x: points[1].x, y: points[1].y) )
            case .closePathBezierPathElement: path.closeSubpath()
            }
        }
        return path
        // Create path
        /*let path = CGMutablePath()
        let points = UnsafeMutablePointer<NSPoint>.allocate(capacity: 3)
        let numElements = nsPath.elementCount
        let cgPoint1 = CGPoint(x: points[0].x, y: points[0].y)
        let cgPoint2 = CGPoint(x: points[1].x, y: points[1].y)
        let cgPoint3 = CGPoint(x: points[2].x, y: points[2].y)
        
        if numElements > 0
        {
            var didClosePath = true
            
            for index in 0..<numElements
            {
                let pathType = nsPath.element(at: index, associatedPoints: points)
                
                switch pathType
                {
                case .moveToBezierPathElement :
                    path.move(to: cgPoint1)
                case .lineToBezierPathElement :
                    path.addLine(to: cgPoint1)
                    didClosePath = false
                case .curveToBezierPathElement :
                    path.addCurve(to: cgPoint1, control1: cgPoint2, control2: cgPoint3)
                    didClosePath = false
                case .closePathBezierPathElement:
                    path.closeSubpath()
                    didClosePath = true
                }
            }
            
            if !didClosePath { path.closeSubpath() }
        }
        
        points.deallocate(capacity: 3)
        return path*/
    }
}
