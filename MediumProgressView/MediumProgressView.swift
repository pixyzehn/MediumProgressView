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
 
    convenience public init(frame: CGRect, isLeftToRight: Bool, duration: CFTimeInterval) {
        self.init(frame: frame)
        initialize(isLeftToRight, duration: duration)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    private func initialize(isLeftToRight: Bool, duration: CFTimeInterval) {
        layer.addAnimation(mediumProgressAnimation(isLeftToRight, duration: duration), forKey: "animation")
    }

    private func mediumProgressAnimation(isLeftToRight: Bool, duration: CFTimeInterval) -> CAAnimation {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue   = isLeftToRight ? -frame.size.width : frame.size.width * 2
        animation.toValue     = isLeftToRight ? frame.size.width * 2 : -frame.size.width
        animation.duration    = duration
        animation.fillMode    = kCAFillModeBoth
        animation.repeatCount = Float.infinity
        return animation
    } 
}
