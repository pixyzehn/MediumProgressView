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
    
    public var progressView: MediumProgressView!
    
    public init() {
       initialize()
    }
    
    public func initialize() {
        self.position      = .Top
        self.color         = MEDIUM_COLOR
        self.height        = 4.0
        self.isLeftToRight = true
        self.duration      = 1.2
    }
        
    public static let sharedInstance = MediumProgressViewManager()

    // MARK: function
    
    public func showProgress() {
        let window = UIApplication.sharedApplication().keyWindow!
        progressView = initializeProgressViewWithFrame(window.frame)
        window.addSubview(progressView)
    }
    
    public func hideProgress() {
        progressView.removeFromSuperview()
    }
    
    // MARK: Helpers
    
    private func initializeProgressViewWithFrame(aFrame: CGRect) -> MediumProgressView {
        let aWidth = aFrame.size.width
        let aHeight = aFrame.size.height
        var frame = CGRectMake(0, 0, aWidth, height!)
        if position == .Bottom {
            frame = CGRectMake(0, aHeight - height!, aWidth, height!)
        }
        let progressView = MediumProgressView(frame: frame, isLeftToRight: isLeftToRight!, duration: duration!)
        progressView.backgroundColor = color
        return progressView
    }

}
