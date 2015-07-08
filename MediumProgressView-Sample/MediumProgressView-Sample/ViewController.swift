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

    var status: Motion = .Moving
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mediumProgressViewManager = MediumProgressViewManager.sharedInstance
        mediumProgressViewManager.position      = .Top
        mediumProgressViewManager.color         = MEDIUM_COLOR
        mediumProgressViewManager.height        = 4.0
        mediumProgressViewManager.isLeftToRight = true
        mediumProgressViewManager.duration      = 1.0
        mediumProgressViewManager.showProgress()
    }
    
    @IBAction func startProgress(sender: AnyObject) {
        if status == .Stop {
            MediumProgressViewManager.sharedInstance.showProgress()
            status = .Moving
        }
    }

    @IBAction func stopProgress(sender: AnyObject) {
        if status == .Moving {
            MediumProgressViewManager.sharedInstance.hideProgress()
            status = .Stop
        }
    }
}

