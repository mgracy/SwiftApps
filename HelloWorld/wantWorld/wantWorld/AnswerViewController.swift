//
//  AnswerViewController.swift
//  wantWorld
//
//  Created by  Gracy.Ma on 14-9-27.
//  Copyright (c) 2014 ___innolux___. All rights reserved.
//

import Foundation
import UIKit
class AnswerViewController: UIViewController {
    var currentLevel = 0
    var currentQuestion = 0
 let allQuestions = [
        ["2004年奥运会在哪个城市举例", "A 北京" ,"B 里约热内卢", "C 雅典" ,"D 伦敦"],
        ["2008年奥运会在哪个城市举例", "A 北京" ,"B 里约热内卢", "C 雅典" ,"D 伦敦"],
        ["2012年奥运会在哪个城市举例", "A 北京" ,"B 里约热内卢", "C 雅典" ,"D 伦敦"],
        ["2016年奥运会在哪个城市举例", "A 北京" ,"B 里约热内卢", "C 雅典" ,"D 伦敦"]
    ]
  /*
    let allQuestions = [
        ["2+3", "A 2" ,"B 3", "C 4" ,"D 5"],
        ["2-2", "A 0" ,"B 1", "C 2" ,"D 3"],
        ["4-2", "A 1" ,"B 2", "C 3" ,"D 4"],
        ["2+0", "A 0" ,"B 1", "C 2" ,"D 3"],
        ["4+2", "A 2" ,"B 4", "C 6" ,"D 8"],
        ["6-5", "A 0" ,"B 1", "C 2" ,"D 3"],
        ["6-1", "A 2" ,"B 3", "C 4" ,"D 5"],
        ["3+3", "A 2" ,"B 4", "C 6" ,"D 8"],
        ["1+5", "A 2" ,"B 4", "C 6" ,"D 8"]
    ]
  */
    let rightAnswer = [3, 1, 4, 2]
  //  let rightAnswer = [4, 1, 2, 3, 3, 2, 4, 3, 3]
            var buttonA = UIButton()
            var buttonB = UIButton()
            var buttonC = UIButton()
            var buttonD = UIButton()
        var lblbuttonA = UILabel()
        var lblbuttonB = UILabel()
        var lblbuttonC = UILabel()
        var lblbuttonD = UILabel()
    var lblQuestion = UILabel()
    
    var questionUpdateTimer:NSTimer?
    var countDownTimer:NSTimer?
    var timeNum = 60
    var rightNum = 0
    var totalNum = 4
    var lblTime = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          println("AnswerViewController -> viewDidLoad")

        var backImageView = UIImageView()
        backImageView.frame = CGRectMake(0,0,480,320)
        var image = UIImage(named:"answerSheetBG.jpeg")
        backImageView.image = image
        self.view.addSubview(backImageView)
        
        var backButton = UIButton()
        backButton.frame = CGRectMake(5,140,50,50)
        backButton.setImage(UIImage(named:"return.png"),forState:.Normal)
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: "turnBack", forControlEvents: .TouchUpInside)
        
        lblQuestion.frame = CGRectMake(80, 100, 320, 80)
        lblQuestion.text = allQuestions[0][0]
        lblQuestion.textAlignment = .Center
        self.view.addSubview(lblQuestion)

        
        buttonA.frame = CGRectMake(30, 210, 220, 40)
        buttonA.setImage(UIImage(named:"usualState.png"), forState: .Normal)
        buttonA.tag = 1
        self.view.addSubview(buttonA)
        buttonA.addTarget(self, action: "judgeResult:", forControlEvents: .TouchUpInside)
        
    
        lblbuttonA.frame = CGRectMake(30, 210, 220, 40)
        lblbuttonA.text = allQuestions[0][1]
        lblbuttonA.textAlignment = .Center
        lblbuttonA.textColor = UIColor.whiteColor()
        self.view.addSubview(lblbuttonA)
   
        
        buttonB.frame = CGRectMake(230, 210, 220, 40)
        buttonB.setImage(UIImage(named:"usualState.png"), forState: .Normal)
          buttonB.tag = 2
        self.view.addSubview(buttonB)
        buttonB.addTarget(self, action: "judgeResult:", forControlEvents: .TouchUpInside)
 
        lblbuttonB.frame = CGRectMake(230, 210, 220, 40)
        lblbuttonB.text = allQuestions[0][2]
        lblbuttonB.textAlignment = .Center
        lblbuttonB.textColor = UIColor.whiteColor()
        self.view.addSubview(lblbuttonB)
   
        
        buttonC.frame = CGRectMake(30, 260, 220, 40)
        buttonC.setImage(UIImage(named:"usualState.png"), forState: .Normal)
          buttonC.tag = 3
        self.view.addSubview(buttonC)
        buttonC.addTarget(self, action: "judgeResult:", forControlEvents: .TouchUpInside)

        lblbuttonC.frame = CGRectMake(30, 260, 220, 40)
        lblbuttonC.text = allQuestions[0][3]
        lblbuttonC.textAlignment = .Center
        lblbuttonC.textColor = UIColor.whiteColor()
        self.view.addSubview(lblbuttonC)

        
        buttonD.frame = CGRectMake(230, 260, 220, 40)
        buttonD.setImage(UIImage(named:"usualState.png"), forState: .Normal)
          buttonD.tag = 4
        self.view.addSubview(buttonD)
        buttonD.addTarget(self, action: "judgeResult:", forControlEvents: .TouchUpInside)

        lblbuttonD.frame = CGRectMake(230, 260, 220, 40)
        lblbuttonD.text = allQuestions[0][4]
        lblbuttonD.textAlignment = .Center
        lblbuttonD.textColor = UIColor.whiteColor()
        self.view.addSubview(lblbuttonD)
        
        
        lblTime.frame = CGRectMake(50, 30, 80, 30)
        lblTime.text = "00:\(timeNum)"
        lblTime.backgroundColor = UIColor.blueColor()
        lblTime.textColor = UIColor.whiteColor()
        lblTime.textAlignment = .Center
        self.view.addSubview(lblTime)
    }
    
    func setOriginalState() {
        timeNum = 60
        currentQuestion = 0
        rightNum = 0
        buttonA.setImage(UIImage(named:"usualState.png"), forState: .Normal)
         buttonB.setImage(UIImage(named:"usualState.png"), forState: .Normal)
         buttonC.setImage(UIImage(named:"usualState.png"), forState: .Normal)
         buttonD.setImage(UIImage(named:"usualState.png"), forState: .Normal)
        
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        lblQuestion.text = allQuestions[currentQuestion][0]
        lblbuttonA.text = allQuestions[currentQuestion][1]
        lblbuttonB.text = allQuestions[currentQuestion][2]
        lblbuttonC.text = allQuestions[currentQuestion][3]
        lblbuttonD.text = allQuestions[currentQuestion][4]
        lblTime.text = "00:\(timeNum)"
    }
    
    func judgeResult(sender:UIButton) {
        
        if sender.tag == rightAnswer[currentQuestion] {
            sender.setImage(UIImage(named:"rightAns.png"),forState:.Normal)
            rightNum++
        }
        else
        {
            sender.setImage(UIImage(named:"wrongAns.png"),forState:.Normal)
        }
        
        buttonA.enabled = false
        buttonB.enabled = false
        buttonC.enabled = false
        buttonD.enabled = false
        
        //过1秒钟，自动更新题目和选项
        //performSelector(<#aSelector: Selector#>) 
        questionUpdateTimer?.invalidate()
        questionUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self,
                selector:"updateQuestion",userInfo:sender,repeats:false)
    }
    
    func updateTimer() {
        timeNum--

        if timeNum <= 0
        {
            countDownTimer?.invalidate()
            timeNum = 20
            //弹出警告框: UIAlertView
            var alert = UIAlertController(title: "提示", message: "亲，时间已到！", preferredStyle: .Alert)
            var actionYes = UIAlertAction(title: "重做", style: .Default, handler: { act in self.countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true) })
            var actionNo = UIAlertAction(title: "不重做", style: .Default, handler: {act in  var rvc = ResultViewController()
                rvc.timeNum = 60
                rvc.rightNum = self.rightNum
                rvc.totalNum = self.totalNum
                rvc.wrongNum = self.totalNum - self.rightNum
                if rvc.rightNum > rvc.totalNum / 2 {
                    allLevels[self.currentLevel] = 1
                    writeAllKeys()
                }
                self.presentViewController(rvc, animated: true, completion: nil)})
            alert.addAction(actionYes)
             alert.addAction(actionNo)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if timeNum < 10 {
             lblTime.text = "00:0\(timeNum)"
        }
        else
        {
            lblTime.text = "00:\(timeNum)"
        }
        
    }
    
    func updateQuestion() {
        currentQuestion++
        if currentQuestion >= allQuestions.count
        {
            var rvc = ResultViewController()
            rvc.timeNum = 60 - self.timeNum
            rvc.rightNum = self.rightNum
            rvc.totalNum = self.totalNum
            rvc.wrongNum = self.totalNum - self.rightNum
            if rvc.rightNum > rvc.totalNum / 2 {
                currentLevel++
                allLevels[currentLevel] = 1
                 println("AnswerViewController updateQuestion currentLevel:\(currentLevel)")
                println("AnswerViewController updateQuestion allLevels:\(allLevels)")
                writeAllKeys()
            }
             self.presentViewController(rvc, animated: true, completion: nil)
            return
        }
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        lblQuestion.text = allQuestions[currentQuestion][0]
        lblbuttonA.text = allQuestions[currentQuestion][1]
           lblbuttonB.text = allQuestions[currentQuestion][2]
           lblbuttonC.text = allQuestions[currentQuestion][3]
           lblbuttonD.text = allQuestions[currentQuestion][4]
        
        var sender = questionUpdateTimer?.userInfo as UIButton
        sender.setImage(UIImage(named:"usualState.png"), forState: .Normal)


    }
    
    func turnBack() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when the view is about to made visible. Default does nothing
    override  func viewWillAppear(animated: Bool){
                countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        println("AnswerViewController -> viewWillAppear")
        setOriginalState()
    }
    
    // Called when the view has been fully transitioned onto the screen. Default does nothing
    override func viewDidAppear(animated: Bool)  {
        println("AnswerViewController -> viewDidAppear")
    }
    
    // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
    override func viewWillDisappear(animated: Bool)
    {
        println("AnswerViewController -> viewWillDisappear")
        countDownTimer?.invalidate()
    }
    
    // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
    override func viewDidDisappear(animated: Bool)
    {
        println("AnswerViewController -> viewDidDisappear")
    }

    
    
}
