//
//  ViewController.swift
//  MediumProgressView-Sample
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Motion {
        case Moving
        case Stop
    }

    //var mediumProgressViewManager: MediumProgressViewManager?
    var status: Motion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mediumProgressViewManager = MediumProgressViewManager.sharedInstance
        mediumProgressViewManager.position = .Top // Default is top.
        mediumProgressViewManager.color    = MEDIUM_PROGRESS_COLOR // Default is UIColor(red:0.33, green:0.83, blue:0.44, alpha:1).
        mediumProgressViewManager.height   = 4.0 // Default is 4.0.
        mediumProgressViewManager.isLeft   = true // Default is true.
        mediumProgressViewManager.duration = 1.0  // Default is 1.2.
        
        status = .Moving
        mediumProgressViewManager.showProgressOnView(view)
    }
    
    @IBAction func startProgress(sender: AnyObject) {
        if status == .Stop {
            MediumProgressViewManager.sharedInstance.showProgressOnView(view)
            status = .Moving
        }
    }

    @IBAction func stopProgress(sender: AnyObject) {
        if status == .Moving {
            MediumProgressViewManager.sharedInstance.hideProgressView()
            status = .Stop
        }
    }
    
}

