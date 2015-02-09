//
//  ViewController.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var mediumProgressViewManager      = MediumProgressViewManager.sharedInstance
        mediumProgressViewManager.position = .Bottom // Default is top.
        mediumProgressViewManager.color    = MEDIUM_PROGRESS_COLOR // Default is UIColor(red:0.33, green:0.83, blue:0.44, alpha:1).
        mediumProgressViewManager.duration = 1.0  // Default is 1.2.
        mediumProgressViewManager.isLeft   = true // Default is true.
        mediumProgressViewManager.height   = 4.0 // Defauls is 4.0.
        mediumProgressViewManager.showProgressOnView(view)
    }

}
