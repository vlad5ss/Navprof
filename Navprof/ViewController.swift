//
//  ViewController.swift
//  Navprof
//
//  Created by mac on 1/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    var segueTimer: Timer!
    var time : Float = 0.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Invalid timer if it is valid
        
        
        
        if (timer?.isValid == true) {
            timer?.invalidate()
        }
        
        
        // Double as opposed to int so we can get precise timings
        let timer_interval: Double = Double.pi
        
        // Create our timer and start it instantly
        // We want no interaction from the user necessary on this screen so we must begin things instantly
        segueTimer = Timer.scheduledTimer(timeInterval:timer_interval, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: false)
        
        
        time = 0.0
        progressBar.setProgress(0.0, animated: true)
        
        
        timer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector:#selector(ViewController.setProgress), userInfo: nil, repeats: true)
    }
    
    
    //MARK: Show progress
    @objc func setProgress() {
        time += 1.0
        progressBar.setProgress(time/10, animated: true)
        
        
        
        if time >= 10 {
            timer!.invalidate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerDidFire()
    {
        // Print so that we know it worked right
        print("timer fired, moving to new view")
        
        // Invalidate the timer because it is no longer needed
        segueTimer.invalidate()
        
        // Move to it
        self.performSegue(withIdentifier: "EndSplashSegue", sender: self)
    }
    
    
}



