//
//  KRActivityIndicatorView.swift
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

/**
 Enum of animation types used for activity indicator view.
 
 - Blank:                   Blank animation.
 - BallPulse:               BallPulse animation.
 - BallGridPulse:           BallGridPulse animation.
 - BallClipRotate:          BallClipRotate animation.
 - SquareSpin:              SquareSpin animation.
 - BallClipRotatePulse:     BallClipRotatePulse animation.
 - BallClipRotateMultiple:  BallClipRotateMultiple animation.
 - BallPulseRise:           BallPulseRise animation.
 - BallRotate:              BallRotate animation.
 - CubeTransition:          CubeTransition animation.
 - BallZigZag:              BallZigZag animation.
 - BallZigZagDeflect:       BallZigZagDeflect animation.
 - BallTrianglePath:        BallTrianglePath animation.
 - BallScale:               BallScale animation.
 - LineScale:               LineScale animation.
 - LineScaleParty:          LineScaleParty animation.
 - BallScaleMultiple:       BallScaleMultiple animation.
 - BallPulseSync:           BallPulseSync animation.
 - BallBeat:                BallBeat animation.
 - LineScalePulseOut:       LineScalePulseOut animation.
 - LineScalePulseOutRapid:  LineScalePulseOutRapid animation.
 - BallScaleRipple:         BallScaleRipple animation.
 - BallScaleRippleMultiple: BallScaleRippleMultiple animation.
 - BallSpinFadeLoader:      BallSpinFadeLoader animation.
 - LineSpinFadeLoader:      LineSpinFadeLoader animation.
 - TriangleSkewSpin:        TriangleSkewSpin animation.
 - Pacman:                  Pacman animation.
 - BallGridBeat:            BallGridBeat animation.
 - SemiCircleSpin:          SemiCircleSpin animation.
 - BallRotateChase:         BallRotateChase animation.
 - Orbit:                   Orbit animation.
 - AudioEqualizer:          AudioEqualizer animation.
 */
public enum KRActivityIndicatorType: Int {
    /**
     Blank.
     
     - returns: Instance of KRActivityIndicatorAnimationBlank.
     */
    case blank
    /**
     BallPulse.
     
     - returns: Instance of KRActivityIndicatorAnimationBallPulse.
     */
    case ballPulse
    /**
     BallGridPulse.
     
     - returns: Instance of KRActivityIndicatorAnimationBallGridPulse.
     */
    case ballGridPulse
    /**
     BallClipRotate.
     
     - returns: Instance of KRActivityIndicatorAnimationBallClipRotate.
     */
    case ballClipRotate
    /**
     SquareSpin.
     
     - returns: Instance of KRActivityIndicatorAnimationSquareSpin.
     */
    case squareSpin
    /**
     BallClipRotatePulse.
     
     - returns: Instance of KRActivityIndicatorAnimationBallClipRotatePulse.
     */
    case ballClipRotatePulse
    /**
     BallClipRotateMultiple.
     
     - returns: Instance of KRActivityIndicatorAnimationBallClipRotateMultiple.
     */
    case ballClipRotateMultiple
    /**
     BallPulseRise.
     
     - returns: Instance of KRActivityIndicatorAnimationBallPulseRise.
     */
    case ballPulseRise
    /**
     BallRotate.
     
     - returns: Instance of KRActivityIndicatorAnimationBallRotate.
     */
    case ballRotate
    /**
     CubeTransition.
     
     - returns: Instance of KRActivityIndicatorAnimationCubeTransition.
     */
    case cubeTransition
    /**
     BallZigZag.
     
     - returns: Instance of KRActivityIndicatorAnimationBallZigZag.
     */
    case ballZigZag
    /**
     BallZigZagDeflect
     
     - returns: Instance of KRActivityIndicatorAnimationBallZigZagDeflect
     */
    case ballZigZagDeflect
    /**
     BallTrianglePath.
     
     - returns: Instance of KRActivityIndicatorAnimationBallTrianglePath.
     */
    case ballTrianglePath
    /**
     BallScale.
     
     - returns: Instance of KRActivityIndicatorAnimationBallScale.
     */
    case ballScale
    /**
     LineScale.
     
     - returns: Instance of KRActivityIndicatorAnimationLineScale.
     */
    case lineScale
    /**
     LineScaleParty.
     
     - returns: Instance of KRActivityIndicatorAnimationLineScaleParty.
     */
    case lineScaleParty
    /**
     BallScaleMultiple.
     
     - returns: Instance of KRActivityIndicatorAnimationBallScaleMultiple.
     */
    case ballScaleMultiple
    /**
     BallPulseSync.
     
     - returns: Instance of KRActivityIndicatorAnimationBallPulseSync.
     */
    case ballPulseSync
    /**
     BallBeat.
     
     - returns: Instance of KRActivityIndicatorAnimationBallBeat.
     */
    case ballBeat
    /**
     LineScalePulseOut.
     
     - returns: Instance of KRActivityIndicatorAnimationLineScalePulseOut.
     */
    case lineScalePulseOut
    /**
     LineScalePulseOutRapid.
     
     - returns: Instance of KRActivityIndicatorAnimationLineScalePulseOutRapid.
     */
    case lineScalePulseOutRapid
    /**
     BallScaleRipple.
     
     - returns: Instance of KRActivityIndicatorAnimationBallScaleRipple.
     */
    case ballScaleRipple
    /**
     BallScaleRippleMultiple.
     
     - returns: Instance of KRActivityIndicatorAnimationBallScaleRippleMultiple.
     */
    case ballScaleRippleMultiple
    /**
     BallSpinFadeLoader.
     
     - returns: Instance of KRActivityIndicatorAnimationBallSpinFadeLoader.
     */
    case ballSpinFadeLoader
    /**
     LineSpinFadeLoader.
     
     - returns: Instance of KRActivityIndicatorAnimationLineSpinFadeLoader.
     */
    case lineSpinFadeLoader
    /**
     TriangleSkewSpin.
     
     - returns: Instance of KRActivityIndicatorAnimationTriangleSkewSpin.
     */
    case triangleSkewSpin
    /**
     Pacman.
     
     - returns: Instance of KRActivityIndicatorAnimationPacman.
     */
    case pacman
    /**
     BallGridBeat.
     
     - returns: Instance of KRActivityIndicatorAnimationBallGridBeat.
     */
    case ballGridBeat
    /**
     SemiCircleSpin.
     
     - returns: Instance of KRActivityIndicatorAnimationSemiCircleSpin.
     */
    case semiCircleSpin
    /**
     BallRotateChase.
     
     - returns: Instance of KRActivityIndicatorAnimationBallRotateChase.
     */
    case ballRotateChase
    /**
     Orbit.
     
     - returns: Instance of KRActivityIndicatorAnimationOrbit.
     */
    case orbit
    /**
     AudioEqualizer.
     
     - returns: Instance of KRActivityIndicatorAnimationAudioEqualizer.
     */
    case audioEqualizer
    
    static let allTypes = (blank.rawValue ... audioEqualizer.rawValue).map{ KRActivityIndicatorType(rawValue: $0)! }
    
    func animation() -> KRActivityIndicatorAnimationDelegate {
        switch self {
        case .blank:
            return KRActivityIndicatorAnimationBlank()
        case .ballPulse:
            return KRActivityIndicatorAnimationBallPulse()
        case .ballGridPulse:
            return KRActivityIndicatorAnimationBallGridPulse()
        case .ballClipRotate:
            return KRActivityIndicatorAnimationBallClipRotate()
        case .squareSpin:
            return KRActivityIndicatorAnimationSquareSpin()
        case .ballClipRotatePulse:
            return KRActivityIndicatorAnimationBallClipRotatePulse()
        case .ballClipRotateMultiple:
            return KRActivityIndicatorAnimationBallClipRotateMultiple()
        case .ballPulseRise:
            return KRActivityIndicatorAnimationBallPulseRise()
        case .ballRotate:
            return KRActivityIndicatorAnimationBallRotate()
        case .cubeTransition:
            return KRActivityIndicatorAnimationCubeTransition()
        case .ballZigZag:
            return KRActivityIndicatorAnimationBallZigZag()
        case .ballZigZagDeflect:
            return KRActivityIndicatorAnimationBallZigZagDeflect()
        case .ballTrianglePath:
            return KRActivityIndicatorAnimationBallTrianglePath()
        case .ballScale:
            return KRActivityIndicatorAnimationBallScale()
        case .lineScale:
            return KRActivityIndicatorAnimationLineScale()
        case .lineScaleParty:
            return KRActivityIndicatorAnimationLineScaleParty()
        case .ballScaleMultiple:
            return KRActivityIndicatorAnimationBallScaleMultiple()
        case .ballPulseSync:
            return KRActivityIndicatorAnimationBallPulseSync()
        case .ballBeat:
            return KRActivityIndicatorAnimationBallBeat()
        case .lineScalePulseOut:
            return KRActivityIndicatorAnimationLineScalePulseOut()
        case .lineScalePulseOutRapid:
            return KRActivityIndicatorAnimationLineScalePulseOutRapid()
        case .ballScaleRipple:
            return KRActivityIndicatorAnimationBallScaleRipple()
        case .ballScaleRippleMultiple:
            return KRActivityIndicatorAnimationBallScaleRippleMultiple()
        case .ballSpinFadeLoader:
            return KRActivityIndicatorAnimationBallSpinFadeLoader()
        case .lineSpinFadeLoader:
            return KRActivityIndicatorAnimationLineSpinFadeLoader()
        case .triangleSkewSpin:
            return KRActivityIndicatorAnimationTriangleSkewSpin()
        case .pacman:
            return KRActivityIndicatorAnimationPacman()
        case .ballGridBeat:
            return KRActivityIndicatorAnimationBallGridBeat()
        case .semiCircleSpin:
            return KRActivityIndicatorAnimationSemiCircleSpin()
        case .ballRotateChase:
            return KRActivityIndicatorAnimationBallRotateChase()
        case .orbit:
            return KRActivityIndicatorAnimationOrbit()
        case .audioEqualizer:
            return KRActivityIndicatorAnimationAudioEqualizer()
        //default:
        //    return KRActivityIndicatorAnimationLineScalePulseOut()
        }
    }
}

/// Activity indicator view with nice animations
public final class KRActivityIndicatorView: NSView {
    /// Default type. Default value is .BallSpinFadeLoader.
    public static var DEFAULT_TYPE: KRActivityIndicatorType = .blank
    
    /// Default color. Default value is NSColor.white.
    public static var DEFAULT_COLOR = NSColor.white
    
    /// Default padding. Default value is 0.0 - 0% padding
    public static var DEFAULT_PADDING: CGFloat = 0.0
    
    /// Default size of activity indicator view in UI blocker. Default value is 60x60.
    public static var DEFAULT_BLOCKER_SIZE = CGSize(width: 60, height: 60)
    
    /// Default display time threshold to actually display UI blocker. Default value is 0 ms.
    public static var DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0
    
    /// Default minimum display time of UI blocker. Default value is 0 ms.
    public static var DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0
    
    /// Default message displayed in UI blocker. Default value is nil.
    public static var DEFAULT_BLOCKER_MESSAGE: String? = nil
    
    /// Default font of message displayed in UI blocker. Default value is bold system font, size 20.
    public static var DEFAULT_BLOCKER_MESSAGE_FONT = NSFont.boldSystemFont(ofSize: 20)
    
    /// Default background color of UI blocker. Default value is UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    public static var DEFAULT_BLOCKER_BACKGROUND_COLOR = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    /// Animation type.
    public var type: KRActivityIndicatorType = KRActivityIndicatorView.DEFAULT_TYPE
    
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var typeName: String {
        get {
            return getTypeName()
        }
        set {
            _setTypeName(newValue)
        }
    }
    
    /// Color of activity indicator view.
    @IBInspectable public var color: NSColor = KRActivityIndicatorView.DEFAULT_COLOR
    
    /// Padding of activity indicator view.
    @IBInspectable public var padding: CGFloat = KRActivityIndicatorView.DEFAULT_PADDING
    
    /// Current status of animation, read-only.
    @available(*, deprecated: 3.1)
    public var animating: Bool { return isAnimating }
    
    /// Current status of animation, read-only.
    public private(set) var isAnimating: Bool = false
    
    /**
     Returns an object initialized from data in a given unarchiver.
     self, initialized using the data in decoder.
     
     - parameter decoder: an unarchiver object.
     
     - returns: self, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //backgroundColor = NSColor.clear
        isHidden = true
    }
    
    /**
     Create a activity indicator view.
     
     Appropriate KRActivityIndicatorView.DEFAULT_* values are used for omitted params.
     
     - parameter frame:   view's frame.
     - parameter type:    animation type.
     - parameter color:   color of activity indicator view.
     - parameter padding: padding of activity indicator view.
     
     - returns: The activity indicator view.
     */
    public init(frame: CGRect, type: KRActivityIndicatorType? = nil, color: NSColor? = nil, padding: CGFloat? = nil) {
        self.type = type ?? KRActivityIndicatorView.DEFAULT_TYPE
        self.color = color ?? KRActivityIndicatorView.DEFAULT_COLOR
        self.padding = padding ?? KRActivityIndicatorView.DEFAULT_PADDING
        super.init(frame: frame)
        isHidden = true
    }
    
    /**
     Returns the natural size for the receiving view, considering only properties of the view itself.
     
     A size indicating the natural size for the receiving view based on its intrinsic properties.
     
     - returns: A size indicating the natural size for the receiving view based on its intrinsic properties.
     */
    public override var intrinsicContentSize : CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
    
    /**
     Start animating.
     */
    public final func startAnimating() {
        isHidden = false
        isAnimating = true
        layer?.speed = 1
        //self.type = KRActivityIndicatorView.DEFAULT_TYPE
        setUpAnimation()
    }
    
    /**
     Stop animating.
     */
    public final func stopAnimating() {
        isHidden = true
        isAnimating = false
        layer?.sublayers?.removeAll()
    }
    
    // MARK: Internal
    
    func _setTypeName(_ typeName: String) {
        for item in KRActivityIndicatorType.allTypes {
            if String(describing: item).caseInsensitiveCompare(typeName) == ComparisonResult.orderedSame {
                type = item
                break
            }
        }
    }
    
    func getTypeName() -> String {
        return String(describing: type)
    }
    
    // MARK: Privates
    
    private final func setUpAnimation() {
        
        if(layer == nil){
            layer = CALayer()
        }
        self.wantsLayer = true
        
        let animation: KRActivityIndicatorAnimationDelegate = type.animation()
        //var animationRect = UIEdgeInsetsInsetRect(frame, NSEdgeInsetsMake(padding, padding, padding, padding))
        // TODO: CGRectInset alternative for padding...
        var animationRect = CGRect(x: padding, y: padding, width: frame.size.width - padding, height: frame.size.height - padding)
        
        let minEdge = min(animationRect.width, animationRect.height)
        
        layer?.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: layer!, size: animationRect.size, color: color)
    }
}
