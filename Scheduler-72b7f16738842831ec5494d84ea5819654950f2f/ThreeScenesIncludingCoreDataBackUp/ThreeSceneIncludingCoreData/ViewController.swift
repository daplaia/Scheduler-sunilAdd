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
    var seconds = 0 //default bar position
    var timer = Timer()
    var maxTime:Int = 100
    var startPressed = false
    var terminatePressed = false
    var initTime = 0
    
    @IBOutlet weak var BackButton: UIBarButtonItem!
    
    @IBAction func ResumeBackView(_ sender: UIBarButtonItem) {
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var timerStartButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timerScroller: UISlider!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
   // @IBOutlet weak var taskNameLabel: UILabel!
    
    
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
       let fractialTime =  Float(seconds) / Float(initTime)
       print(fractialTime)
       progressBar.setProgress(fractialTime, animated: true)
       self.view.layoutIfNeeded()
    }
        
    @IBAction func timeSliderAction(_ sender: UISlider) {
            if (startPressed == false){
                sender.isUserInteractionEnabled = true
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
        
    }
    
    
    @IBAction func StartButtonAction(_ sender: UIButton){
    
        if (initTime == 0)
        {
            return
        }
        
        if(timerStartButton.title(for: .normal) == "continue")
        {
            let Image: UIImage = UIImage(named: "1.png")!
            progressImage.image = Image
            
           
        }
       
        if(startPressed == false)
        {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            
        
            print(initTime)
            timerStartButton.setTitle("terminate", for: .normal)
           
            timerScroller.isHidden = true
            progressBar.isHidden = false
            
            
            startPressed = true
            terminatePressed = true
            return
            
        }
        
        if(terminatePressed == true)
        {
            timer.invalidate()
            progressBar.isHidden = true
            timerStartButton.setTitle("start", for: .normal)
            startPressed = false
            terminatePressed = false
            seconds = 0
            initTime = 0
            timeLabel.text = timeString(time: TimeInterval(seconds))
            timerScroller.setValue(0, animated: true)
            timerScroller.isHidden = false
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
            timerScroller.isHidden = true
            progressBar.isHidden = false
        }
        
        if(seconds <= 0)
        {
            //timerScroller.isHidden = false
            progressBar.isHidden = true
            //SAVE THE DURATION LOG TO THE SUB-TASK OBJECT
            timer.invalidate()
            seconds = 0
            if(initTime != 0)
            {
                timerStartButton.setTitle("continue", for: .normal)
            }
            
        }
        
    }
    
    
    @IBOutlet weak var InfoButton: UIBarButtonItem!
    
   
    @IBAction func ShowInfoAlert(_ sender: UIBarButtonItem){
        
        
    }

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.isHidden = true
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

class PopUpHelpViewController: UIViewController{
    
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
       
            self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
