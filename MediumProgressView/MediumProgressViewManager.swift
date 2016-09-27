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
        case top, bottom
    }
    
    open var position: Position?
    open var color: UIColor?
    open var height: CGFloat?
    open var isLeftToRight: Bool?
    open var duration: CFTimeInterval?
    open var repeatCount: Float?
    
    open var progressView: MediumProgressView?
    
    public init() {
        self.position      = .top
        self.color         = MEDIUM_COLOR
        self.height        = 4.0
        self.isLeftToRight = true
        self.duration      = 1.2
        self.repeatCount   = Float.infinity
    }

    open static let sharedInstance = MediumProgressViewManager()

    // MARK: function
    
    open func show() {
        if progressView == nil {
            let window = UIApplication.shared.keyWindow!
            progressView = createMediumProgressView(window.frame)
            window.addSubview(progressView!)
        }
    }
    
    open func hide() {
        progressView?.removeFromSuperview()
        progressView = nil
    }
    
    // MARK: Helpers
    
    fileprivate func createMediumProgressView(_ frame: CGRect) -> MediumProgressView {
        guard let position = position, let height = height else {
            return MediumProgressView()
        }
        
        let newWidth  = frame.size.width
        let newHeight = frame.size.height
        let newFrame: CGRect

        switch position {
            case .top:
                newFrame = CGRect(x: 0, y: 0, width: newWidth, height: height)
            case .bottom:
                newFrame = CGRect(x: 0, y: newHeight - height, width: newWidth, height: height)
        }

        let progressView = MediumProgressView(frame: newFrame,
                                      isLeftToRight: isLeftToRight!,
                                           duration: duration!,
                                        repeatCount: repeatCount!)
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
