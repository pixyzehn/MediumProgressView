//
//  ViewController.swift
//  MediumProgressView-Sample
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var holder: UIView!
    
    var progressViewManager: MediumProgressViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressViewManager = MediumProgressViewManager.sharedInstance
        progressViewManager?.position = .center
        progressViewManager?.show(on: holder)
    }
    
    @IBAction func startProgress(_ sender: AnyObject) {
        progressViewManager?.show(on: holder)
    }

    @IBAction func stopProgress(_ sender: AnyObject) {
        progressViewManager?.hide()
    }
}

