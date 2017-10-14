//
//  ViewController.swift
//  KRActivityIndicatorViewDemo
//
//  Created by Henry Serrano on 12/31/16.
//  Copyright © 2016 Henry Serrano. All rights reserved.
//

import Cocoa
import KRActivityIndicatorView

class ViewController: NSViewController {

    @IBOutlet var animButton : NSButton!
    @IBOutlet var contentView : NSVisualEffectView!
    
    @IBOutlet var ballPulse : KRActivityIndicatorView!
    @IBOutlet var ballGridPulse : KRActivityIndicatorView!
    @IBOutlet var ballClipRotate : KRActivityIndicatorView!
    @IBOutlet var squareSpin : KRActivityIndicatorView!
    @IBOutlet var ballClipRotatePulse : KRActivityIndicatorView!
    @IBOutlet var ballClipRotateMultiple : KRActivityIndicatorView!
    @IBOutlet var ballPulseRise : KRActivityIndicatorView!
    @IBOutlet var ballRotate : KRActivityIndicatorView!
    @IBOutlet var cubeTransition : KRActivityIndicatorView!
    @IBOutlet var ballZigZag : KRActivityIndicatorView!
    @IBOutlet var ballZigZagDefect : KRActivityIndicatorView!
    @IBOutlet var ballTrianglePath : KRActivityIndicatorView!
    @IBOutlet var ballScale : KRActivityIndicatorView!
    @IBOutlet var lineScale : KRActivityIndicatorView!
    @IBOutlet var lineScaleParty : KRActivityIndicatorView!
    @IBOutlet var ballScaleMultiple : KRActivityIndicatorView!
    @IBOutlet var ballPulseSync : KRActivityIndicatorView!
    @IBOutlet var ballBeat : KRActivityIndicatorView!
    @IBOutlet var lineScalePulseOut : KRActivityIndicatorView!
    @IBOutlet var lineScalePulseOutRapid : KRActivityIndicatorView!
    @IBOutlet var ballScaleRipple : KRActivityIndicatorView!
    @IBOutlet var ballScaleRippleMultiple : KRActivityIndicatorView!
    @IBOutlet var ballSpinFadeLoader : KRActivityIndicatorView!
    @IBOutlet var lineSpinFadeLoader : KRActivityIndicatorView!
    @IBOutlet var triangleSkewSpin : KRActivityIndicatorView!
    @IBOutlet var pacman : KRActivityIndicatorView!
    @IBOutlet var ballGridBeat : KRActivityIndicatorView!
    @IBOutlet var semiCircleSpin : KRActivityIndicatorView!
    @IBOutlet var ballRotateChase : KRActivityIndicatorView!
    @IBOutlet var orbit : KRActivityIndicatorView!
    @IBOutlet var audioEqualizer : KRActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.appearance = NSAppearance.init(named: NSAppearance.Name.vibrantDark)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    // TODO: optimise function?
    @IBAction func startAnimation(_ sender: Any) {
        
        if(ballPulse.isAnimating){
            ballPulse.stopAnimating();
            ballGridPulse.stopAnimating();
            ballClipRotate.stopAnimating();
            squareSpin.stopAnimating();
            ballClipRotatePulse.stopAnimating();
            ballClipRotateMultiple.stopAnimating();
            ballPulseRise.stopAnimating();
            ballRotate.stopAnimating();
            cubeTransition.stopAnimating();
            ballZigZag.stopAnimating();
            ballZigZagDefect.stopAnimating();
            ballTrianglePath.stopAnimating();
            ballScale.stopAnimating();
            lineScale.stopAnimating();
            lineScaleParty.stopAnimating();
            ballScaleMultiple.stopAnimating();
            ballPulseSync.stopAnimating();
            ballBeat.stopAnimating();
            lineScalePulseOut.stopAnimating();
            lineScalePulseOutRapid.stopAnimating();
            ballScaleRipple.stopAnimating();
            ballScaleRippleMultiple.stopAnimating();
            ballSpinFadeLoader.stopAnimating();
            lineSpinFadeLoader.stopAnimating();
            triangleSkewSpin.stopAnimating();
            pacman.stopAnimating();
            ballGridBeat.stopAnimating();
            semiCircleSpin.stopAnimating();
            ballRotateChase.stopAnimating();
            orbit.stopAnimating();
            audioEqualizer.stopAnimating();

            animButton.title = "Start Animations"
        }else{
            ballPulse.startAnimating();
            ballGridPulse.startAnimating();
            ballClipRotate.startAnimating();
            squareSpin.startAnimating();
            ballClipRotatePulse.startAnimating();
            ballClipRotateMultiple.startAnimating();
            ballPulseRise.startAnimating();
            ballRotate.startAnimating();
            cubeTransition.startAnimating();
            ballZigZag.startAnimating();
            ballZigZagDefect.startAnimating();
            ballTrianglePath.startAnimating();
            ballScale.startAnimating();
            lineScale.startAnimating();
            lineScaleParty.startAnimating();
            ballScaleMultiple.startAnimating();
            ballPulseSync.startAnimating();
            ballBeat.startAnimating();
            lineScalePulseOut.startAnimating();
            lineScalePulseOutRapid.startAnimating();
            ballScaleRipple.startAnimating();
            ballScaleRippleMultiple.startAnimating();
            ballSpinFadeLoader.startAnimating();
            lineSpinFadeLoader.startAnimating();
            triangleSkewSpin.startAnimating();
            pacman.startAnimating();
            ballGridBeat.startAnimating();
            semiCircleSpin.startAnimating();
            ballRotateChase.startAnimating();
            orbit.startAnimating();
            audioEqualizer.startAnimating();
          
            animButton.title = "Stop Animations"
        }
    }
}

