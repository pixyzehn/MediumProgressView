//
//  MediumProgressView.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

protocol MediumProgressViewDelegate: class {
    func mediumProgressViewDidFinishAnimation(_ view: MediumProgressView)
}

open class MediumProgressView: UIView {
    weak var delegate: MediumProgressViewDelegate?
 
    override fileprivate init(frame: CGRect) {
        super.init(frame: frame)
    }
 
    convenience internal init(
        frame: CGRect,
        isLeftToRight: Bool,
        duration: CFTimeInterval,
        repeatCount: Float
    ) {
        self.init(frame: frame)
        progressAnimation(isLeftToRight, duration: duration, repeatCount: repeatCount)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    fileprivate func progressAnimation(_ isLeftToRight: Bool, duration: CFTimeInterval, repeatCount: Float) {
        CATransaction.begin()

        CATransaction.setCompletionBlock{ [weak self] in
            guard let strongSelf = self else { return }
            let animation = strongSelf.layer.animation(forKey: "progressAnimation")
            if animation != nil {
                strongSelf.layer.removeAnimation(forKey: "progressAnimation")
                strongSelf.delegate?.mediumProgressViewDidFinishAnimation(strongSelf)
            }
        }

        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = isLeftToRight ? -frame.size.width : frame.size.width * 2
        animation.toValue = isLeftToRight ? frame.size.width * 2 : -frame.size.width
        animation.duration = duration
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        animation.repeatCount = repeatCount
        layer.add(animation, forKey: "progressAnimation")
        CATransaction.commit()
    } 
}
