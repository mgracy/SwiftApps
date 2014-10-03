//
//  ViewController.swift
//  wantWorld
//
//  Created by  Gracy.Ma on 14-9-27.
//  Copyright (c) 2014 ___innolux___. All rights reserved.
//

import UIKit
import UIKit.UIStoryboard

class ViewController: UIViewController {
                            
    @IBOutlet var lightImageView: UIImageView!
    var timer:NSTimer?
    var lightNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeLight", userInfo: nil, repeats: true)
    }

    func changeLight() {
        lightNum++
        if(lightNum > 12) {
            lightNum = 1
        }
        var image = UIImage(named: "\(lightNum).PNG")
        lightImageView.image = image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

