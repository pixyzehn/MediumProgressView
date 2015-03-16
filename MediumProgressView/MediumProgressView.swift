//
//  MediumProgressView.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class MediumProgressView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
 
    convenience init(frame: CGRect, isLeft: Bool, duration: CFTimeInterval) {
        self.init(frame: frame)
        initialize(isLeft, duration: duration)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    func initialize(isLeft: Bool, duration: CFTimeInterval) {
        layer.addAnimation(mediumProgressAnimation(isLeft, duration: duration), forKey: "animation")
    }

    func mediumProgressAnimation(isLeft: Bool, duration: CFTimeInterval) -> CAAnimation {
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue   = isLeft ? -frame.size.width : frame.size.width * 2
        animation.toValue     = isLeft ? frame.size.width * 2 : -frame.size.width
        animation.duration    = duration
        animation.fillMode    = kCAFillModeBoth
        animation.repeatCount = Float.infinity
        return animation
    }
    
}
