//
//  ChooseViewController.swift
//  wantWorld
//
//  Created by  马桂新 on 14-9-27.
//  Copyright (c) 2014年 ___innolux___. All rights reserved.
//

import Foundation
import UIKit

var allLevels = [1, 0, 0, 0, 0, 0]

func writeAllKeys() {
    let ud = NSUserDefaults.standardUserDefaults()
    for i in 0..<6 {
        ud.setInteger(allLevels[i], forKey: "Level\(i)")
    }
}

func readAllKeys() {
    var ud = NSUserDefaults.standardUserDefaults()
    for i in 0..<6 {
      allLevels[i] = ud.integerForKey("Level\(i+1)")
    }
}

class ChooseViewController: UIViewController {
  
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var button4: UIButton!
    
    @IBOutlet var button5: UIButton!
    
    @IBOutlet var button6: UIButton!
    
    var allButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    /*
        allButtons += [Button]button1;
        allButtons += [Button]button2;
        allButtons += [Button]button3;
        allButtons += [Button]button4;
        allButtons += [Button]button5;
        allButtons += [Button]button6;

        allButtons[0] = button1
        allButtons[1] = button2
        allButtons[2] = button3
        allButtons[3] = button4
        allButtons[4] = button5
        allButtons[5] = button6
        */
        allButtons = [button1, button2, button3, button4, button5, button6]
       
        println("ChooseViewController pick second level:\(allLevels)")
        readAllKeys()
        allLevels[0] = 1
        var str = NSTemporaryDirectory()
        println(str)

          /*
        allButtons += button1;
        allButtons += button2;
        allButtons += button3;
        allButtons += button4;
        allButtons += button5;
        allButtons += button6;
       allButtons += button1
        allButtons[1] = button2
        allButtons[2] = button3
        allButtons[3] = button4
        allButtons[4] = button5
        allButtons[5] = button6
        */
    }
    
    @IBAction func turnAnswerVC(sender : AnyObject) {
        let btn = sender as UIButton
        let btnTag = btn.tag
        if allLevels[btnTag-1] == 1
        {
            var vc = AnswerViewController()
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else{
            println("ChooseViewController >> btnTag:\(btnTag)")
                 println("ChooseViewController >> allLevels:\(allLevels)")
            var alert = UIAlertController(title: "提示", message: "亲，你上一关还没过呢！", preferredStyle: .Alert)
            var actionYes = UIAlertAction(title: "YES", style: .Default,   nil)
           
            alert.addAction(actionYes)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        var ansVC = AnswerViewController()
        self.presentViewController(ansVC, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
  
        for i in 0..<6
        {
            if allLevels[i] == 1
            {
                allButtons[i].setImage(UIImage(named: ""),forState:.Normal)
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
