//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

public let MEDIUM_COLOR = UIColor(red:0.33, green:0.83, blue:0.44, alpha:1)

open class MediumProgressViewManager {
    public enum Position {
        case top
        case bottom
        case center
    }
    
    open var position: Position = .top
    open var color: UIColor = MEDIUM_COLOR
    open var height: CGFloat = 4.0
    open var isLeftToRight: Bool = true
    open var duration: CFTimeInterval = 1.2
    open var repeatCount = Float.infinity
    open var progressView: MediumProgressView?
    
    public init() {}

    open static let sharedInstance = MediumProgressViewManager()

    // MARK: function
    
    open func show() {
        if progressView == nil {
            let window = UIApplication.shared.keyWindow!
            progressView = createMediumProgressView(window.frame)
            window.addSubview(progressView!)
        }
    }
    
    open func show(on view: UIView) {
        if progressView == nil {
            progressView = createMediumProgressView(view.frame)
            view.addSubview(progressView!)
        }
    }
    
    open func hide() {
        progressView?.removeFromSuperview()
        progressView = nil
    }
    
    // MARK: Helpers
    
    fileprivate func createMediumProgressView(_ frame: CGRect) -> MediumProgressView {
        let newWidth  = frame.size.width
        let newHeight = frame.size.height
        let newFrame: CGRect

        switch position {
            case .top:
                newFrame = CGRect(x: 0, y: 0, width: newWidth, height: height)
            case .bottom:
                newFrame = CGRect(x: 0, y: newHeight - height, width: newWidth, height: height)
            case .center:
                newFrame = CGRect(x: 0, y: (newHeight - height)/2, width: newWidth, height: height)
        }

        let progressView = MediumProgressView(
            frame: newFrame,
            isLeftToRight: isLeftToRight,
            duration: duration,
            repeatCount: repeatCount
        )
        progressView.delegate = self
        progressView.backgroundColor = color
        return progressView
    }
}

extension MediumProgressViewManager: MediumProgressViewDelegate {
    func mediumProgressViewDidFinishAnimation(_ view: MediumProgressView) {
        hide()
    }
}
