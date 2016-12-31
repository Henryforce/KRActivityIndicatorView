//
//  StompboxView.swift
//  Kryo-OSX
//
//  Created by Henry Serrano on 12/23/16.
//  Copyright © 2016 Industrias Vanderdroid SAPI de CV. All rights reserved.
//

import Cocoa

public class KEnclosureView: NSView{
    
    var midPink = NSColor.black
    var darkPink = NSColor.black
    var ledColor = NSColor.black
    
    var knob1Text = "-"
    var knob2Text = "-"
    var knob3Text = "-"
    var knob4Text = "-"
    
    var knobTextSize = 12.0
    
    override public func draw(_ rect: CGRect) {
        KryoStompbox.drawCanvas1(frame: rect, ledColor: ledColor, midKPink: midPink, knob1_Text: knob1Text, knob2_Text: knob2Text, knob3_Text: knob3Text, knob4_Text: knob4Text, knobs_TextSize: CGFloat(knobTextSize), enclosureRadius: 15.0)
    }
    
}
