//
//  MediumProgressView.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

public class MediumProgressView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
 
    convenience public init(frame: CGRect, isLeft: Bool, duration: CFTimeInterval) {
        self.init(frame: frame)
        initialize(isLeft, duration: duration)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    public func initialize(isLeft: Bool, duration: CFTimeInterval) {
        layer.addAnimation(mediumProgressAnimation(isLeft, duration: duration), forKey: "animation")
    }

    public func mediumProgressAnimation(isLeft: Bool, duration: CFTimeInterval) -> CAAnimation {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue   = isLeft ? -frame.size.width : frame.size.width * 2
        animation.toValue     = isLeft ? frame.size.width * 2 : -frame.size.width
        animation.duration    = duration
        animation.fillMode    = kCAFillModeBoth
        animation.repeatCount = Float.infinity
        return animation
    }
    
}
