//  TimerSceneViewController
//  Progress : Timer Finshed except for leave-scene-kill-automatically
//  ViewController.swift
//  timerScene
//
//  Created by Yanxi
//  Copyright © 2018 Yanxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var min = 0
    var seconds = 60 * 60 //default bar position
    var timer = Timer()
    var maxTime:Int = 100
    var startPressed = false
    var terminatePressed = false
    var initTime = 60 * 60
    
    @IBOutlet weak var timerStartButton: UIButton!
    
    
    @IBOutlet weak var timerScroller: UISlider!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    
    @IBOutlet weak var progressImage: UIImageView!
     
    
    func updateImage(){
        
       
        let interval = Int(initTime / 4)
        let Image: UIImage = UIImage(named: "1.png")!
        progressImage.image = Image
     
        if (seconds <= 1)
        {
            print("6.png")
            let Image: UIImage = UIImage(named: "6.png")!

            progressImage.image = Image
        }
        else if(seconds <= initTime - 3 * interval)
        {
            let Image: UIImage = UIImage(named: "5.png")!
            progressImage.image = Image
        }

        else if (seconds <= initTime - 2 * interval)
        {
            let Image: UIImage = UIImage(named: "3.png")!
            progressImage.image = Image
        }
            
        else if (seconds <= initTime - interval)
        {
            print("2.png")
            let Image: UIImage = UIImage(named: "2.png")!
            progressImage.image = Image
        }
            
        else
        {
            print("1.png")
            let Image: UIImage = UIImage(named: "1.png")!
            progressImage.image = Image
        }
        
    } // call this function where you want to set image.
   
    
    
    func updateSlider()
    {
       print("seconds: \(seconds), initTime: \(initTime)\n")
       let fractialTime = 120 * Float(seconds) / Float(initTime)
       print(fractialTime)
       timerScroller.setValue(fractialTime, animated: true)
       self.view.layoutIfNeeded()
    }
        
    @IBAction func timeSliderAction(_ sender: UISlider) {
            if (startPressed == false){
                min = Int(sender.value)
                seconds = min * 60
                initTime = seconds
                timeLabel.text = timeString(time: TimeInterval(seconds))
                UIView.animate(withDuration: 0.2, animations: {
                    self.timerScroller.setValue(sender.value, animated:true)
                    
                    //self.timerview.alpha = 0.75
                    self.view.layoutIfNeeded()
            })
        }
       
        else
        {
            sender.isEnabled = false
            
            
        }
        
    }
    
    
    @IBAction func StartButtonAction(_ sender: UIButton){
    
        if(timerStartButton.title(for: .normal) == "continue")
        {
            let Image: UIImage = UIImage(named: "1.png")!
            progressImage.image = Image
        }
        if(startPressed == false)
        {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            
            timerStartButton.setTitle("terminate", for: .normal)
            
            startPressed = true
            return
            
        }
        
        if(startPressed == true)
        {
            timer.invalidate()
            timerStartButton.setTitle("start", for: .normal)
            startPressed = false
            terminatePressed = false
            seconds = 60 * 60 //default
            timeLabel.text = timeString(time: TimeInterval(seconds))
            timerScroller.setValue(60, animated: true)
            return
            
        }
    
    
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @objc func updateTimer()
    {
        if (seconds > 0)
        {
            seconds -= 1
            timeLabel.text = timeString(time: TimeInterval(seconds))
            let currentTimeInMinuite = Int(seconds / 60)
            
            timerScroller.setValue(Float(currentTimeInMinuite), animated: true)
            print(currentTimeInMinuite)
            updateImage()
            updateSlider()
        }
        
        if(seconds <= 0)
        {
            //SAVE THE DURATION LOG TO THE SUB-TASK OBJECT
            timer.invalidate()
            timerStartButton.setTitle("continue", for: .normal)
            
        }
        
    }
    
    @IBOutlet weak var InfoButton: UIButton!
    
    @IBAction func ShowInfoAlert(_ sender: UIButton) {
        infoAlert()
    }
    
    func infoAlert(){
        let alert = UIAlertController(title: "Quick Tips", message: "This timer records how long you stayed forcus on a task.\n Use the slider bar to set the duration.\n Hit 'start' to start the count down. \nOnce timer is started, leaving this view (except for locking up screen) will terminate the timer automatically and the record will not be saved. \nTerminate key is availabe for 15s(milestone2)for you to kill the timer.\n Hit continue if you want to start a new session once the timer ends.", preferredStyle: UIAlertController.Style.alert)
     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
     switch action.style{
     case .default:
     print("default")
     
     case .cancel:
     print("cancel")
     
     case .destructive:
     print("destructive")
     
     
     }}))
     self.present(alert, animated: true, completion: nil)
 
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

