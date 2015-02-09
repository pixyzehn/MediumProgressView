//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

let MEDIUM_PROGRESS_COLOR = UIColor(red:0.33, green:0.83, blue:0.44, alpha:1)

class MediumProgressViewManager {
    
    enum Position {
        case Top
        case Bottom
    }
    
    enum Direction {
        case Left  // From Left to Right
        case Right // From Right to Left
    }
    
    var position: Position?
    var color: UIColor?
    var height: CGFloat?
    var isLeft: Bool             = true
    var duration: CFTimeInterval = 1.2
    
    var progressView: MediumProgressView?
    
    init() {
       initialize()
    }
    
    func initialize() {
        self.position = Position.Top
        self.color    = MEDIUM_PROGRESS_COLOR
        self.height   = 4.0
    }
    
    class var sharedInstance: MediumProgressViewManager {
        struct Static {
            static let instance: MediumProgressViewManager = MediumProgressViewManager()
        }
        return Static.instance
    }

    // Internal function
    
    internal func showProgressOnView(view: UIView) {
        progressView = initializeProgressViewWithFrame(view.frame)
        view.addSubview(progressView!)
    }
    
    internal func hideProgressView() {
        progressView?.removeFromSuperview()
    }
    
    // Helpers
    
    func initializeProgressViewWithFrame(aFrame: CGRect) -> MediumProgressView {
        let aWidth = aFrame.size.width
        let aHeight = aFrame.size.height
        var frame: CGRect = CGRectMake(0, 0, aWidth, height!)
        if position == Position.Bottom {
            frame = CGRectMake(0, aHeight - height!, aWidth, height!)
        }
        var progressView = MediumProgressView(frame: frame, isLeft: isLeft, duration: duration)
        progressView.backgroundColor = color
        return progressView
    }
}
