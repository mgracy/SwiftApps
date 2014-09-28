//
//  ChooseViewController.swift
//  wantWorld
//
//  Created by  马桂新 on 14-9-27.
//  Copyright (c) 2014年 ___innolux___. All rights reserved.
//

import Foundation
import UIKit
class ChooseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    @IBAction func turnAnswerVC(sender : AnyObject) {
        var ansVC = AnswerViewController()
        self.presentViewController(ansVC, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
