//
//  ResultViewController.swift
//  wantWorld
//
//  Created by  Gracy.Ma on 14-9-27.
//  Copyright (c) 2014 ___innolux___. All rights reserved.
//

import Foundation
import UIKit
class ResultViewController: UIViewController {
    
    var timeNum = 0
    var totalNum = 0
    var rightNum = 0
    var wrongNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var backImageView = UIImageView()
        backImageView.frame = CGRectMake(0,0,480,320)
        var image = UIImage(named:"result.png")
        backImageView.image = image
        self.view.addSubview(backImageView)
       
        
        var lblTime = UILabel()
        lblTime.frame = CGRectMake(100,100,320,40)
        lblTime.text = "答题用时：\(timeNum)"
        lblTime.textColor = UIColor.redColor()
        self.view.addSubview(lblTime)
       
        
        var lblTotal = UILabel()
        lblTotal.frame = CGRectMake(100,140,320,40)
        lblTotal.text = "答题总数：\(totalNum)"
        lblTotal.textColor = UIColor.redColor()
        self.view.addSubview(lblTotal)
        
        var lblRight = UILabel()
        lblRight.frame = CGRectMake(100,180,320,40)
        lblRight.text = "答对题数：\(rightNum)"
        lblRight.textColor = UIColor.redColor()
        self.view.addSubview(lblRight)
        
        
        var lblWrong = UILabel()
        lblWrong.frame = CGRectMake(100,220,320,40)
        lblWrong.text = "答错题数：\(wrongNum)"
        lblWrong.textColor = UIColor.redColor()
        self.view.addSubview(lblWrong)
        
        var backButton = UIButton()
        backButton.frame = CGRectMake(5,140,50,50)
        backButton.setImage(UIImage(named:"return.png"),forState:.Normal)
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: "turnBack", forControlEvents: .TouchUpInside)

    }
    
    func turnBack() {
       self.dismissViewControllerAnimated(false, nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
