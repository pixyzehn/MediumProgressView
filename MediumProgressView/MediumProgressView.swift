//
//  MediumProgressView.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

protocol MediumProgressViewDelegate {
    func finishedAnimation()
}

public class MediumProgressView: UIView {
    var delegate: MediumProgressViewDelegate?
 
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
 
    convenience internal init(frame: CGRect,
                      isLeftToRight: Bool,
                           duration: CFTimeInterval,
                        repeatCount: Float) {
        self.init(frame: frame)
        progressAnimation(isLeftToRight, duration: duration, repeatCount: repeatCount)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func progressAnimation(isLeftToRight: Bool, duration: CFTimeInterval, repeatCount: Float) {
        CATransaction.begin()
        CATransaction.setCompletionBlock{ [unowned self] in
            let animation = self.layer.animationForKey("progressAnimation")
            if animation != nil {
                self.layer.removeAnimationForKey("progressAnimation")
                self.delegate?.finishedAnimation()
            }
        }

        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue           = isLeftToRight ? -frame.size.width : frame.size.width * 2
        animation.toValue             = isLeftToRight ? frame.size.width * 2 : -frame.size.width
        animation.duration            = duration
        animation.fillMode            = kCAFillModeBoth
        animation.removedOnCompletion = false
        animation.repeatCount         = repeatCount
        layer.addAnimation(animation, forKey: "progressAnimation")
        CATransaction.commit()
    } 
}
