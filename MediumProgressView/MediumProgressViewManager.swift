//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

public let MEDIUM_PROGRESS_COLOR = UIColor(red:0.33, green:0.83, blue:0.44, alpha:1)

public class MediumProgressViewManager {
    
    public enum Position {
        case Top
        case Bottom
    }
        
    public var position: Position?
    public var color: UIColor?
    public var height: CGFloat?
    public var isLeft: Bool             = true
    public var duration: CFTimeInterval = 1.2
    
    public var progressView: MediumProgressView?
    
    public init() {
       initialize()
    }
    
    public func initialize() {
        self.position = .Top
        self.color    = MEDIUM_PROGRESS_COLOR
        self.height   = 4.0
    }
    
    public class var sharedInstance: MediumProgressViewManager {
        struct Static {
            static let instance: MediumProgressViewManager = MediumProgressViewManager()
        }
        return Static.instance
    }

    // Internal function
    
    public func showProgressOnView(view: UIView) {
        progressView = initializeProgressViewWithFrame(view.frame)
        view.addSubview(progressView!)
    }
    
    public func hideProgressView() {
        progressView?.removeFromSuperview()
    }
    
    // Helpers
    
    func initializeProgressViewWithFrame(aFrame: CGRect) -> MediumProgressView {
        let aWidth = aFrame.size.width
        let aHeight = aFrame.size.height
        var frame: CGRect = CGRectMake(0, 0, aWidth, height!)
        if position == .Bottom {
            frame = CGRectMake(0, aHeight - height!, aWidth, height!)
        }
        var progressView = MediumProgressView(frame: frame, isLeft: isLeft, duration: duration)
        progressView.backgroundColor = color
        return progressView
    }

}
