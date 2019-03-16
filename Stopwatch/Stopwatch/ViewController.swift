//
//  ViewController.swift
//  Stopwatch
//
//  Created by administrator on 3/16/19.
//  Copyright © 2019 Jeffrey Marple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var buttonStartStop: UIButton!
    
    let stopwatch = stopWatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatch.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }

    @IBAction func buttonStartStopTimerTouched(_ sender: UIButton){
        if stopwatch.isRunning{
            stopwatch.stop()
        }else{
            stopwatch.start()
        }
    }
    
    func updateUI(){
        labelTime.text = String(format: "%.1f", stopwatch.timeCount)
        
        if stopwatch.isRunning{
            buttonStartStop.setTitle("Stop", for: .normal)
        }else{
            buttonStartStop.setTitle("Start", for: .normal)
        }

    }
}

extension ViewController: StopwatchDelegate{
    func timerUpdated() {
        updateUI()
    }
    
    
}
