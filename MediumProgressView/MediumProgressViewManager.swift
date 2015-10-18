//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

let MEDIUM_COLOR = UIColor(red:0.33, green:0.83, blue:0.44, alpha:1)

public class MediumProgressViewManager {
    public enum Position {
        case Top
        case Bottom
    }
    
    public var position: Position?
    public var color: UIColor?
    public var height: CGFloat?
    public var isLeftToRight: Bool?
    public var duration: CFTimeInterval?
    public var repeatCount: Float?
    
    public var progressView: MediumProgressView!
    
    public init() {
        self.position      = .Top
        self.color         = MEDIUM_COLOR
        self.height        = 4.0
        self.isLeftToRight = true
        self.duration      = 1.2
        self.repeatCount   = Float.infinity
    }

    public static let sharedInstance = MediumProgressViewManager()

    // MARK: function
    
    public func show() {
        let window = UIApplication.sharedApplication().keyWindow!
        progressView = initializeViewWithFrame(window.frame)
        window.addSubview(progressView)
    }
    
    public func hide() {
        progressView.removeFromSuperview()
    }
    
    // MARK: Helpers
    
    private func initializeViewWithFrame(frame: CGRect) -> MediumProgressView {
        let width = frame.size.width
        let height = frame.size.height
        var newFrame = CGRectZero
        switch position! {
            case .Top:
                newFrame = CGRectMake(0, 0, width, self.height!)
            case .Bottom:
                newFrame = CGRectMake(0, height - self.height!, width, self.height!)
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
    func finishedAnimation() {
        hide()
    }
}
